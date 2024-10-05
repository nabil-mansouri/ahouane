part of 'http.dart';

class FormParamValue {
  final String name;
  final String value;
  FormParamValue(String name, String value)
      : name = name?.trim(),
        value = value?.trim();
}

class FormParamBody {
  final Map<String, List<String>> _params;
  final List<File> _files;
  FormParamBody(this._params, {List<File> files}) : _files = files ?? <File>[];
  Map<String, List<String>> get params => _params;
  List<File> get files => _files;
  JsonObject asJson() => JsonObject.fromMap(_params);
}

abstract class BodyCodec<T> {
  bool get chunked;
  ContentType get encodeContentType;
  bool accept(ContentType type);
  Future<T> decode(Stream<List<int>> stream);
  Stream<List<int>> encode(T data);
}

class BufferBodyCodec extends BodyCodec<List<int>> {
  @override
  final bool chunked;
  BufferBodyCodec({
    this.chunked = true,
  });

  @override
  ContentType get encodeContentType => ContentTypes.Application.octetStream;

  @override
  bool accept(ContentType type) {
    return ContentTypes.matchMimetype(ContentTypes.Application.octetStream, type);
  }

  @override
  Future<List<int>> decode(Stream<List<int>> stream) async {
    final buffer = BytesBuilder();
    await for (final chunk in stream) {
      buffer.add(chunk);
    }
    return buffer.toBytes();
  }

  @override
  Stream<List<int>> encode(List<int> data) async* {
    yield data;
  }
}

class FileBodyCodec extends BodyCodec<File> {
  final String prefix;
  final Directory workspace;
  @override
  final bool chunked;
  final File target;
  FileBodyCodec(
    this.workspace, {
    this.prefix = 'fileupload',
    this.chunked = true,
    this.target,
  });
  factory FileBodyCodec.workOnSysTemp({bool chunked = true}) {
    return FileBodyCodec(Directory.systemTemp, chunked: chunked);
  }
  factory FileBodyCodec.workOnFile(File target) {
    return FileBodyCodec(Directory.systemTemp, target: target);
  }
  @override
  ContentType get encodeContentType => ContentTypes.Application.octetStream;
  @override
  bool accept(ContentType type) {
    return true;
    //return ContentTypes.matchMimetype(
    //    ContentTypes.Application.octetStream, type);
  }

  @override
  Future<File> decode(Stream<List<int>> stream) async {
    final file = target ?? await FileUtils.createTmpFileInDirectory(workspace, prefix);
    await file.create();
    final fWrite = file.openWrite();
    try {
      await fWrite.addStream(stream);
      await fWrite.flush();
    } finally {
      await fWrite.close();
    }
    return file;
  }

  @override
  Stream<List<int>> encode(File file) async* {
    if (await file.exists()) {
      final fRead = file.openRead();
      await for (final chunk in fRead) {
        yield chunk;
      }
    } else {
      throw NotFoundException('Could not found ${file.path}');
    }
  }
}

class FileRangeBodyCodec extends FileBodyCodec {
  final Range range;
  FileRangeBodyCodec._(
    Directory workspace, {
    @required this.range,
    String prefix = 'fileupload',
    bool chunked = true,
  }) : super(workspace, prefix: prefix, chunked: chunked);
  factory FileRangeBodyCodec.workOnSysTemp(
    Range range, {
    String prefix = 'fileupload',
    bool chunked = true,
  }) {
    return FileRangeBodyCodec._(
      Directory.systemTemp,
      range: range,
      chunked: chunked,
      prefix: prefix,
    );
  }

  @override
  Stream<List<int>> encode(File file) async* {
    if (await file.exists()) {
      final stats = await file.stat();
      final newRange = range.getValidRange(stats.size);
      if (!newRange.isValid(stats.size)) {
        throw RangeNotSatisfiableException('Invalid range $newRange for length ${stats.size}');
      }
      final fRead = file.openRead(newRange.begin, newRange.end);
      await for (final chunk in fRead) {
        yield chunk;
      }
    } else {
      throw NotFoundException('Could not found ${file.path}');
    }
  }
}

class StringBodyCodec extends BodyCodec<String> {
  final Encoding charsetCodec;
  final ContentType type;
  @override
  final bool chunked;
  StringBodyCodec({
    this.charsetCodec = const Utf8Codec(),
    this.chunked = false,
    ContentType type,
  }) : type = type ?? ContentType.text;
  @override
  ContentType get encodeContentType => ContentType(
        type.primaryType,
        type.subType,
        charset: charsetCodec.name,
      );
  @override
  bool accept(ContentType type) {
    return ContentTypes.matchMimetype(ContentTypes.Text.all, type);
  }

  @override
  Future<String> decode(Stream<List<int>> stream) async {
    return charsetCodec.decodeStream(stream);
  }

  @override
  Stream<List<int>> encode(String data) async* {
    final list = charsetCodec.encode(data);
    yield list;
  }
}

class XmlBodyCodec extends BodyCodec<XmlDocument> {
  final Encoding charsetCodec;
  @override
  final bool chunked;
  XmlBodyCodec({
    this.charsetCodec = const Utf8Codec(),
    this.chunked = false,
  });
  @override
  ContentType get encodeContentType =>
      ContentType(ContentTypes.Application.xml.primaryType, ContentTypes.Application.xml.subType, charset: charsetCodec.name);
  @override
  bool accept(ContentType type) {
    return ContentTypes.matchMimetype(ContentTypes.Application.xml, type) || ContentTypes.matchMimetype(ContentTypes.Text.xml, type);
  }

  @override
  Future<XmlDocument> decode(Stream<List<int>> stream) async {
    final str = await charsetCodec.decodeStream(stream);
    return xml.parse(str);
  }

  @override
  Stream<List<int>> encode(xml.XmlDocument data) async* {
    final str = data.toXmlString();
    final list = charsetCodec.encode(str);
    yield list;
  }
}

class FormParamBodyCodec extends BodyCodec<FormParamBody> {
  final Encoding charsetCodec;
  @override
  final bool chunked;
  FormParamBodyCodec({
    this.charsetCodec = const Utf8Codec(),
    this.chunked = false,
  });
  @override
  ContentType get encodeContentType =>
      ContentType(ContentTypes.Application.wwwFormUrlEnconded.primaryType, ContentTypes.Application.wwwFormUrlEnconded.subType,
          charset: charsetCodec.name);
  @override
  bool accept(ContentType type) {
    return ContentTypes.matchMimetype(ContentTypes.Application.wwwFormUrlEnconded, type);
  }

  @override
  Future<FormParamBody> decode(Stream<List<int>> stream) async {
    final param = await charsetCodec.decodeStream(stream);
    final queryParams = Uri(query: param).queryParametersAll;
    return FormParamBody(queryParams);
  }

  @override
  Stream<List<int>> encode(FormParamBody data) async* {
    final buffer = <String>[];
    for (final e in data.params.entries) {
      for (final value in e.value) {
        buffer.add('${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(value)}');
      }
    }
    final str = buffer.join('&');
    final list = charsetCodec.encode(str);
    yield list;
  }
}

class JsonBodyCodec extends BodyCodec<Json> {
  final Encoding charsetCodec;
  @override
  final bool chunked;
  JsonBodyCodec({
    this.charsetCodec = const Utf8Codec(),
    this.chunked = false,
  });
  @override
  ContentType get encodeContentType =>
      ContentType(ContentTypes.Application.json.primaryType, ContentTypes.Application.json.subType, charset: charsetCodec.name);
  @override
  bool accept(ContentType type) {
    return ContentTypes.isJson(type);
  }

  @override
  Future<Json> decode(Stream<List<int>> stream) async {
    final str = await charsetCodec.decodeStream(stream);
    final json = jsonDecode(str);
    return Json.parseObject(json);
  }

  @override
  Stream<List<int>> encode(Json data) async* {
    final str = jsonEncode(data.isObject ? data.asObject : data.asArray);
    final list = charsetCodec.encode(str);
    yield list;
  }
}

class JsonStringBodyCodec extends BodyCodec<String> {
  final Encoding charsetCodec;
  @override
  final bool chunked;
  JsonStringBodyCodec({
    this.charsetCodec = const Utf8Codec(),
    this.chunked = false,
  });
  @override
  ContentType get encodeContentType =>
      ContentType(ContentTypes.Application.json.primaryType, ContentTypes.Application.json.subType, charset: charsetCodec.name);
  @override
  bool accept(ContentType type) {
    return ContentTypes.isJson(type);
  }

  @override
  Future<String> decode(Stream<List<int>> stream) async {
    final str = await charsetCodec.decodeStream(stream);
    return str;
  }

  @override
  Stream<List<int>> encode(String data) async* {
    final list = charsetCodec.encode(data);
    yield list;
  }
}

class ProtobuffBodyCodec<T extends GeneratedMessage> extends BodyCodec<T> {
  @override
  final bool chunked;
  final T example;
  ProtobuffBodyCodec({
    this.chunked = false,
    @required this.example,
  });
  @override
  ContentType get encodeContentType => ContentTypes.Application.protobuff;
  @override
  bool accept(ContentType type) {
    return ContentTypes.matchMimetype(ContentTypes.Application.protobuff, type);
  }

  @override
  Future<T> decode(Stream<List<int>> stream) async {
    final res = await BufferBodyCodec().decode(stream);
    return example.createEmptyInstance()..mergeFromBuffer(res);
  }

  @override
  Stream<List<int>> encode(T data) async* {
    yield data.writeToBuffer();
  }
}
