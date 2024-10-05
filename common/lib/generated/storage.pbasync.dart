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

abstract class StorageServiceAsync extends $grpc.Service {
  $core.String get $name => 'StorageService';
  $core.bool get $isAsync => true;

  StorageServiceAsync() {
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
    return meta(await request);
  }

  $async.Stream<$1.StorageFile> fetch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoragePath> request) async* {
    yield* fetch(await request);
  }

  $async.Future<$1.StorageEmpty> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoragePath> request) async {
    return delete(await request);
  }

  $async.Future<$1.StorageEmpty> share_Pre($grpc.ServiceCall call,
      $async.Future<$1.StorageSharePayload> request) async {
    return share(await request);
  }

  $async.Future<$1.StorageMeta> meta($1.StoragePath request);
  $async.Stream<$1.StorageFile> fetch($1.StoragePath request);
  $async.Future<$1.StorageMeta> create(
      $async.Stream<$1.StorageCreatePayload> request);
  $async.Future<$1.StorageMeta> update(
      $async.Stream<$1.StorageCreatePayload> request);
  $async.Future<$1.StorageEmpty> delete($1.StoragePath request);
  $async.Future<$1.StorageEmpty> share($1.StorageSharePayload request);
}
