part of 'core.dart';

abstract class ChannelInterceptor extends Endpoint {
  final ChannelInterceptorConfig interceptorConfig;
  ChannelInterceptor(this.interceptorConfig, {String id})
      : super(kEndpointTypes.interceptor(),
            id: id, priority: interceptorConfig.priority);
  List<InterceptorType> get types =>
      interceptorConfig.types ?? <InterceptorType>[];
  bool acceptType(InterceptorType type) =>
      interceptorConfig.types.contains(type);
  @nonVirtual
  @override
  Future<void> onReceive(RouteContext context) {
    final type = context.getByKey(kRouteContextKeys.interceptorType());
    if (accept(context) && acceptType(type)) {
      return onIntercept(context, context.input, context.output, type);
    }
    return Future.value(null);
  }

  Future<void> onIntercept(RouteContext context, MessageReader request,
      MessageWritter response, InterceptorType type);
}
