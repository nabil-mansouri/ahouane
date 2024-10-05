part of 'microservice.dart';

class MessageWritterBodyBuffer {
  final MessageWritterBody _body;
  MessageWritterBodyBuffer(this._body);

  MessageWritterBodyBuffer writeAs<T>(BodyCodec<T> codec, T value) {
    _body.self().contentType(codec.encodeContentType);
    _body.addStream(codec.encode(value).map((chunk) => MessageBody()..buffer = chunk));
    return this;
  }

  MessageWritterBodyBuffer json(Json json) => writeAs<Json>(JsonBodyCodec(), json);
  MessageWritterBodyBuffer file(File file) => writeAs<File>(FileBodyCodec.workOnSysTemp(), file);
  MessageWritterBodyBuffer text(String text) => writeAs<String>(StringBodyCodec(), text);
  MessageWritterBodyBuffer xml(XmlDocument doc) => writeAs<XmlDocument>(XmlBodyCodec(), doc);
  MessageWritterBodyBuffer formParam(FormParamBody form) => writeAs<FormParamBody>(FormParamBodyCodec(), form);
  MessageWritterBodyBuffer protobuff(GeneratedMessage message) =>
      writeAs(ProtobuffBodyCodec(example: message.createEmptyInstance()), message);
  void end() => _body.end();
}

mixin MessageWritterBody {
  MessageWritterBody buffer(Uint8List buffer) {
    return add(MessageBody()..buffer = buffer);
  }

  MessageWritter buffers(Stream<Uint8List> message) {
    return addStream(message.map((event) => MessageBody()..buffer = event));
  }

  MessageWritter object(GeneratedMessage message) {
    return add(MessageBody()..object = Any.pack(message));
  }

  MessageWritter objects(Stream<GeneratedMessage> message) {
    return addStream(message.map((event) => MessageBody()..object = Any.pack(event)));
  }

  MessageWritterBodyBuffer encode() => MessageWritterBodyBuffer(this);
  MessageWritter add(MessageBody body);
  MessageWritter addStream(Stream<MessageBody> body);
  void end();
  MessageWritter self();
}

mixin MessageWritterHeader {
  MessageWritter attribute(String key, String value) {
    self()._header.attributes[key] = value;
    return self();
  }

  MessageWritter contentType(ContentType type) {
    self()._header.contentType = type.toString();
    return self();
  }

  MessageWritter session(MessageSession session) {
    self()._header.session = session;
    return self();
  }

  MessageWritter self();
}

class MessageWritter with MessageWritterBody, MessageWritterHeader {
  final _header = MessageHeader();
  final groupId = Uuid().v4();
  final _ctrl = StreamController<MessagePart>();
  final _pendings = <Future>[];
  var _count = 0;
  var _sentHeader = false;
  MessageWritter._({String correlationId}) {
    _header.correlationId = correlationId;
  }
  MessageHeader get header => _header;
  StreamSink<MessagePart> get sink => _ctrl;
  Stream<MessagePart> get parts => _ctrl.stream;
  factory MessageWritter.response(String correlationId, [ContentType type]) {
    final tmp = MessageWritter._(correlationId: correlationId);
    return tmp..contentType(type ?? ContentTypes.Application.grpc);
  }
  factory MessageWritter.request([ContentType type]) {
    final tmp = MessageWritter._(correlationId: Uuid().v4());
    return tmp..contentType(type ?? ContentTypes.Application.grpc);
  }
  @override
  MessageWritter self() => this;
  void _sendHeaderIfNeeded() {
    if (_sentHeader) return;
    _ctrl.add(MessagePart()
      ..groupId = groupId
      ..header = _header);
    _sentHeader = true;
  }

  MessageWritter addPart(MessagePart part) {
    _sendHeaderIfNeeded();
    _ctrl.add(part
      ..numInGroup = _count++
      ..groupId = groupId);
    return this;
  }

  @override
  MessageWritter add(MessageBody body) {
    _sendHeaderIfNeeded();
    _ctrl.add(MessagePart()
      ..numInGroup = _count++
      ..groupId = groupId
      ..body = body);
    return this;
  }

  MessageWritter addError(String code, {String description, Any details}) {
    _sendHeaderIfNeeded();
    _ctrl.add(MessagePart()
      ..numInGroup = _count++
      ..groupId = groupId
      ..error = (MessageError()
        ..code = code
        ..description = description ?? ''
        ..details = details));
    return this;
  }

  @override
  MessageWritter addStream(Stream<MessageBody> body) {
    return addStreamPart(body.map(
      (event) => MessagePart()
        ..numInGroup = _count++
        ..groupId = groupId
        ..body = event,
    ));
  }

  MessageWritter addStreamPart(Stream<MessagePart> body, {bool autoEnd = false}) {
    _sendHeaderIfNeeded();
    final completer = Completer.sync();
    body
        .map(
      (event) => event
        ..numInGroup = _count++
        ..groupId = groupId,
    )
        .listen((event) {
      _ctrl.add(event);
    }, onDone: () {
      if (autoEnd == true) {
        end();
      }
      completer.complete();
    }, onError: (e, stacktrace) {
      print('[microservice.messageWritter] $e: $stacktrace');
      _ctrl.addError(e);
    });
    _pendings.add(completer.future);
    return this;
  }

  @override
  void end() async {
    //should never wait for end -> because need pending task to finish it should continue
    _sendHeaderIfNeeded();
    await Future.wait(_pendings);
    _ctrl.add(MessagePart()
      ..numInGroup = _count++
      ..groupId = groupId
      ..trailer = (MessageTrailer()..groupLength = _count));
    await _ctrl.close();
  }

  MessageReader asReader() {
    return MessageReader.fromParts(_ctrl.stream);
  }
}
