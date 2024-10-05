part of 'microservice.dart';

class MessageSerializer {
  final Sink<List<int>> sink;
  MessageSerializer._(this.sink);

  Future<void> sendMessage(MessageWritter message) async {
    return sendStream(message.parts);
  }

  Future<void> sendStream(Stream<MessagePart> stream) async {
    await for (final chunk in stream) {
      send(chunk);
    }
  }

  void trailer(String trailers) {
    final bytes = StringUtils.toUtf8(trailers);
    final head = Uint8List(5);
    head[0] = 0x80;
    head.buffer.asByteData().setInt32(1, bytes.lengthInBytes);
    sink.add(head);
    sink.add(bytes);
  }

  void send(MessagePart paquet) async {
    final buffer = paquet.writeToBuffer();
    final head = Uint8List(5);
    head[0] = 0x00;
    head.buffer.asByteData().setInt32(1, buffer.lengthInBytes);
    sink.add(head);
    sink.add(buffer);
  }

  void close() => sink.close();

  factory MessageSerializer.std() {
    return MessageSerializer._(stdout);
  }

  factory MessageSerializer.remote(Sink<List<int>> sink) {
    return MessageSerializer._(sink);
  }
}

class MessageDeserializer {
  StreamSubscription _subscription;
  final Stream<List<int>> _input;
  final _controller = StreamController<MessagePart>.broadcast();
  static final Logger logger = MicroApplication.loggerByType(MessageDeserializer);
  MessageDeserializer._(this._input);
  factory MessageDeserializer.std() {
    return MessageDeserializer._(stdin);
  }
  factory MessageDeserializer.remote(Stream<List<int>> stream) {
    return MessageDeserializer._(stream);
  }
  static Stream<MessagePart> convert(Stream<List<int>> input) {
    return input
        .map((event) {
          return Uint8List.fromList(event).buffer;
        })
        .transform(grpcstream.GrpcWebDecoder())
        .map((event) {
          if (event is GrpcData) {
            final paquet = MessagePart()..mergeFromBuffer(event.data);
            return paquet;
          } else {
            logger.error(kLogKeys.notGrpcData(), details: event);
            return null;
          }
        });
  }

  Future<void> start() async {
    await stop();
    _subscription = convert(_input).listen((event) {
      if (event != null) {
        _controller.add(event);
      }
    });
  }

  Future<void> stop() async {
    if (_subscription != null) await _subscription.cancel();
    _subscription = null;
  }

  Stream<MessagePart> receivedParts() => _controller.stream;
  Stream<Stream<MessagePart>> receivedPartsGroups({String correlationId}) => receivedParts().where((value) {
        return value.groupId?.isNotEmpty == true;
      }).groupByExt((value) => value.groupId, stopper: (part) {
        return part.hasTrailer();
      });
  Stream<MessageReader> receivedMessages({String correlationId}) =>
      receivedPartsGroups(correlationId: correlationId).map((event) => MessageReader.fromParts(event)).asyncMap((event) async {
        final header = await event.header();
        if (correlationId == null || header.correlationId == correlationId) {
          return event;
        }
        return null;
      }).where((event) => event != null);
}

//===========
extension GroupByExtension2<T> on Stream<T> {
  Stream<GroupByStream<T, S>> groupByExt<S>(
    S Function(T value) grouper, {
    bool Function(T value) stopper,
  }) {
    return Stream.eventTransformed(this, (sink) {
      return _GroupByStreamSink2<T, S>(sink, grouper, stopper);
    });
  }
}

class _GroupByStreamSink2<S, T> implements EventSink<S> {
  final T Function(S event) _grouper;
  final bool Function(S event) _stopped;
  final EventSink<GroupByStream<S, T>> _outputSink;
  final _mapper = <T, StreamController<S>>{};

  _GroupByStreamSink2(this._outputSink, this._grouper, this._stopped);

  @override
  void add(S data) {
    final key = _grouper(data);

    final groupedController = _mapper.putIfAbsent(key, () {
      return _controllerBuilder(key);
    });

    groupedController.add(data);
    if (_stopped(data)) {
      groupedController.close();
      _mapper.remove(key);
    }
  }

  @override
  void addError(e, [st]) => _outputSink.addError(e, st);

  @override
  void close() {
    _mapper.values.forEach((c) => c.close());
    _mapper.clear();

    _outputSink.close();
  }

  StreamController<S> _controllerBuilder(T forKey) {
    final groupedController = StreamController<S>();

    _outputSink.add(GroupByStream<S, T>(forKey, groupedController.stream));

    return groupedController;
  }
}
