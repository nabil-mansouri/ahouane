///
//  Generated code. Do not modify.
//  source: storage.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'storage.pb.dart' as $1;
export 'storage.pb.dart';

class StorageServiceClient extends $grpc.Client {
  static final _$meta = $grpc.ClientMethod<$1.StoragePath, $1.StorageMeta>(
      '/StorageService/meta',
      ($1.StoragePath value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StorageMeta.fromBuffer(value));
  static final _$fetch = $grpc.ClientMethod<$1.StoragePath, $1.StorageFile>(
      '/StorageService/fetch',
      ($1.StoragePath value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StorageFile.fromBuffer(value));
  static final _$create =
      $grpc.ClientMethod<$1.StorageCreatePayload, $1.StorageMeta>(
          '/StorageService/create',
          ($1.StorageCreatePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StorageMeta.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$1.StorageCreatePayload, $1.StorageMeta>(
          '/StorageService/update',
          ($1.StorageCreatePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StorageMeta.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$1.StoragePath, $1.StorageEmpty>(
      '/StorageService/delete',
      ($1.StoragePath value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StorageEmpty.fromBuffer(value));
  static final _$share =
      $grpc.ClientMethod<$1.StorageSharePayload, $1.StorageEmpty>(
          '/StorageService/share',
          ($1.StorageSharePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StorageEmpty.fromBuffer(value));

  StorageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StorageMeta> meta($1.StoragePath request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$meta, request, options: options);
  }

  $grpc.ResponseStream<$1.StorageFile> fetch($1.StoragePath request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$fetch, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.StorageMeta> create(
      $async.Stream<$1.StorageCreatePayload> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$create, request, options: options).single;
  }

  $grpc.ResponseFuture<$1.StorageMeta> update(
      $async.Stream<$1.StorageCreatePayload> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$update, request, options: options).single;
  }

  $grpc.ResponseFuture<$1.StorageEmpty> delete($1.StoragePath request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$1.StorageEmpty> share($1.StorageSharePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$share, request, options: options);
  }
}

abstract class StorageServiceBase extends $grpc.Service {
  $core.String get $name => 'StorageService';

  StorageServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.StoragePath, $1.StorageMeta>(
        'meta',
        meta_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StoragePath.fromBuffer(value),
        ($1.StorageMeta value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StoragePath, $1.StorageFile>(
        'fetch',
        fetch_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StoragePath.fromBuffer(value),
        ($1.StorageFile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StorageCreatePayload, $1.StorageMeta>(
        'create',
        create,
        true,
        false,
        ($core.List<$core.int> value) =>
            $1.StorageCreatePayload.fromBuffer(value),
        ($1.StorageMeta value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StorageCreatePayload, $1.StorageMeta>(
        'update',
        update,
        true,
        false,
        ($core.List<$core.int> value) =>
            $1.StorageCreatePayload.fromBuffer(value),
        ($1.StorageMeta value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StoragePath, $1.StorageEmpty>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StoragePath.fromBuffer(value),
        ($1.StorageEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StorageSharePayload, $1.StorageEmpty>(
        'share',
        share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.StorageSharePayload.fromBuffer(value),
        ($1.StorageEmpty value) => value.writeToBuffer()));
  }

  $async.Future<$1.StorageMeta> meta_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoragePath> request) async {
    return meta(call, await request);
  }

  $async.Stream<$1.StorageFile> fetch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoragePath> request) async* {
    yield* fetch(call, await request);
  }

  $async.Future<$1.StorageEmpty> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoragePath> request) async {
    return delete(call, await request);
  }

  $async.Future<$1.StorageEmpty> share_Pre($grpc.ServiceCall call,
      $async.Future<$1.StorageSharePayload> request) async {
    return share(call, await request);
  }

  $async.Future<$1.StorageMeta> meta(
      $grpc.ServiceCall call, $1.StoragePath request);
  $async.Stream<$1.StorageFile> fetch(
      $grpc.ServiceCall call, $1.StoragePath request);
  $async.Future<$1.StorageMeta> create(
      $grpc.ServiceCall call, $async.Stream<$1.StorageCreatePayload> request);
  $async.Future<$1.StorageMeta> update(
      $grpc.ServiceCall call, $async.Stream<$1.StorageCreatePayload> request);
  $async.Future<$1.StorageEmpty> delete(
      $grpc.ServiceCall call, $1.StoragePath request);
  $async.Future<$1.StorageEmpty> share(
      $grpc.ServiceCall call, $1.StorageSharePayload request);
}
