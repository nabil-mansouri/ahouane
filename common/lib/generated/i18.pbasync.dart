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

abstract class I18ServiceAsync extends $grpc.Service {
  $core.String get $name => 'I18Service';
  $core.bool get $isAsync => true;

  I18ServiceAsync() {
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
    return getRawValue(await request);
  }

  $async.Future<$1.I18Value> getRawTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getRawTemplate(await request);
  }

  $async.Future<$1.I18Value> getValue_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getValue(await request);
  }

  $async.Future<$1.I18Value> getTemplate_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18Key> request) async {
    return getTemplate(await request);
  }

  $async.Future<$1.I18Values> getKeys_Pre(
      $grpc.ServiceCall call, $async.Future<$1.I18KeysPayload> request) async {
    return getKeys(await request);
  }

  $async.Future<$1.I18Value> getRawValue($1.I18Key request);
  $async.Future<$1.I18Value> getRawTemplate($1.I18Key request);
  $async.Future<$1.I18Value> getValue($1.I18Key request);
  $async.Future<$1.I18Value> getTemplate($1.I18Key request);
  $async.Future<$1.I18Values> getKeys($1.I18KeysPayload request);
}
