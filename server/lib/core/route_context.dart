part of 'core.dart';

class RouteContextKey<BODY> extends ContextKey<BODY> {
  const RouteContextKey(String name) : super(name);
}

class RouteContextKeys {
  const RouteContextKeys();
  RouteContextKey<InterceptorType> interceptorType() =>
      RouteContextKey<InterceptorType>('interceptorType');
  RouteContextKey<List<EndpointException>> skippedExceptions() =>
      RouteContextKey<List<EndpointException>>('skippedExceptions');
  RouteContextKey<EndpointException> lastException() =>
      RouteContextKey<EndpointException>('lastException');
}

abstract class ClosableMessage {
  Future<void> onBegin();
  Future<void> onTerminate();
}

const kRouteContextKeys = RouteContextKeys();
enum RoutingStatus { Running, Success, Failed }

class _RouteContextBehaviour with ContextBehaviour<RouteContextKey> {
  final Storage<String> _storage = Storage.inMemory();
  @override
  Storage<String> storage() => _storage;
  @override
  T getByKey<T>(RouteContextKey<T> key, {T Function() orValue}) =>
      super.getByKey(key, orValue: orValue);
  @override
  T getOrSet<T>(RouteContextKey<T> key, T Function() generate) =>
      super.getOrSet(key, generate);
  @override
  T put<T>(RouteContextKey<T> key, T value) => super.put(key, value);
}

class RouteContext {
  final RouterContext routerContext;
  final MessageReader input;
  final MessageWritter output;
  var _stopped = false;
  var _error;
  var _status = RoutingStatus.Running;
  final _context = _RouteContextBehaviour();
  RouteContext(
    this.routerContext,
    this.input,
    this.output,
  );
  Map<String, String> get routeParams => routerContext.params;
  dynamic get error => _error;
  bool get stopped => _stopped;
  bool get succeed => _status == RoutingStatus.Success;
  bool get failed => _status == RoutingStatus.Failed;
  bool get shouldCatchError {
    final last = getByKey<EndpointException>(kRouteContextKeys.lastException());
    if (last == null) return true;
    return last.shouldCallErrorInterceptors;
  }

  String get route => routerContext.route;
  String get lastRouteSegment =>
      routeSegments.isEmpty ? '' : routeSegments.last;
  List<String> get routeSegments => routerContext.segments;

  bool get shouldTerminate {
    final last = getByKey<EndpointException>(kRouteContextKeys.lastException());
    if (last == null) return true;
    return last.shouldCallTerminateCallback;
  }

  bool get shouldReroute {
    final last = getByKey<EndpointException>(kRouteContextKeys.lastException());
    if (last == null) return false;
    return last is RerouteChannelException;
  }

  String get rerouteDestination {
    final last = getByKey<EndpointException>(kRouteContextKeys.lastException());
    return (last as RerouteChannelException).destination;
  }

  bool get shouldFinalize {
    final last = getByKey<EndpointException>(kRouteContextKeys.lastException());
    if (last == null) return true;
    return last.shouldCallAfterInterceptors;
  }

  void reroute(
    String route, {
    bool shouldCallErrorInterceptors = false,
    bool shouldCallAfterInterceptors = false,
    bool shouldCallTerminateCallback = false,
  }) {
    throw RerouteChannelException(route,
        shouldCallAfterInterceptors: shouldCallAfterInterceptors,
        shouldCallErrorInterceptors: shouldCallErrorInterceptors,
        shouldCallTerminateCallback: shouldCallTerminateCallback);
  }

  void skip() => throw SkipChannelException();
  void stop({dynamic error}) => throw StopChannelException(original: error);
  void finish(bool success, {dynamic error}) {
    _status = success ? RoutingStatus.Success : RoutingStatus.Failed;
    _error = error;
  }

  RouteContext onError(dynamic error) {
    if (error is EndpointException) {
      if (error.shouldStopRouting) {
        _stopped = true;
        put<EndpointException>(kRouteContextKeys.lastException(), error);
      } else {
        getOrSet<List<EndpointException>>(kRouteContextKeys.skippedExceptions(),
            () => <EndpointException>[]).add(error);
      }
    } else {
      throw error;
    }
    return this;
  }

  Future<RouteContext> onBegin() async {
    if (input is ClosableMessage) {
      await (input as ClosableMessage).onBegin();
    }
    if (output is ClosableMessage) {
      await (output as ClosableMessage).onBegin();
    }
    return this;
  }

  Future<RouteContext> onTerminate() async {
    if (input is ClosableMessage) {
      await (input as ClosableMessage).onTerminate();
    }
    if (output is ClosableMessage) {
      await (output as ClosableMessage).onTerminate();
    }
    return this;
  }

  T put<T>(RouteContextKey<T> key, T value) => _context.put(key, value);
  void clear() => _context.clear();
  bool containsKey(RouteContextKey key) => _context.containsKey(key);
  T getByKey<T>(RouteContextKey<T> key, {T Function() orValue}) =>
      _context.getByKey<T>(key, orValue: orValue);
  T getOrSet<T>(RouteContextKey<T> key, T Function() orValue) =>
      _context.getOrSet<T>(key, orValue);
}
