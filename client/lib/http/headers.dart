part of 'http.dart';

class HttpHeadersMore {
  static const contentDisposition = 'content-disposition';
  static const contentRange = 'content-range';
  static const origin = 'origin';
  static const accessControlRequestMethod = 'access-control-request-method';
  static const accessControlRequestHeaders = 'access-control-request-headers';
}

class HttpMethod {
  final String name;
  const HttpMethod._(this.name);
  HttpMethod.fromName(String name) : name = name.toUpperCase();
  static final Get = HttpMethod._('GET');
  static final Post = HttpMethod._('POST');
  static final Put = HttpMethod._('PUT');
  static final Delete = HttpMethod._('DELETE');
  static final Patch = HttpMethod._('PATCH');
  static final Options = HttpMethod._('OPTIONS');
  static final Connect = HttpMethod._('CONNECT');
  static final Trace = HttpMethod._('TRACE');
  static final Head = HttpMethod._('HEAD');
  bool match(String method) => method?.toUpperCase() == name;
  bool matchMethod(HttpMethod method) => method?.name?.toUpperCase() == name;
}
