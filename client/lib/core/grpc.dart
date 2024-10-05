part of 'core.dart';

class _ClientChannelProxy extends ClientChannelBase {
  final ClientApplication app;
  final String adminApiKey;
  final Uri uri;
  _ClientChannelProxy(this.app, this.uri, {this.adminApiKey}) : super();
  @override
  ClientCall<Q, R> createCall<Q, R>(ClientMethod<Q, R> originalMethod, Stream<Q> requests, CallOptions optionsOriginal) {
    final method = _ClientMethodProxy<Q, R>(originalMethod);
    final options = optionsOriginal.mergedWith(CallOptions(metadata: app.session));
    //
    final call = super.createCall(method, requests, options);
    //
    call.headers.then((value) {
      app.session[ClientApplication.SESSION_KEY] = value['set-cookie'];
    });
    return (call);
  }

  @override
  ClientConnection createConnection() => _XhrClientConnection(uri, authorization: adminApiKey);
}

class _ClientMethodProxy<Q, R> implements ClientMethod<Q, R> {
  final ClientMethod<Q, R> inner;
  _ClientMethodProxy(this.inner);
  @override
  String get path => inner.path;

  @override
  List<int> Function(Q value) get requestSerializer {
    return (Q value) {
      final body = MessageBody()..object = Any.pack(value as GeneratedMessage);
      final ser = (MessagePart()..body = body).writeToBuffer().cast<int>();
      //print('[_ClientMethod.requestSerializer] $ser');
      return ser;
    };
  }

  @override
  R Function(List<int> value) get responseDeserializer => (List<int> value) {
        final part = MessagePart.fromBuffer(value);
        final example = inner.responseDeserializer(<int>[]);
        if (part.hasError()) {
          return null; //grpcstatus and message contains error
        }
        final res = part.body.object.unpackInto(example as GeneratedMessage);
        return res as R;
      };
}
