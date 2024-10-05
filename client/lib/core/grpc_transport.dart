part of 'core.dart';

class _XhrClientConnection extends ClientConnection {
  final Uri uri;
  final String authorization;
  http.Client _client;

  final Set<_XhrTransportStream> _requests = {};

  _XhrClientConnection(this.uri, {this.authorization}) {
    _client = createClient();
  }
  @override
  String get authority => uri.authority;
  @override
  String get scheme => uri.scheme;

  void _initializeRequest(http.StreamedRequest request, Map<String, String> metadata) {
    for (final header in metadata.keys) {
      request.headers[header] = metadata[header];
    }
    request.headers[HttpHeaders.contentTypeHeader] = 'application/grpc-web+proto';
    if (authorization?.isNotEmpty == true) {
      request.headers[HttpHeaders.authorizationHeader] = 'Basic ${StringUtils.toBase64(authorization)}';
    }
  }

  http.StreamedRequest createHttpRequest(String path) => http.StreamedRequest('POST', uri.resolve(path));

  http.Client createClient() => http.Client();

  @override
  GrpcTransportStream makeRequest(
    String path,
    Duration timeout,
    Map<String, String> metadata,
    ErrorHandler onError, {
    CallOptions callOptions,
  }) {
    final request = createHttpRequest(path);

    _initializeRequest(request, metadata);

    final transportStream = _XhrTransportStream(_client, request, onError: onError, onDone: _removeStream);
    _requests.add(transportStream);
    return transportStream;
  }

  void _removeStream(_XhrTransportStream stream) {
    _requests.remove(stream);
  }

  @override
  Future<void> terminate() async {
    for (final request in _requests) {
      // ignore: unawaited_futures
      request.terminate();
    }
  }

  @override
  void dispatchCall(ClientCall call) {
    call.onConnectionReady(this);
  }

  @override
  Future<void> shutdown() async {}
}

class _XhrTransportStream implements GrpcTransportStream {
  final http.Client _client;
  final http.StreamedRequest _request;
  final ErrorHandler _onError;
  final Function(_XhrTransportStream stream) _onDone;
  final StreamController<ByteBuffer> _incomingProcessor = StreamController();
  final StreamController<GrpcMessage> _incomingMessages = StreamController();
  final StreamController<List<int>> _outgoingMessages = StreamController();

  @override
  Stream<GrpcMessage> get incomingMessages => _incomingMessages.stream;

  @override
  StreamSink<List<int>> get outgoingMessages => _outgoingMessages.sink;

  List<int> frame(List<int> payload) {
    final payloadLength = payload.length;
    final bytes = Uint8List(payloadLength + 5);
    final header = bytes.buffer.asByteData(0, 5);
    header.setUint8(0, 0);
    header.setUint32(1, payloadLength);
    bytes.setRange(5, bytes.length, payload);
    return bytes;
  }

  _XhrTransportStream(this._client, this._request, {onError, onDone})
      : _onError = onError,
        _onDone = onDone {
    final asyncOnError = (e, st) {
      if (_incomingMessages.isClosed) {
        return;
      }
      _onError(GrpcError.unavailable('XhrConnection connection-error'), st);
      terminate();
    };
    final sendFuture = _client.send(_request);

    _outgoingMessages.stream.map(frame).listen(
        (data) {
          _request.sink.add(data);
        },
        cancelOnError: true,
        onError: asyncOnError,
        onDone: () {
          _request.sink.close();
        });

    sendFuture.then((response) {
      var firstMessage = true;
      if (_incomingMessages.isClosed) {
        return;
      }
      if (firstMessage) {
        if (!_onHeadersReceived(response)) {
          return;
        }
      }
      firstMessage = false;
      response.stream.listen((data) {
        _incomingProcessor.add(Uint8List.fromList(data).buffer);
      }, onDone: _close);
    }).catchError(asyncOnError);

    _incomingProcessor.stream
        .transform(grpcstream.GrpcWebDecoder())
        .transform(grpcDecompressor())
        .listen(_incomingMessages.add, onError: _onError, onDone: _incomingMessages.close);
  }

  bool _onHeadersReceived(http.StreamedResponse response) {
    final contentType = response.headers['content-type'];
    if (response.statusCode != 200) {
      _onError(GrpcError.unavailable('XhrConnection status ${response.statusCode}'), StackTrace.current);
      return false;
    }
    if (contentType == null) {
      _onError(GrpcError.unavailable('XhrConnection missing Content-Type'), StackTrace.current);
      return false;
    }
    if (!contentType.startsWith('application/grpc')) {
      _onError(GrpcError.unavailable('XhrConnection bad Content-Type $contentType'), StackTrace.current);
      return false;
    }

    // Force a metadata message with headers.
    final headers = GrpcMetadata(response.headers);
    _incomingMessages.add(headers);
    return true;
  }

  void _close() {
    _incomingProcessor.close();
    _outgoingMessages.close();
    _onDone(this);
  }

  @override
  Future<void> terminate() async {
    _close();
  }
}
