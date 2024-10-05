part of 'http.dart';

const String kSessionKey = 'messionsession';

MessageReader createHttpReader(HttpRequest nativeRequest, HttpServerConfig config) {
  MHttpRequest nativeRequestToProto() {
    final nativeHeaders = nativeRequest.headers;
    final _request = MHttpRequest()
      ..contentLength = nativeRequest.contentLength
      ..method = nativeRequest.method
      ..uri = nativeRequest.uri.toString()
      ..requestedUri = nativeRequest.requestedUri.toString()
      ..persistentConnection = nativeRequest.persistentConnection
      ..protocolVersion = nativeRequest.protocolVersion
      ..remoteAddress = nativeRequest.connectionInfo.remoteAddress.toString()
      ..remotePort = nativeRequest.connectionInfo.remotePort
      ..localPort = nativeRequest.connectionInfo.localPort
      ..headers = (MHttpHeaders()
        ..date = nativeHeaders.date?.asTimestamp
        ..expires = nativeHeaders.expires?.asTimestamp
        ..ifModifiedSince = nativeHeaders.ifModifiedSince?.asTimestamp
        ..host = nativeHeaders.host
        ..contentType = nativeHeaders.contentType.toString()
        ..contentLength = nativeHeaders.contentLength
        ..persistentConnection = nativeHeaders.persistentConnection
        ..chunkedTransferEncoding = nativeHeaders.chunkedTransferEncoding);
    nativeHeaders.forEach((name, values) {
      _request.headers.headers.putIfAbsent(name, () => MHttpHeader());
      _request.headers.headers[name].values.addAll(values);
    });
    nativeRequest.cookies.forEach((c) {
      _request.cookies.add(MCookie()
        ..name = c.name
        ..value = c.value
        ..expires = c.expires?.asTimestamp
        ..maxAge = c.maxAge
        ..domain = c.domain
        ..path = c.path
        ..secure = c.secure
        ..httpOnly = c.httpOnly);
    });
    return _request;
  }

  Stream<MessagePart> streamRequestBody(MessageWritter writter) {
    if (ContentTypes.isGrpc(nativeRequest.headers.contentType)) {
      return MessageDeserializer.convert(nativeRequest).map((event) {
        if (event.hasHeader()) {
          final copy = writter.header.deepCopy();
          writter.header
            ..mergeFromMessage(event.header)
            ..mergeFromMessage(copy);
        }
        //print('[createHttpReader.streamRequestBody]: ${event.toDebugString()}');
        return event;
      });
    } else {
      return nativeRequest.map((event) {
        final body = MessageBody()..buffer = event;
        return MessagePart()..body = body;
      });
    }
  }

  final protoRequest = nativeRequestToProto();
  final requestWritter = MessageWritter.request(nativeRequest.headers.contentType ?? ContentTypes.Text.plain);
  final route = nativeRequest.requestedUri.path;
  var authorization = nativeRequest.headers.value(HttpHeaders.authorizationHeader) ?? '';
  if (authorization.split(' ').length == 2) {
    authorization = authorization.split(' ')[1];
  } else {
    authorization = '';
  }
  requestWritter.header
    ..authorization = authorization
    ..session = (MessageSession()
      ..mergeFromBuffer(nativeRequest.session[kSessionKey] ?? <int>[])
      ..id = nativeRequest.session.id)
    ..route = route
    ..setCustom(protoRequest);
  requestWritter.addStreamPart(streamRequestBody(requestWritter), autoEnd: true);
  return requestWritter.asReader();
}
