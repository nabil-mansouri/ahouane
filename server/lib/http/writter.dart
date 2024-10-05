part of 'http.dart';

class _BreakHttpWritterException implements Exception {}

void processHttpWritter(HttpRequest request, MessageReader responseReader, HttpServerConfig config, DateTime startOn) async {
  final nativeResponse = request.response;
  var _headerWritten = false;
  void _writeHeaderIfNeeded(MessageHeader header) {
    if (_headerWritten) return;
    _headerWritten = true;
    //write session
    if (header.session.dirty) {
      header.session.dirty = false;
      request.session[kSessionKey] = header.session.writeToBuffer();
    }
    //write headers
    final hs = header.custom.where((element) => element.canUnpackInto(MHttpResponse())).map((e) => e.unpackInto(MHttpResponse())).toList();
    if (hs.isNotEmpty) {
      final hRes = hs.first;
      if (hRes.hasContentLength()) {
        nativeResponse.contentLength = hRes.contentLength;
      }
      if (hRes.hasStatusCode()) {
        nativeResponse.statusCode = hRes.statusCode;
      }
      if (hRes.hasReasonPhrase()) {
        nativeResponse.reasonPhrase = hRes.reasonPhrase;
      }
      if (hRes.hasPersistentConnection()) {
        nativeResponse.persistentConnection = hRes.persistentConnection;
      }
      if (hRes.hasDeadline()) {
        nativeResponse.deadline = hRes.deadline.asDuration;
      }
      if (hRes.hasBufferOutput()) {
        nativeResponse.bufferOutput = hRes.bufferOutput;
      }
      if (hRes.hasHeaders()) {
        final mHeader = hRes.headers;
        final natHeader = nativeResponse.headers;
        if (mHeader.hasDate()) {
          natHeader.date = mHeader.date.asDateTime;
        }
        if (mHeader.hasExpires()) {
          natHeader.expires = mHeader.expires.asDateTime;
        }
        if (mHeader.hasIfModifiedSince()) {
          natHeader.ifModifiedSince = mHeader.ifModifiedSince.asDateTime;
        }
        if (mHeader.hasHost()) {
          natHeader.host = mHeader.host;
        }
        if (mHeader.hasPort()) {
          natHeader.port = mHeader.port;
        }
        if (mHeader.hasContentType()) {
          natHeader.contentType = ContentType.parse(mHeader.contentType);
        }
        if (mHeader.hasContentLength()) {
          natHeader.contentLength = mHeader.contentLength;
        }
        if (mHeader.hasPersistentConnection()) {
          natHeader.persistentConnection = mHeader.persistentConnection;
        }
        if (mHeader.hasChunkedTransferEncoding()) {
          natHeader.chunkedTransferEncoding = mHeader.chunkedTransferEncoding;
        }
        mHeader.headers.forEach((key, value) {
          natHeader.add(key, value.values.join(', '));
        });
      }
      hRes.cookies.forEach((element) {
        final c = Cookie(element.name, element.value);
        if (element.hasExpires()) {
          c.expires = element.expires.asDateTime;
        }
        if (element.hasMaxAge()) {
          c.maxAge = element.maxAge;
        }
        if (element.hasDomain()) {
          c.domain = element.domain;
        }
        if (element.hasPath()) {
          c.path = element.path;
        }
        if (element.hasSecure()) {
          c.secure = element.secure;
        }
        if (element.hasHttpOnly()) {
          c.httpOnly = element.httpOnly;
        }
        nativeResponse.cookies.add(c);
      });
    }
  }

  String _serializeTrailers(Map<String, String> trailers) {
    final builder = StringBuffer();
    for (final entry in trailers.entries) {
      builder.write('${entry.key}:${entry.value}\r\n');
    }
    return builder.toString();
  }

  try {
    if (ContentTypes.isGrpc(request.headers.contentType)) {
      nativeResponse.headers.contentType = ContentTypes.Application.grpc;
      final serializer = MessageSerializer.remote(nativeResponse);
      final trailers = <String, String>{'grpc-status': '0'};
      await for (final chunk in responseReader.parts) {
        if (chunk.hasHeader()) {
          _writeHeaderIfNeeded(chunk.header);
        }
        //grpc can only receive body or error
        if (chunk.hasBody()) {
          serializer.send(chunk);
        } else if (chunk.hasError()) {
          trailers['grpc-status'] = '500';
          trailers['grpc-message'] = chunk.error.code;
          serializer.trailer(_serializeTrailers(trailers));
          serializer.close();
          throw _BreakHttpWritterException();
        }
      }
      serializer.trailer(_serializeTrailers(trailers));
      serializer.close();
    } else {
      await for (final chunk in responseReader.parts) {
        if (chunk.hasHeader()) {
          _writeHeaderIfNeeded(chunk.header);
        } else if (chunk.hasBody() && chunk.body.hasBuffer()) {
          nativeResponse.add(chunk.body.buffer);
        }
      }
    }
  } catch (e) {
    if (e is! _BreakHttpWritterException) {}
  } finally {
    await nativeResponse.close();
  }
}
