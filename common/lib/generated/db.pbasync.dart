///
//  Generated code. Do not modify.
//  source: db.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'db.pb.dart' as $1;
import 'json.pb.dart' as $2;
export 'db.pb.dart';

abstract class DBServiceAsync extends $grpc.Service {
  $core.String get $name => 'DBService';
  $core.bool get $isAsync => true;

  DBServiceAsync() {
    $addMethod($grpc.ServiceMethod<$1.FetchPayload, $1.CountResult>(
        'count',
        count_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FetchPayload.fromBuffer(value),
        ($1.CountResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FetchPayload, $2.JsonObjectValue>(
        'fetch',
        fetch_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.FetchPayload.fromBuffer(value),
        ($2.JsonObjectValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FetchPayload, $1.FetchOneResponse>(
        'fetchOne',
        fetchOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FetchPayload.fromBuffer(value),
        ($1.FetchOneResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreatePayload, $1.CreateResult>(
        'create',
        create,
        true,
        true,
        ($core.List<$core.int> value) => $1.CreatePayload.fromBuffer(value),
        ($1.CreateResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PatchPayload, $1.PatchResult>(
        'patch',
        patch,
        true,
        true,
        ($core.List<$core.int> value) => $1.PatchPayload.fromBuffer(value),
        ($1.PatchResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdatePayload, $1.UpdateResult>(
        'update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdatePayload.fromBuffer(value),
        ($1.UpdateResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeletePayload, $1.DeleteResult>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeletePayload.fromBuffer(value),
        ($1.DeleteResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DBSharePayload, $1.CountResult>(
        'share',
        share_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DBSharePayload.fromBuffer(value),
        ($1.CountResult value) => value.writeToBuffer()));
  }

  $async.Future<$1.CountResult> count_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchPayload> request) async {
    return count(await request);
  }

  $async.Stream<$2.JsonObjectValue> fetch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchPayload> request) async* {
    yield* fetch(await request);
  }

  $async.Future<$1.FetchOneResponse> fetchOne_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchPayload> request) async {
    return fetchOne(await request);
  }

  $async.Future<$1.UpdateResult> update_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UpdatePayload> request) async {
    return update(await request);
  }

  $async.Future<$1.DeleteResult> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DeletePayload> request) async {
    return delete(await request);
  }

  $async.Future<$1.CountResult> share_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DBSharePayload> request) async {
    return share(await request);
  }

  $async.Future<$1.CountResult> count($1.FetchPayload request);
  $async.Stream<$2.JsonObjectValue> fetch($1.FetchPayload request);
  $async.Future<$1.FetchOneResponse> fetchOne($1.FetchPayload request);
  $async.Stream<$1.CreateResult> create(
      $async.Stream<$1.CreatePayload> request);
  $async.Stream<$1.PatchResult> patch($async.Stream<$1.PatchPayload> request);
  $async.Future<$1.UpdateResult> update($1.UpdatePayload request);
  $async.Future<$1.DeleteResult> delete($1.DeletePayload request);
  $async.Future<$1.CountResult> share($1.DBSharePayload request);
}

abstract class DBAdminServiceAsync extends $grpc.Service {
  $core.String get $name => 'DBAdminService';
  $core.bool get $isAsync => true;

  DBAdminServiceAsync() {
    $addMethod($grpc.ServiceMethod<$1.CreateIndexPayload, $1.CreateIndexResult>(
        'createIndex',
        createIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateIndexPayload.fromBuffer(value),
        ($1.CreateIndexResult value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateIndexResult> createIndex_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateIndexPayload> request) async {
    return createIndex(await request);
  }

  $async.Future<$1.CreateIndexResult> createIndex(
      $1.CreateIndexPayload request);
}
