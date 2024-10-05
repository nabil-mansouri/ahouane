///
//  Generated code. Do not modify.
//  source: i18.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'i18.pb.dart' as $1;
export 'i18.pb.dart';

class I18ServiceClient extends $grpc.Client {
  static final _$getRawValue = $grpc.ClientMethod<$1.I18Key, $1.I18Value>(
      '/I18Service/getRawValue',
      ($1.I18Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.I18Value.fromBuffer(value));
  static final _$getRawTemplate = $grpc.ClientMethod<$1.I18Key, $1.I18Value>(
      '/I18Service/getRawTemplate',
      ($1.I18Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.I18Value.fromBuffer(value));
  static final _$getValue = $grpc.ClientMethod<$1.I18Key, $1.I18Value>(
      '/I18Service/getValue',
      ($1.I18Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.I18Value.fromBuffer(value));
  static final _$getTemplate = $grpc.ClientMethod<$1.I18Key, $1.I18Value>(
      '/I18Service/getTemplate',
      ($1.I18Key value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.I18Value.fromBuffer(value));
  static final _$getKeys = $grpc.ClientMethod<$1.I18KeysPayload, $1.I18Values>(
      '/I18Service/getKeys',
      ($1.I18KeysPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.I18Values.fromBuffer(value));

  I18ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.I18Value> getRawValue($1.I18Key request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getRawValue, request, options: options);
  }

  $grpc.ResponseFuture<$1.I18Value> getRawTemplate($1.I18Key request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getRawTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$1.I18Value> getValue($1.I18Key request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getValue, request, options: options);
  }

  $grpc.ResponseFuture<$1.I18Value> getTemplate($1.I18Key request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getTemplate, request, options: options);
  }

  $grpc.ResponseFuture<$1.I18Values> getKeys($1.I18KeysPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getKeys, request, options: options);
  }
}

abstract class I18ServiceBase extends $grpc.Service {
  $core.String get $name => 'I18Service';

  I18ServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.I18Key, $1.I18Value>(
        'getRawValue',
        getRawValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.I18Key.fromBuffer(value),
        ($1.I18Value value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.I18Key, $1.I18Value>(
        'getRawTemplate',
        getRawTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.I18Key.fromBuffer(value),
        ($1.I18Value value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.I18Key, $1.I18Value>(
        'getValue',
        getValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.I18Key.fromBuffer(value),
        ($1.I18Value value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.I18Key, $1.I18Value>(
        'getTemplate',
        getTemplate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.I18Key.fromBuffer(value),
        ($1.I18Value value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.I18KeysPayload, $1.I18Values>(
        'getKeys',
        getKeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.I18KeysPayload.fromBuffer(value),
        ($1.I18Values value) => value.writeToBuffer()));
  }

  $async.Future<$1.I18Value> getRawValue_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getRawValue(call, await request);
  }

  $async.Future<$1.I18Value> getRawTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getRawTemplate(call, await request);
  }

  $async.Future<$1.I18Value> getValue_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getValue(call, await request);
  }

  $async.Future<$1.I18Value> getTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getTemplate(call, await request);
  }

  $async.Future<$1.I18Values> getKeys_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18KeysPayload> request) async {
    return getKeys(call, await request);
  }

  $async.Future<$1.I18Value> getRawValue(
      $grpc.ServiceCall call, $1.I18Key request);
  $async.Future<$1.I18Value> getRawTemplate(
      $grpc.ServiceCall call, $1.I18Key request);
  $async.Future<$1.I18Value> getValue(
      $grpc.ServiceCall call, $1.I18Key request);
  $async.Future<$1.I18Value> getTemplate(
      $grpc.ServiceCall call, $1.I18Key request);
  $async.Future<$1.I18Values> getKeys(
      $grpc.ServiceCall call, $1.I18KeysPayload request);
}
