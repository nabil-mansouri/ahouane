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

class DBServiceClient extends $grpc.Client {
  static final _$count = $grpc.ClientMethod<$1.FetchPayload, $1.CountResult>(
      '/DBService/count',
      ($1.FetchPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CountResult.fromBuffer(value));
  static final _$fetch =
      $grpc.ClientMethod<$1.FetchPayload, $2.JsonObjectValue>(
          '/DBService/fetch',
          ($1.FetchPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.JsonObjectValue.fromBuffer(value));
  static final _$fetchOne =
      $grpc.ClientMethod<$1.FetchPayload, $1.FetchOneResponse>(
          '/DBService/fetchOne',
          ($1.FetchPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FetchOneResponse.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$1.CreatePayload, $1.CreateResult>(
      '/DBService/create',
      ($1.CreatePayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateResult.fromBuffer(value));
  static final _$patch = $grpc.ClientMethod<$1.PatchPayload, $1.PatchResult>(
      '/DBService/patch',
      ($1.PatchPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PatchResult.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$1.UpdatePayload, $1.UpdateResult>(
      '/DBService/update',
      ($1.UpdatePayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UpdateResult.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$1.DeletePayload, $1.DeleteResult>(
      '/DBService/delete',
      ($1.DeletePayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DeleteResult.fromBuffer(value));
  static final _$share = $grpc.ClientMethod<$1.DBSharePayload, $1.CountResult>(
      '/DBService/share',
      ($1.DBSharePayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CountResult.fromBuffer(value));

  DBServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CountResult> count($1.FetchPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$count, request, options: options);
  }

  $grpc.ResponseStream<$2.JsonObjectValue> fetch($1.FetchPayload request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$fetch, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.FetchOneResponse> fetchOne($1.FetchPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$fetchOne, request, options: options);
  }

  $grpc.ResponseStream<$1.CreateResult> create(
      $async.Stream<$1.CreatePayload> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$create, request, options: options);
  }

  $grpc.ResponseStream<$1.PatchResult> patch(
      $async.Stream<$1.PatchPayload> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$patch, request, options: options);
  }

  $grpc.ResponseFuture<$1.UpdateResult> update($1.UpdatePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteResult> delete($1.DeletePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$1.CountResult> share($1.DBSharePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$share, request, options: options);
  }
}

abstract class DBServiceBase extends $grpc.Service {
  $core.String get $name => 'DBService';

  DBServiceBase() {
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
    return count(call, await request);
  }

  $async.Stream<$2.JsonObjectValue> fetch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchPayload> request) async* {
    yield* fetch(call, await request);
  }

  $async.Future<$1.FetchOneResponse> fetchOne_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FetchPayload> request) async {
    return fetchOne(call, await request);
  }

  $async.Future<$1.UpdateResult> update_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UpdatePayload> request) async {
    return update(call, await request);
  }

  $async.Future<$1.DeleteResult> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DeletePayload> request) async {
    return delete(call, await request);
  }

  $async.Future<$1.CountResult> share_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DBSharePayload> request) async {
    return share(call, await request);
  }

  $async.Future<$1.CountResult> count(
      $grpc.ServiceCall call, $1.FetchPayload request);
  $async.Stream<$2.JsonObjectValue> fetch(
      $grpc.ServiceCall call, $1.FetchPayload request);
  $async.Future<$1.FetchOneResponse> fetchOne(
      $grpc.ServiceCall call, $1.FetchPayload request);
  $async.Stream<$1.CreateResult> create(
      $grpc.ServiceCall call, $async.Stream<$1.CreatePayload> request);
  $async.Stream<$1.PatchResult> patch(
      $grpc.ServiceCall call, $async.Stream<$1.PatchPayload> request);
  $async.Future<$1.UpdateResult> update(
      $grpc.ServiceCall call, $1.UpdatePayload request);
  $async.Future<$1.DeleteResult> delete(
      $grpc.ServiceCall call, $1.DeletePayload request);
  $async.Future<$1.CountResult> share(
      $grpc.ServiceCall call, $1.DBSharePayload request);
}

class DBAdminServiceClient extends $grpc.Client {
  static final _$createIndex =
      $grpc.ClientMethod<$1.CreateIndexPayload, $1.CreateIndexResult>(
          '/DBAdminService/createIndex',
          ($1.CreateIndexPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CreateIndexResult.fromBuffer(value));

  DBAdminServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateIndexResult> createIndex(
      $1.CreateIndexPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createIndex, request, options: options);
  }
}

abstract class DBAdminServiceBase extends $grpc.Service {
  $core.String get $name => 'DBAdminService';

  DBAdminServiceBase() {
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
    return createIndex(call, await request);
  }

  $async.Future<$1.CreateIndexResult> createIndex(
      $grpc.ServiceCall call, $1.CreateIndexPayload request);
}
