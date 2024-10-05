part of 'http.dart';

abstract class HttpException implements Exception {
  int get status;
  bool get stopRouting => true;
  final String cause;
  HttpException(this.cause);
}

abstract class HttpSkipException implements HttpException {
  @override
  bool get stopRouting => false;
  @override
  final String cause;
  HttpSkipException(this.cause) : super();
}

class BadRequestException extends HttpSkipException {
  @override
  int get status => HttpStatus.badRequest;
  BadRequestException(String cause) : super(cause);
}

class UnauthorizedException extends HttpException {
  @override
  int get status => HttpStatus.unauthorized;
  UnauthorizedException(String cause) : super(cause);
}

class ForbiddenException extends HttpException {
  @override
  int get status => HttpStatus.forbidden;
  ForbiddenException(String cause) : super(cause);
}

class NotFoundException extends HttpSkipException {
  @override
  int get status => HttpStatus.forbidden;
  NotFoundException(String cause) : super(cause);
}

class MethodNotAllowedException extends HttpSkipException {
  @override
  int get status => HttpStatus.methodNotAllowed;
  MethodNotAllowedException(String cause) : super(cause);
}

class NotAcceptableException extends HttpSkipException {
  @override
  int get status => HttpStatus.notAcceptable;
  NotAcceptableException(String cause) : super(cause);
}

class RequestTimeoutException extends HttpException {
  @override
  int get status => HttpStatus.requestTimeout;
  RequestTimeoutException(String cause) : super(cause);
}

class ConflictException extends HttpException {
  @override
  int get status => HttpStatus.conflict;
  ConflictException(String cause) : super(cause);
}

class EntityTooLargeException extends HttpException {
  @override
  int get status => HttpStatus.requestEntityTooLarge;
  EntityTooLargeException(String cause) : super(cause);
}

class UriTooLongException extends HttpException {
  @override
  int get status => HttpStatus.requestUriTooLong;
  UriTooLongException(String cause) : super(cause);
}

class PreconditionFailedException extends HttpException {
  @override
  int get status => HttpStatus.preconditionFailed;
  PreconditionFailedException(String cause) : super(cause);
}

class PreconditionRequiredException extends HttpException {
  @override
  int get status => HttpStatus.preconditionRequired;
  PreconditionRequiredException(String cause) : super(cause);
}

class UnsupportedMediatypeException extends HttpSkipException {
  @override
  int get status => HttpStatus.unsupportedMediaType;
  UnsupportedMediatypeException(String cause) : super(cause);
}

class ExpectationFailedException extends HttpException {
  @override
  int get status => HttpStatus.expectationFailed;
  ExpectationFailedException(String cause) : super(cause);
}

class RangeNotSatisfiableException extends HttpException {
  @override
  int get status => HttpStatus.requestedRangeNotSatisfiable;
  RangeNotSatisfiableException(String cause) : super(cause);
}

class InternalServerErrorException extends HttpException {
  @override
  int get status => HttpStatus.internalServerError;
  InternalServerErrorException(String cause) : super(cause);
}

class NotImplementedException extends HttpSkipException {
  @override
  int get status => HttpStatus.notImplemented;
  NotImplementedException(String cause) : super(cause);
}

class BadGatewayException extends HttpException {
  @override
  int get status => HttpStatus.badGateway;
  BadGatewayException(String cause) : super(cause);
}

class HttpVersionNotSupportedException extends HttpException {
  @override
  int get status => HttpStatus.httpVersionNotSupported;
  HttpVersionNotSupportedException(String cause) : super(cause);
}

class HttpRedirectException extends HttpException {
  @override
  int get status =>
      temporary ? HttpStatus.temporaryRedirect : HttpStatus.permanentRedirect;
  final String uri;
  final bool temporary;
  HttpRedirectException(this.uri, {this.temporary = false}) : super('');
}
