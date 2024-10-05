part of 'grpc.dart';

class NotFoundGrpcChannelInterceptor extends ChannelInterceptor {
  NotFoundGrpcChannelInterceptor([ChannelInterceptorConfig config])
      : super(config ?? ChannelInterceptorConfig());
  @override
  Future<void> start() async {
    return super.start();
  }

  @override
  Future<void> stop() async {
    return super.stop();
  }

  @override
  bool acceptType(InterceptorType type) => type == InterceptorType.Empty;

  @override
  Future<void> onIntercept(RouteContext context, MessageReader request,
      MessageWritter response, InterceptorType type) async {
    final header = await request.header();
    if (header.contentType != null && !header.contentType.contains('grpc')) {
      return;
    }
    if (type == InterceptorType.Empty) {
      return response.addError('route.notfound');
    }
  }
}

extension ServiceCallExt on ServiceCall {
  bool isSuperUser() {
    if (this is ServerGrpcServiceCall) {
      return (this as ServerGrpcServiceCall).header.isSuperUser();
    } else {
      return false;
    }
  }

  MessageSession getSession() {
    if (this is ServerGrpcServiceCall) {
      return ((this as ServerGrpcServiceCall).messageSession);
    } else {
      return MessageSession();
    }
  }

  void setSession(MessageSession session) {
    if (this is ServerGrpcServiceCall) {
      session.updatedAt = Timestamp().now();
      session.dirty = true;
      ((this as ServerGrpcServiceCall).messageSession = session);
    }
  }
}
