// ignore_for_file: unnecessary_brace_in_string_interps

part of 'http.dart';

abstract class MicroHttpRequestBody {
  var _bytesRead = 0;
  var _finished = false;
  MessageReader get _message;
  Stream<Uint8List> _readBody() async* {
    final hasContent = (contentLength ?? 0) > 0;
    if (hasContent || chunkedTransferEncoding) {
      if (contentLength > maxPayloadBytes) {
        throw EntityTooLargeException('Max entity size is ${maxPayloadBytes} bytes');
      } else {
        await for (final chunk in _message.buffer()) {
          yield chunk;
        }
      }
    } else {
      await for (final chunk in _message.buffer()) {
        _bytesRead += chunk.length;
        if (_bytesRead > maxPayloadBytes) {
          throw EntityTooLargeException('Max entity size is ${maxPayloadBytes} bytes');
        } else {
          yield chunk;
        }
      }
    }
    _finished = true;
  }

  int get bytesRead => _bytesRead;
  bool get finished => _finished;
  bool get chunkedTransferEncoding;
  int get maxPayloadBytes;
  int get contentLength;
}

extension MessageHeaderExt on MessageHeader {
  MHttpRequest get httpRequest {
    final res = custom.firstWhere((element) => element.canUnpackInto(MHttpRequest()), orElse: () => null);
    if (res == null) {
      return MHttpRequest();
    } else {
      return res.unpackInto(MHttpRequest());
    }
  }
}

class MicroHttpRequest with MicroHttpRequestBody {
  @override
  final MessageReader _message;
  final MessageHeader _header;
  final MHttpRequest rawRequest;
  @override
  final int maxPayloadBytes;
  final _context = <String, dynamic>{};
  MicroHttpRequest(
    this._message,
    this._header,
    this.maxPayloadBytes,
  ) : rawRequest = _header.httpRequest;
  Uri get uri => _context['uri'] ?? (_context['uri'] = Uri.parse(rawRequest.uri));
  String get path => uri.path;
  MessageReader get originalMessage => _message;
  Map<String, List<String>> get queryParamsAll => uri.queryParametersAll;
  List<String> get pathSegments => uri.pathSegments;
  String get method => rawRequest.method;
  Future<MessageSession> get session => originalMessage.header().then((h) => h.session);
  @override
  int get contentLength => rawRequest.headers.contentLength;
  @override
  bool get chunkedTransferEncoding => rawRequest.headers.chunkedTransferEncoding;
  MHttpHeaders get headers => rawRequest.headers;
  List<MCookie> get cookies => rawRequest.cookies;
  ContentType get contentType => _context['contentType'] ?? (_context['contentType'] = ContentType.parse(rawRequest.headers.contentType));
  String get route => _header.route;
  bool isXhr() {
    final val = header('X-Requested-With', forceLowerCase: true);
    return val.isNotEmpty && val.contains('xmlhttprequest');
  }

  bool isOfType(ContentType type) {
    return ContentTypes.matchMimetype(type, contentType);
  }

  bool isMethod(HttpMethod m) {
    return m.match(method);
  }

  bool hasHeader(String key) {
    return header(key)?.isNotEmpty == true;
  }

  List<String> header(String key, {bool forceLowerCase = false}) {
    final res = rawRequest.headers.headers[key] ?? MHttpHeader();
    if (forceLowerCase) {
      return res.values.map((r) => r.toLowerCase()).toList();
    } else {
      return res.values;
    }
  }

  List<String> headerValues(String key) {
    final headers = header(key);
    final allParams = <String>[];
    for (final header in headers) {
      final params = header.split(',').map((s) => s.trim().toLowerCase()).where((s) => s.isNotEmpty).toList();
      allParams.addAll(params);
    }
    return allParams;
  }

  String queryParam(String key, {String orDefault}) {
    return uri.queryParameters.containsKey(key) ? uri.queryParameters[key] : orDefault;
  }

  Optional<Encoding> charsetCodec() {
    final charset = contentType.charset?.toLowerCase() ?? '';
    return Optional.ofNullable(Encoding.getByName(charset));
  }

  List<Langage> acceptableLangages() {
    final accepts =
        headerValues(HttpHeaders.acceptLanguageHeader).map((type) => Langage.parse(type)).where((test) => test != null).toList();
    if (accepts.isEmpty) {
      accepts.add(Langage.parse('*'));
    }
    return accepts;
  }

  List<ContentType> acceptableContentTypes() {
    final accepts = headerValues(HttpHeaders.acceptHeader).map((type) => ContentType.parse(type)).where((test) => test != null).toList();
    if (accepts.isEmpty) {
      accepts.add(ContentType.parse('*/*'));
    }
    return accepts;
  }

  Future<T> bodyAs<T>(BodyCodec<T> codec) async {
    //valid content type
    if (!codec.accept(contentType)) {
      throw UnsupportedMediatypeException('Unsupported content type ${rawRequest.headers.contentType}');
    }
    try {
      final res = await codec.decode(_readBody());
      return res;
    } catch (e) {
      throw BadRequestException('Could not read body');
    }
  }

  Future<File> file([File targetFile]) async {
    return bodyAs<File>(FileBodyCodec.workOnFile(targetFile));
  }

  Future<String> text() {
    return bodyAs<String>(StringBodyCodec(charsetCodec: charsetCodec().orElse(Utf8Codec())));
  }

  Future<Json> json() {
    return bodyAs<Json>(JsonBodyCodec(charsetCodec: charsetCodec().orElse(Utf8Codec())));
  }

  Future<XmlDocument> xml() {
    return bodyAs<XmlDocument>(XmlBodyCodec(charsetCodec: charsetCodec().orElse(Utf8Codec())));
  }

  Future<FormParamBody> formParam() {
    return bodyAs<FormParamBody>(FormParamBodyCodec(charsetCodec: charsetCodec().orElse(Utf8Codec())));
  }

  Future<JsonObject> formParamOrJson() {
    if (isOfType(ContentType.json)) {
      return json().then((e) => e.asObject);
    }
    return bodyAs<FormParamBody>(FormParamBodyCodec(charsetCodec: charsetCodec().orElse(Utf8Codec()))).then((value) => value.asJson());
  }

  Future<List<int>> buffer() {
    return bodyAs<List<int>>(BufferBodyCodec());
  }

  Future<T> object<T extends GeneratedMessage>(T example) {
    return bodyAs(ProtobuffBodyCodec<T>(example: example));
  }
}
