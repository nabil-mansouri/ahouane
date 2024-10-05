part of 'http.dart';

abstract class HttpChannelInterceptor extends ChannelInterceptor {
  HttpChannelInterceptor() : super(ChannelInterceptorConfig());
  @override
  Future<void> start() async {
    return super.start();
  }

  @override
  Future<void> stop() async {
    return super.stop();
  }

  @override
  Future<void> onIntercept(RouteContext context, MessageReader request,
      MessageWritter response, InterceptorType type) async {
    final header = await request.header();
    if (header.contentType != null && header.contentType.contains('grpc')) {
      return;
    }
    final httpReq =
        MicroHttpRequest(request, header, HttpChannelService.MAX_BODY_SIZE);
    final httpResHead = MHttpResponse()..headers = MHttpHeaders();
    final httpRes = MicroHttpResponse(
      response,
      request: httpReq,
      logger: getLoggerFactory().loggerByType(MicroHttpResponse),
      rawResponse: httpResHead,
    );
    return onInterceptHttp(context, httpReq, httpRes, type);
  }

  Future<void> onInterceptHttp(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response, InterceptorType type);
}
