part of 'grpc.dart';

extension GrpcLogKeys on LogKeys {
  LogKey grpcChannelResponseError() => LogKey('grpcChannelResponseError', description: 'GRPC channel error response');
  LogKey grpcServiceRequestError() => LogKey('grpcServiceRequestError', description: 'GRPC service request error');
}

class ServerGrpcClientChannel extends grpcchannel.ClientChannelBase {
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(ServerGrpcClientChannel);
  final ServerClientApplication application;
  final Channel channel;
  ServerGrpcClientChannel(this.application, this.channel);

  @override
  grpcconnection.ClientConnection createConnection() {
    throw UnimplementedError('ServerClientChannel.createConnection');
  }

  void _response(ClientMethod method, FutureMessageReader response, MessageClientCall call) async {
    try {
      final reader = await response;
      final tmp = method.responseDeserializer(<int>[]) as GeneratedMessage;
      await for (final obj in reader.parts) {
        if (obj.body.hasObject() && obj.body.object.canUnpackInto(tmp)) {
          final res = obj.body.object.unpackInto(tmp.deepCopy());
          //print(
          //   '[_ServerGrpcClientChannel._response]....  ${obj.toDebugString()}');
          call.responseCtrl.add(res);
        } else if (obj.hasError()) {
          call.responseCtrl.addError(obj.error.code);
        }
      }
    } catch (e, stacktrace) {
      logger.e(kLogKeys.grpcChannelResponseError(), {'path': method.path, 'userId': call.options.getSession().userId},
          error: e, stacktrace: stacktrace);
      call.responseCtrl.addError(e);
    } finally {
      // ignore: unawaited_futures
      call.responseCtrl.close();
    }
  }

  @override
  ClientCall<Q, R> createCall<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
    final call = MessageClientCall(method, null, options);
    final writter = MessageWritter.request();
    if (options.hasSession()) {
      writter.header.session = options.getSession();
    }
    writter.header.setSuperUser();
    final response = channel.send(method.path, writter.asReader());
    _response(method, response, call);
    writter.objects(requests as dynamic).end();
    return call;
  }
}
