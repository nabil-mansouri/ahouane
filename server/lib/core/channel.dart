part of 'core.dart';

class FutureMessageReader extends DelegatingFuture<MessageReader> {
  Future<RouteContext> _context;
  final Completer<MessageReader> _completer;
  FutureMessageReader._(this._context, Completer<MessageReader> completer)
      : _completer = completer,
        super(completer.future);
  FutureMessageReader.create(Future<RouteContext> context) : this._(context, Completer<MessageReader>.sync());

  Future<RouteContext> get routeContext => _context;

  void finish(MessageReader reader) async {
    _completer.complete(reader);
  }

  void error(dynamic error) {
    _completer.completeError(error);
  }

  void merge(FutureMessageReader other) {
    _context = other._context;
    other.then((e) => _completer.complete(e));
    other.catchError((e) => _completer.completeError(e));
    return;
  }
}

abstract class Endpoints<INPUT, OUTPUT, T extends Endpoint> with ServerApplicationAware {
  final endpoints = <T>[];
  Endpoints(List<Endpoint> endpoints) {
    this.endpoints.addAll(endpoints.where(checkType).cast<T>());
    this.endpoints.sort((a, b) => Comparable.compare(a, b));
  }
  Endpoints filter(RouteContext context) {
    endpoints.removeWhere((element) => !element.accept(context));
    return this;
  }

  bool checkType(Endpoint e) => true;
  bool get isEmpty => endpoints.isEmpty;
}

class Interceptors extends Endpoints<MessageReader, MessageWritter, ChannelInterceptor> {
  static final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(Interceptors);
  Interceptors(List<Endpoint> endpoints) : super(endpoints);
  @override
  bool checkType(Endpoint e) => e is ChannelInterceptor;
  Future<Interceptors> _doCall(RouteContext context, MessageReader request, InterceptorType type) async {
    context.put(kRouteContextKeys.interceptorType(), type);
    for (final endpoint in endpoints) {
      if (endpoint.acceptType(type)) {
        try {
          if (!context.stopped) await endpoint.onReceive(context);
        } catch (e) {
          context.onError(e);
        }
      }
    }
    return this;
  }

  Future<Interceptors> onEmpty(RouteContext context, MessageReader request) => _doCall(context, request, InterceptorType.Empty);

  Future<Interceptors> onBefore(RouteContext context, MessageReader request) => _doCall(context, request, InterceptorType.Before);

  Future<Interceptors> onError(RouteContext context, MessageReader request) async {
    try {
      await _doCall(context, request, InterceptorType.Error);
    } catch (e, stacktrace) {
      logger.error(kLogKeys.channelOnErrorFail(), error: e, stacktrace: stacktrace);
    }
    return this;
  }

  Future<Interceptors> onAfter(RouteContext context, MessageReader request) async {
    try {
      await _doCall(context, request, InterceptorType.After);
    } catch (e, stacktrace) {
      logger.error(kLogKeys.channelOnAfterFail(), error: e, stacktrace: stacktrace);
    }
    return this;
  }
}

class Services extends Endpoints<MessageReader, MessageWritter, ChannelService> {
  Services(List<Endpoint> endpoints) : super(endpoints);
  @override
  bool checkType(Endpoint e) => e is ChannelService;
  Future<Services> onReceive(RouteContext context) async {
    final futures = <Future>[];
    for (final endpoint in endpoints) {
      try {
        if (!context.stopped) {
          if (endpoint.sequential) {
            await endpoint.onReceive(context);
          } else {
            futures.add(endpoint.onReceive(context));
          }
        }
      } catch (e) {
        context.onError(e);
      }
    }
    try {
      await Future.wait(futures);
    } catch (e) {
      context.onError(e);
    }
    return this;
  }
}

class Channel with ServerApplicationAware implements Activable {
  int _counter = 0;
  final Router router;
  static final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(Channel);
  final endpoins = <Endpoint>{};
  Channel(this.router);
  Future<Channel> register(String route, Endpoint endpoint, {bool internal = false}) async {
    if (internal == true) {
      route = '_internal_/$route';
    } else {
      route = StringUtils.removeStart(route, '_internal_/');
    }
    endpoint.priority = _counter++;
    router.register(route, endpoint);
    endpoins.add(endpoint);
    if (application().isStarted) {
      await endpoint.start();
    }
    return this;
  }

  Future<Channel> unregister(String route, Endpoint endpoint) async {
    router.unregister(route, endpoint);
    await endpoint.stop();
    endpoins.remove(endpoint);
    return this;
  }

  Future<MessageReader> _doSend(RouteContext routeContext, Services services) async {
    final route = routeContext.route;
    final request = routeContext.input;
    final response = routeContext.output;
    final eInterceptors = router.find(kEndpointTypes.interceptor(), route, emptyIfNotMatch: false);
    final interceptors = Interceptors(eInterceptors.endpoints)..filter(routeContext);
    services.filter(routeContext);
    try {
      await routeContext.onBegin();
      if (services.isEmpty) {
        await interceptors.onEmpty(routeContext, request);
        return response.asReader();
      }
      await interceptors.onBefore(routeContext, request);
      await services.onReceive(routeContext);
      routeContext.finish(true);
    } catch (e) {
      routeContext.finish(false, error: e);
      if (routeContext.shouldCatchError) {
        await interceptors.onError(routeContext, request);
      }
    } finally {
      if (routeContext.shouldFinalize) {
        await interceptors.onAfter(routeContext, request);
      }
    }
    if (routeContext.shouldTerminate) {
      await routeContext.onTerminate();
    }
    try {
      if (routeContext.shouldReroute) {
        final res = send(routeContext.rerouteDestination, request);
        return res;
      }
    } catch (e, stacktrace) {
      logger.error(kLogKeys.channelReroutingFailed(), error: e, stacktrace: stacktrace);
    }
    return response.asReader();
  }

  FutureMessageReader send(String route, MessageReader request) {
    final competerContext = Completer<RouteContext>.sync();
    final future = FutureMessageReader.create(competerContext.future);
    request.createResponse().then((response) {
      final routerContext = router.find(kEndpointTypes.service(), route);
      final services = Services(routerContext.endpoints);
      final routeContext = RouteContext(routerContext, request, response);
      competerContext.complete(routeContext);
      _doSend(
        routeContext,
        services,
      ).then((value) => future.finish(value)).catchError((error) => future.error(error));
      return future;
    }).catchError((e) {
      competerContext.completeError(e);
      future.error(e);
    });
    return future;
  }

  @override
  Future<void> start() async {
    final copy = [...endpoins];
    for (final e in copy) {
      await e.start();
    }
  }

  @override
  Future<void> stop() async {
    final copy = [...endpoins];
    for (final e in copy) {
      await e.stop();
    }
  }
}

class ChannelModule extends ServerModule {
  ChannelModule._(ServerApplication application) : super(application);
  Channel usingRouter(Router router) => application.context().put(kApplicationContextKeys.channel(), create(router));

  Channel defaultChannel(TenantConfig tenant) {
    return application.context().getOrSet(kApplicationContextKeys.channel(tenant.defaut ? null : tenant.id), () => create());
  }

  Channel create([Router router]) {
    return Channel(router ?? application.router().create());
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    for (final tenant in tenants) {
      await defaultChannel(tenant).start();
    }
  }

  @override
  Future<void> onStop(bool reloading, List<TenantConfig> tenants) async {
    for (final tenant in tenants) {
      await defaultChannel(tenant).stop();
    }
  }
}
