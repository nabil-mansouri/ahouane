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

abstract class I18ServiceSync extends $grpc.Service {
  $core.String get $name => 'I18Service';
  $core.bool get $isAsync => false;

  I18ServiceSync() {
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

  $1.I18Value getRawValue_Pre($grpc.ServiceCall call, $1.I18Key request) {
    return getRawValue(request);
  }

  $1.I18Value getRawTemplate_Pre($grpc.ServiceCall call, $1.I18Key request) {
    return getRawTemplate(request);
  }

  $1.I18Value getValue_Pre($grpc.ServiceCall call, $1.I18Key request) {
    return getValue(request);
  }

  $1.I18Value getTemplate_Pre($grpc.ServiceCall call, $1.I18Key request) {
    return getTemplate(request);
  }

  $1.I18Values getKeys_Pre($grpc.ServiceCall call, $1.I18KeysPayload request) {
    return getKeys(request);
  }

  $1.I18Value getRawValue($1.I18Key request);
  $1.I18Value getRawTemplate($1.I18Key request);
  $1.I18Value getValue($1.I18Key request);
  $1.I18Value getTemplate($1.I18Key request);
  $1.I18Values getKeys($1.I18KeysPayload request);
}
