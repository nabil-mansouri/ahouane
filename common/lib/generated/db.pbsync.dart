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

abstract class DBServiceSync extends $grpc.Service {
  $core.String get $name => 'DBService';
  $core.bool get $isAsync => false;

  DBServiceSync() {
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

  $1.CountResult count_Pre($grpc.ServiceCall call, $1.FetchPayload request) {
    return count(request);
  }

  $core.List<$core.List<$2.JsonObjectValue>> fetch_Pre(
      $grpc.ServiceCall call, $1.FetchPayload request) {
    return fetch(request);
  }

  $1.FetchOneResponse fetchOne_Pre(
      $grpc.ServiceCall call, $1.FetchPayload request) {
    return fetchOne(request);
  }

  $1.UpdateResult update_Pre($grpc.ServiceCall call, $1.UpdatePayload request) {
    return update(request);
  }

  $1.DeleteResult delete_Pre($grpc.ServiceCall call, $1.DeletePayload request) {
    return delete(request);
  }

  $1.CountResult share_Pre($grpc.ServiceCall call, $1.DBSharePayload request) {
    return share(request);
  }

  $1.CountResult count($1.FetchPayload request);
  $core.List<$2.JsonObjectValue> fetch($1.FetchPayload request);
  $1.FetchOneResponse fetchOne($1.FetchPayload request);
  $core.List<$1.CreateResult> create($core.List<$1.CreatePayload> request);
  $core.List<$1.PatchResult> patch($core.List<$1.PatchPayload> request);
  $1.UpdateResult update($1.UpdatePayload request);
  $1.DeleteResult delete($1.DeletePayload request);
  $1.CountResult share($1.DBSharePayload request);
}

abstract class DBAdminServiceSync extends $grpc.Service {
  $core.String get $name => 'DBAdminService';
  $core.bool get $isAsync => false;

  DBAdminServiceSync() {
    $addMethod($grpc.ServiceMethod<$1.CreateIndexPayload, $1.CreateIndexResult>(
        'createIndex',
        createIndex_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateIndexPayload.fromBuffer(value),
        ($1.CreateIndexResult value) => value.writeToBuffer()));
  }

  $1.CreateIndexResult createIndex_Pre(
      $grpc.ServiceCall call, $1.CreateIndexPayload request) {
    return createIndex(request);
  }

  $1.CreateIndexResult createIndex($1.CreateIndexPayload request);
}
