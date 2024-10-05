// ignore_for_file: unnecessary_brace_in_string_interps

part of 'http.dart';

enum HttpChunked { Auto, Chunk, NoChunk }

abstract class MicroHttpResponseBody {
  HttpChunked _chunk = HttpChunked.Auto;
  HttpChunked get chunked => _chunk;
  int _bytesWritten = 0;
  bool _cacheBody = false;
  final _body = BytesBuilder();

  void writeBytes(Uint8List bytes) {
    _bytesWritten += bytes.lengthInBytes;
    _message.buffer(bytes);
  }

  Future<void> writeBytesStream(Stream<Uint8List> bytes) async {
    await for (final chunk in bytes) {
      writeBytes(chunk);
    }
  }

  Future<void> write<T>(BodyCodec<T> codec, T body, {bool codecContentType = true}) async {
    contentType(codec.encodeContentType, ifNotExists: !codecContentType);
    var stream = codec.encode(body);
    if (shouldGzipResponse()) {
      stream = gzip.encoder.bind(stream);
      header(HttpHeaders.contentEncodingHeader, 'gzip', clear: true);
    }
    if (codec.chunked || _chunk == HttpChunked.Chunk) {
      chunkTransfer(true);
      if (!request.isMethod(HttpMethod.Head)) {
        await for (final chunk in stream) {
          writeBytes(chunk);
          if (_cacheBody) _body.add(chunk);
          _bytesWritten += chunk.length;
        }
      }
    } else {
      final buffer = BytesBuilder();
      await for (final chunk in stream) {
        buffer.add(chunk);
      }
      header(HttpHeaders.contentLengthHeader, '${buffer.length}', clear: true);
      if (!request.isMethod(HttpMethod.Head)) {
        writeBytes(buffer.toBytes());
      }
      _bytesWritten += buffer.length;
      if (_cacheBody) _body.add(buffer.toBytes());
    }
  }

  MicroHttpResponse chunkMode(HttpChunked chunk) {
    if (_bytesWritten == 0) {
      _chunk = chunk;
    }
    return this;
  }

  bool shouldGzipResponse() {
    final acceptGzip = request.headerValues(HttpHeaders.acceptEncodingHeader).contains('gzip');
    return acceptGzip && MimeType.isCompressible(currentContentType);
  }

  MicroHttpResponse bufferResponse(bool cache) {
    if (_bytesWritten == 0) {
      _cacheBody = cache;
    }
    return this;
  }

  int get bytesWritten => _bytesWritten;
  bool get isCached => _cacheBody;
  ContentType get currentContentType;
  MicroHttpRequest get request;
  MessageWritter get _message;
  MicroHttpResponse chunkTransfer(bool chunk);
  MicroHttpResponse contentType(ContentType contentType, {bool ifNotExists = false});
  MicroHttpResponse header(
    String key,
    String value, {
    bool clear = false,
    bool ifNotExists = false,
    Map<String, String> parameters,
  });
}

class MicroHttpResponse with MicroHttpResponseBody {
  @override
  final MicroHttpRequest request;
  @override
  final MessageWritter _message;
  final MHttpResponse rawResponse;
  final Logger logger;
  var _closed = false;
  MicroHttpResponse(this._message, {this.request, this.rawResponse, this.logger});
  bool get closed => _closed;
  MicroHttpResponse session(MessageSession session) {
    session.updatedAt = Timestamp().now();
    _message.session(session);
    return this;
  }

  MicroHttpResponse expect(bool condition, {String cause}) {
    if (condition != true) throw ExpectationFailedException(cause);
    return this;
  }

  int get statusCode => rawResponse.statusCode;
  MHttpHeaders get headers => rawResponse.headers;
  List<MCookie> get cookies => rawResponse.cookies;

  @override
  ContentType get currentContentType => ContentType.parse(rawResponse.headers.contentType);

  MicroHttpResponse status(int code) {
    rawResponse.statusCode = code;
    return this;
  }

  MicroHttpResponse pushException(HttpException error, RouteContext context) {
    status(error.status);
    rawResponse.reasonPhrase = error.cause;
    context.stop();
    return this;
  }

  @override
  MicroHttpResponse header(
    String key,
    String value, {
    bool clear = false,
    bool ifNotExists = false,
    Map<String, String> parameters,
  }) {
    final headers = rawResponse.headers.headers;
    if (value == null) return this;
    if (ifNotExists) {
      final exist = headers.containsKey(key) ? headers[key].values : <String>[];
      if (exist.isNotEmpty) return this;
    }
    if (clear) headers.remove(key);
    headers.putIfAbsent(key, () => MHttpHeader());
    headers[key].values.add(HeaderValue(value, parameters).toString());
    return this;
  }

  MicroHttpResponse removeHeader(String key) {
    rawResponse.headers.headers.remove(key);
    return this;
  }

  MicroHttpResponse headerDate(String key, DateTime value, {bool clear = false, bool ifNotExists = false}) {
    final format = value != null ? HttpDate.format(value) : null;
    return header(key, format, clear: clear, ifNotExists: ifNotExists);
  }

  MicroHttpResponse headerParams(String key, List<String> value, {bool clear = false}) {
    final headers = rawResponse.headers.headers;
    if (value == null || value.isEmpty) return this;
    if (clear) headers.remove(key);
    headers.putIfAbsent(key, () => MHttpHeader());
    headers[key].values.add(value.join(', '));
    return this;
  }

  Optional<Encoding> acceptCharsetCodec() {
    final types = request.header(HttpHeaders.acceptEncodingHeader);
    for (final type in types) {
      final charset = type?.toLowerCase() ?? '';
      final found = Encoding.getByName(charset);
      if (found != null) return Optional.of(found);
    }
    return Optional.empty();
  }

  @override
  MicroHttpResponse contentType(ContentType contentType, {bool ifNotExists = false}) {
    if (contentType == null) return this;
    if (ifNotExists) {
      rawResponse.headers.contentType = contentType?.toString();
    } else {
      rawResponse.headers.contentType = contentType?.toString();
    }
    return this;
  }

  Future<String> generateWeakEtag(File file) async {
    final name = p.basename(file.uri.toString());
    final modified = await file.lastModified();
    final size = await file.length();
    final tag = Uri.encodeComponent('W/$name-${modified.millisecondsSinceEpoch}-$size');
    return tag;
  }

  MicroHttpResponse notModifiedSince(RouteContext context, DateTime lastModified, {String etag}) {
    final lastModifiedStr = HttpDate.format(lastModified);
    header(HttpHeaders.lastModifiedHeader, lastModifiedStr);
    header(HttpHeaders.etagHeader, etag);
    status(HttpStatus.notModified);
    context.stop();
    return this;
  }

  MicroHttpResponse vary(String headerName) {
    final headers = rawResponse.headers.headers;
    final vary = headers.containsKey(HttpHeaders.varyHeader) ? headers[HttpHeaders.varyHeader].values : <String>[];
    if (vary.isEmpty) {
      return header(HttpHeaders.varyHeader, headerName, clear: true);
    } else {
      final value = vary.first;
      return headerParams(HttpHeaders.varyHeader, <String>[value, headerName], clear: true);
    }
  }

  Future<MicroHttpResponse> redirect(RouteContext context, String uri, {bool temporary = false}) async {
    header(HttpHeaders.locationHeader, uri, clear: true);
    status(temporary ? HttpStatus.temporaryRedirect : HttpStatus.permanentRedirect);
    context.stop();
    await writeBytesStream(
      StringBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())).encode('Redirect to $uri ...'),
    );
    return this;
  }

  Future<MicroHttpResponse> redirectBack(RouteContext context, {bool temporary = false}) {
    final referer = request.header(HttpHeaders.refererHeader);
    final uri = referer.isNotEmpty ? referer.first : '/';
    return redirect(context, uri, temporary: temporary);
  }

  @override
  MicroHttpResponse chunkTransfer(bool chunk, {bool ifNotExists = false}) {
    if (chunk == null) return this;
    if (ifNotExists) {
      rawResponse.headers.chunkedTransferEncoding = chunk;
    } else {
      rawResponse.headers.chunkedTransferEncoding = chunk;
    }
    return this;
  }

  Future<MicroHttpResponse> text(String value) {
    return sendAs<String>(StringBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
  }

  Future<MicroHttpResponse> json(Json value) async {
    await sendAs<Json>(JsonBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
    return this;
  }

  Future<MicroHttpResponse> jsonString(String value) async {
    await sendAs<String>(JsonStringBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
    return this;
  }

  Future<MicroHttpResponse> xml(XmlDocument value) async {
    await sendAs<XmlDocument>(XmlBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
    return this;
  }

  Future<MicroHttpResponse> formParam(FormParamBody value) async {
    await sendAs<FormParamBody>(FormParamBodyCodec(charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
    return this;
  }

  Future<MicroHttpResponse> html(String value) async {
    await sendAs<String>(StringBodyCodec(type: ContentType.html, charsetCodec: acceptCharsetCodec().orElse(Utf8Codec())), value);
    return this;
  }

  Future<MicroHttpResponse> buffer(Uint8List value, {bool chunked = true}) async {
    await sendAs<List<int>>(BufferBodyCodec(chunked: chunked), value);
    return this;
  }

  Future<MicroHttpResponse> object(GeneratedMessage value, {bool chunked = true}) async {
    await sendAs<GeneratedMessage>(ProtobuffBodyCodec(chunked: chunked, example: value.createEmptyInstance()), value);
    return this;
  }

  Future<MicroHttpResponse> htmlFile(File targetFile) {
    return file(targetFile, contentType: ContentType.html);
  }

  Future<MicroHttpResponse> sendAs<T>(BodyCodec<T> codec, T body, {bool codecContentType = true}) async {
    try {
      if (closed) {
        logger.error(kLogKeys.httpResponseClosed());
        return this;
      }
      final acceptables = request.acceptableContentTypes();
      if (acceptables.isNotEmpty) {
        final founded = ContentTypes.isAcceptableContentType(acceptables, codec.encodeContentType);
        if (!founded.isPresent) {
          throw NotAcceptableException(
              'Not acceptable response type. Response type is ${codec.encodeContentType} and client accept ${acceptables}');
        }
      }
      contentType(codec.encodeContentType, ifNotExists: !codecContentType);
      await write(codec, body, codecContentType: codecContentType);
    } catch (e, stacktrace) {
      if (e is HttpException) {
        rethrow;
      }
      logger.error(kLogKeys.httpSendAsFailed(), error: e, stacktrace: stacktrace);
      throw InternalServerErrorException('An internal server error occured (type=${codec.encodeContentType}');
    }
    return this;
  }

  Future<MicroHttpResponse> close() async {
    if (!request.isMethod(HttpMethod.Head)) {
      if (bytesWritten == 0) {
        removeHeader(HttpHeaders.contentTypeHeader);
        header(HttpHeaders.contentLengthHeader, '0', clear: true);
      }
    }
    _message.end();
    _closed = true;
    return this;
  }

  Future<MicroHttpResponse> file(
    File targetFile, {
    ContentType contentType,
    bool download = false,
    bool acceptRange = true,
    String fileName,
    bool chunked = true,
  }) async {
    final stats = await targetFile.stat();
    header(HttpHeaders.contentLengthHeader, '${stats.size}');
    if (acceptRange == true) {
      header(HttpHeaders.acceptRangesHeader, 'bytes', clear: true);
    }
    if (contentType == null) {
      final ext = p.extension(targetFile.uri.toString());
      this.contentType(MimeType.findContentTypeForExtension(ext).orElse(ContentTypes.Application.octetStream));
    } else {
      this.contentType(contentType);
    }
    if (download == true) {
      header(HttpHeadersMore.contentDisposition, 'attachment', parameters: {'filename': '"${fileName ?? p.basename(targetFile.path)}"'});
    }
    status(HttpStatus.ok);
    if (request.isMethod(HttpMethod.Head)) {
      return this;
    }
    return sendAs<File>(
      FileBodyCodec.workOnSysTemp(chunked: chunked),
      targetFile,
      codecContentType: false,
    );
  }
}
