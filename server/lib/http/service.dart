part of 'http.dart';

class HttpChannelService extends ChannelService {
  static const MAX_BODY_SIZE = 10 * 1024 * 1024; //10MB
  final HttpServiceConfig httpConfig;
  HttpChannelService(this.httpConfig)
      : super(httpConfig.serviceConfig ?? ChannelServiceConfig());
  @override
  Future<void> start() async {
    return super.start();
  }

  @override
  Future<void> stop() async {
    return super.stop();
  }

  @override
  Future<void> onRequest(RouteContext context, MessageReader request,
      MessageWritter response) async {
    final header = await request.header();
    if (header.contentType != null && header.contentType.contains('grpc')) {
      return;
    }
    final httpReq = MicroHttpRequest(request, header,
        httpConfig.hasMaxBodySize() ? httpConfig.maxBodySize : MAX_BODY_SIZE);
    final httpResHead = MHttpResponse()..headers = MHttpHeaders();
    final httpRes = MicroHttpResponse(
      response,
      request: httpReq,
      logger: getLoggerFactory().loggerByType(MicroHttpResponse),
      rawResponse: httpResHead,
    );
    try {
      if (HttpMethod.Get.match(httpReq.method)) {
        await get(context, httpReq, httpRes);
      } else if (HttpMethod.Post.match(httpReq.method)) {
        await post(context, httpReq, httpRes);
      } else if (HttpMethod.Put.match(httpReq.method)) {
        await put(context, httpReq, httpRes);
      } else if (HttpMethod.Delete.match(httpReq.method)) {
        await delete(context, httpReq, httpRes);
      } else if (HttpMethod.Head.match(httpReq.method)) {
        await head(context, httpReq, httpRes);
      } else if (HttpMethod.Options.match(httpReq.method)) {
        await options(context, httpReq, httpRes);
      } else {
        await unknown(context, httpReq, httpRes);
      }
    } finally {
      await httpRes.close();
    }
  }

  Future<void> unknown(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Unknown method: ${request.method}');
  }

  Future<void> get(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }

  Future<void> post(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }

  Future<void> put(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }

  Future<void> delete(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }

  Future<void> head(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }

  Future<void> options(RouteContext context, MicroHttpRequest request,
      MicroHttpResponse response) {
    throw MethodNotAllowedException('Not allow method: ${request.method}');
  }
}
