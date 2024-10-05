part of 'microservice.dart';

extension MessageReaderExtCustom on MessageHeader {
  Optional<T> getCustom<T extends GeneratedMessage>(T example) {
    return Optional.ofNullable(custom
        .where((element) => element.canUnpackInto(example))
        .map((e) => e.unpackInto(example))
        .firstWhere((element) => true, orElse: () => null));
  }

  void setCustom<T extends GeneratedMessage>(T example) {
    custom.removeWhere((element) => element.canUnpackInto(example));
    custom.add(Any.pack(example));
  }
}

class MessageReaderBodyBuffer {
  final MessageReaderBody _body;
  MessageReaderBodyBuffer(this._body);

  Future<T> readAs<T>(BodyCodec<T> codec) => codec.decode(_body.buffer());
  Future<Json> json() => readAs<Json>(JsonBodyCodec());
  Future<File> file() => readAs<File>(FileBodyCodec.workOnSysTemp());
  Future<String> text() => readAs<String>(StringBodyCodec());
  Future<XmlDocument> xml() => readAs<XmlDocument>(XmlBodyCodec());
  Future<FormParamBody> formParam() => readAs<FormParamBody>(FormParamBodyCodec());
  Future<T> protobuff<T extends GeneratedMessage>(T example) => readAs(ProtobuffBodyCodec(example: example));
}

mixin MessageReaderBody {
  Stream<Uint8List> buffer() {
    return body().where((event) => event.hasBuffer()).map((event) => event.buffer);
  }

  Stream<T> objects<T extends GeneratedMessage>(T example, [void Function(MessageError) onError]) {
    //hasObject is false-> see in clientside
    return body(onError)
        .where((event) => event.hasObject() && event.object.canUnpackInto(example))
        .map((event) => event.object.unpackInto(example.deepCopy()));
  }

  MessageReaderBodyBuffer decode() => MessageReaderBodyBuffer(this);
  Stream<MessageBody> body([void Function(MessageError) onError]);
}

mixin MessageReaderHeader {
  Future<String> attribute(String key) => header().then((value) => value.attributes[key]);
  Future<bool> isType(ContentType type) => contentType().then((value) => ContentTypes.matchMimetype(type, value));
  Future<ContentType> contentType() => header().then((value) => ContentType.parse(value.contentType));
  Future<MessageSession> session() => header().then((value) => value.session);
  Future<MessageHeader> header();
}

class MessageReader with MessageReaderBody {
  final _header = Completer<MessageHeader>.sync();
  final _trailer = Completer<MessageTrailer>.sync();
  final _redirect = StreamController<MessagePart>.broadcast();
  final _firstPart = Completer<MessagePart>.sync();
  StreamSubscription<MessagePart> sub;
  MessageReader._(Stream<MessagePart> _parts) {
    sub = _parts.listen((part) {
      //print('[MessageReader.listen] part: ${part.toDebugString()}');
      if (!_firstPart.isCompleted) {
        _firstPart.complete(part);
      }
      //
      if (part.hasHeader() && !_header.isCompleted) {
        _header.complete(part.header);
      } else if (part.hasTrailer() && !_trailer.isCompleted) {
        _trailer.complete(part.trailer);
      }
      _redirect.add(part);
    }, onDone: () {
      _redirect.close();
    }, onError: (e, stack) {
      print('[microservice.messageReader] $e: $stack');
      _redirect.addError(e);
    });
    sub.pause();
    _redirect.onListen = () {
      //print('[MessageReader] listening broadcast...');
      sub.resume();
    };
    _redirect.onCancel = () {
      //print('[MessageReader] pausing broadcast...');
      sub.pause();
    };
  }

  factory MessageReader.fromParts(Stream<MessagePart> parts) {
    return MessageReader._(parts);
  }
  Future<MessageWritter> createResponse() {
    return firstPart().then((value) => MessageWritter.response(value.groupId));
  }

  Future<MessageWritter> asWritter() {
    return pipe(MessageWritter.request());
  }

  @override
  Stream<MessageBody> body([void Function(MessageError) onError]) {
    return _redirect.stream
        .where((event) {
          if (event.hasError()) {
            if (onError != null) onError(event.error);
            //print(
            //    '[MessageReader.error] event: ${event.error.toDebugString()}');
            return null;
          }
          return event.hasBody();
        })
        .where((event) => event != null)
        .map((event) {
          //print('[MessageReader.body] event: ${event.body.toDebugString()}');
          return event.body;
        });
  }

  Future<T> _getNext<T>(Completer<T> c) {
    if (c.isCompleted) return c.future;
    sub.resume();
    return c.future.then((value) {
      sub.pause();
      return value;
    });
  }

  Future<MessageHeader> header() => _getNext(_header);
  Future<MessageTrailer> trailer() => _getNext(_trailer);
  Future<MessagePart> firstPart() => _getNext(_firstPart);

  Future<MessageWritter> pipe(MessageWritter writter) async {
    await writter.sink.addStream(_redirect.stream);
    await writter.sink.close();
    return writter;
  }

  Stream<MessagePart> get parts {
    return _redirect.stream;
  }
}
