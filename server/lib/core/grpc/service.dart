part of 'grpc.dart';

class GrpcServiceError implements Exception {
  final String code;
  final dynamic details;
  final StackTrace originalStackTrace;
  GrpcServiceError(this.code, this.details, [this.originalStackTrace]) : super();
  @override
  String toString() {
    return '$code => ${details?.toString()}';
  }
}

abstract class GrpcService implements Activable, Service {
  final allMethods = <String>[];
  final Map<String, ServiceMethod> _$methods = {};
  String get route => '/${$name}/{method}';
  String get i18Name => 'service.${$name}';
  @override
  void $addMethod(ServiceMethod method) {
    _$methods[method.name] = method;
    allMethods.add(method.name);
  }

  @override
  ServiceMethod $lookupMethod(String name) => _$methods[name];
}

class _GrpcStream {
  final ServiceMethod method;
  final Stream<GeneratedMessage> input;
  StreamSubscription<GeneratedMessage> _sub;
  StreamController _requestStreamCtrl;
  _GrpcStream(this.method, this.input) {
    //print('[_GrpcStream.constructor] starting...');
    _sub = input.listen(_onData, onDone: _onDone, onError: _onError);
    _sub.pause();
    _requestStreamCtrl = method.createRequestStream(_sub);
    //print('[_GrpcStream.constructor] ready: ${_sub.isPaused}');
  }
  Stream get stream => _requestStreamCtrl.stream;
  void _onData(GeneratedMessage event) {
    //print('[_GrpcStream._onData] : ${event.toDebugString()}');
    _requestStreamCtrl?.add(event);
  }

  void _onDone() {
    _requestStreamCtrl?.close();
  }

  void _onError(e) {
    _requestStreamCtrl?.addError(e);
  }
}

class GrpcChannelService extends ChannelService {
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(GrpcChannelService);
  static final _ctrlOnStart = ReplaySubject<GrpcService>();
  static Stream<GrpcService> get onGrpcServiceStart => _ctrlOnStart.stream;
  final GrpcService grpcService;
  final interceptors = <GrpcInterceptor>[];
  GrpcChannelService(this.grpcService, ChannelServiceConfig config) : super(config ?? ChannelServiceConfig()) {
    _ctrlOnStart.add(grpcService);
  }
  @override
  Future<void> start() async {
    //print('[GrpcChannelService.start]....');
    await grpcService.start();
    for (final inter in interceptors) {
      await inter.onStart();
    }
    return super.start();
  }

  @override
  Future<void> stop() async {
    await grpcService.stop();
    for (final inter in interceptors) {
      await inter.onStop();
    }
    return super.stop();
  }

  @override
  Future<void> onRequest(RouteContext context, MessageReader request, MessageWritter response) async {
    final header = await request.header();
    if (header.contentType != null && !header.contentType.contains('grpc')) {
      return;
    }
    var first = true;
    try {
      final method = grpcService.$lookupMethod(context.lastRouteSegment);
      final example = method.deserialize(Uint8List(0));
      final call = await request.header().then((value) => ServerGrpcServiceCall(value.session, value)..headers.addAll(value.attributes));
      var requests = request.objects(example as GeneratedMessage);
      for (final interceptor in interceptors) {
        requests = interceptor.onRequest(method, call, requests);
      }
      final grpcStream = _GrpcStream(method, requests);
      //print('[GrpcChannelService.onRequest] call handle');
      var responses = method.handle(call, grpcStream.stream);
      for (final interceptor in interceptors) {
        responses = interceptor.onResponse(method, call, responses);
      }
      //print('[GrpcChannelService.onRequest] after call handle $res');
      await for (final r in responses) {
        if (first) {
          //write session
          response.header.session = (call.messageSession);
          first = false;
        }
        //print('[GrpcChannelService.onRequest] writting: ${r.toDebugString()}');
        response.object(r);
      }
    } catch (e, stacktrace) {
      var safeStackTrace = stacktrace;
      if (e is String) {
        response.addError(e);
      } else if (e is GrpcServiceError) {
        response.addError(e.code, description: e.details.toString());
        safeStackTrace = e.originalStackTrace ?? stacktrace;
      } else {
        response.addError(e.runtimeType.toString(), description: e.toString());
      }
      logger.e(kLogKeys.grpcServiceRequestError(), {'route': context.route}, error: e, stacktrace: safeStackTrace);
    } finally {
      // ignore: unawaited_futures
      response.end();
    }
  }
}
