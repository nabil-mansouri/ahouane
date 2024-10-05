part of 'http.dart';

class HttpExceptionInterceptor extends HttpChannelInterceptor {
  final logger = ServerApplication.instance().logger().createByType(HttpExceptionInterceptor);
  final exceptionMapping = <Type, int>{};
  @override
  bool acceptType(InterceptorType type) => type == InterceptorType.Empty || type == InterceptorType.After || type == InterceptorType.Error;

  HttpExceptionInterceptor addMapping(Type exception, int status) {
    exceptionMapping[exception] = status;
    return this;
  }

  void _convertException(RouteContext context, MicroHttpRequest req, MicroHttpResponse res, Exception exception) async {
    if (exception != null && exception is HttpRedirectException) {
      await res.redirect(context, exception.uri, temporary: exception.temporary);
    } else if (exception != null && (exception is HttpException || exceptionMapping.containsKey(exception.runtimeType))) {
      final code = exception is HttpException ? exception.status : exceptionMapping[exception.runtimeType];
      final cause = exception is HttpException ? exception.cause : '${exception.runtimeType}';
      await res.status(code).text(cause);
    } else {
      logger.warn(kLogKeys.exceptionMappingFail(), details: exception);
      res.status(HttpStatus.internalServerError);
    }
  }

  @override
  Future<void> onInterceptHttp(RouteContext context, MicroHttpRequest request, MicroHttpResponse response, InterceptorType type) async {
    if (type == InterceptorType.Empty) {
      throw NotFoundException('Not found - ${context.route}');
    } else if (type == InterceptorType.Error) {
      final exception = context.getByKey(kRouteContextKeys.lastException(), orValue: () => null);
      _convertException(context, request, response, exception);
    } else if (type == InterceptorType.After) {
      final hasException = context.containsKey(kRouteContextKeys.lastException());
      final skipped = context.getByKey(kRouteContextKeys.skippedExceptions());
      if (!hasException && skipped.isNotEmpty) {
        final exception = skipped.first;
        _convertException(context, request, response, exception);
      }
    }
  }
}
