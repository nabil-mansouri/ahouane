import 'dart:async';
import 'dart:io';
import 'package:ahouane_client/storage.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:grpc/src/client/connection.dart' as grpcconnection;
import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/call.dart';

extension CallOptionsExt on CallOptions {
  bool hasSession() {
    return this is CallOptionsDefault &&
        (this as CallOptionsDefault).session != null;
  }

  MessageSession getSession() {
    return hasSession() ? (this as CallOptionsDefault).session : null;
  }
}

class ServerGrpcServiceCall extends ServiceCall {
  MessageSession messageSession;
  final MessageHeader _header;
  MessageHeader get header => _header;
  @override
  final headers = <String, String>{};
  @override
  final trailers = <String, String>{};
  @override
  final clientMetadata = <String, String>{};
  @override
  final DateTime deadline = DateTime.now().add(Duration(minutes: 60));
  ServerGrpcServiceCall(this.messageSession, this._header);
  @override
  bool get isCanceled => false;

  @override
  bool get isTimedOut => false;

  @override
  void sendHeaders() {}

  @override
  void sendTrailers({int status, String message}) {}

  @override
  X509Certificate get clientCertificate => throw UnimplementedError();
}

class MessageClientCall<Q, R> implements ClientCall<Q, R> {
  final ClientMethod<Q, R> method;
  final Stream<Q> requests;
  @override
  final CallOptions options;

  final _headers = Completer<Map<String, String>>();
  final _trailers = Completer<Map<String, String>>();
  final _responses = StreamController<R>();
  StreamController<R> get responseCtrl => _responses;
  @override
  bool isCancelled = false;
  MessageClientCall(this.method, this.requests, this.options);
  @override
  Future<void> cancel() async {}

  @override
  Stream<R> get response => _responses.stream;

  @override
  Future<Map<String, String>> get headers => _headers.future;

  @override
  Future<Map<String, String>> get trailers => _trailers.future;

  @override
  void onConnectionError(error) {}

  @override
  void onConnectionReady(grpcconnection.ClientConnection connection) {
    throw UnimplementedError('ServerClientChannel.onConnectionReady');
  }
}

class CallOptionsDefault implements CallOptions {
  @override
  final Map<String, String> metadata;

  @override
  final List<MetadataProvider> metadataProviders;
  @override
  final Duration timeout;
  final MessageSession session;
  CallOptionsDefault(
      this.session, this.metadata, this.timeout, this.metadataProviders);
  CallOptionsDefault.withSession(MessageSession session)
      : this(session, {}, null, []);
  @override
  CallOptions mergedWith(CallOptions other) {
    if (other == null) return this;
    final mergedMetadata = Map.from(metadata)..addAll(other.metadata);
    final mergedTimeout = other.timeout ?? timeout;
    final mergedProviders = List.from(metadataProviders)
      ..addAll(other.metadataProviders);
    return CallOptionsDefault(
        other.getSession(),
        Map.unmodifiable(mergedMetadata),
        mergedTimeout,
        List.unmodifiable(mergedProviders));
  }

  @override
  Codec get compression => throw UnimplementedError();
}
