///
//  Generated code. Do not modify.
//  source: validate.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:ahouane_common/generated/validate.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $2;
export 'package:ahouane_common/generated/validate.pb.dart';

abstract class ValidationServiceAsync extends $grpc.Service {
  $core.String get $name => 'validate.ValidationService';
  $core.bool get $isAsync => true;

  ValidationServiceAsync() {
    $addMethod($grpc.ServiceMethod<$1.ValidationRequest, $1.ValidationResult>(
        'validate',
        validate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ValidationRequest.fromBuffer(value),
        ($1.ValidationResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ValidationRequest, $2.BoolValue>(
        'isValid',
        isValid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ValidationRequest.fromBuffer(value),
        ($2.BoolValue value) => value.writeToBuffer()));
  }

  $async.Future<$1.ValidationResult> validate_Pre($grpc.ServiceCall call,
      $async.Future<$1.ValidationRequest> request) async {
    return validate(await request);
  }

  $async.Future<$2.BoolValue> isValid_Pre($grpc.ServiceCall call,
      $async.Future<$1.ValidationRequest> request) async {
    return isValid(await request);
  }

  $async.Future<$1.ValidationResult> validate($1.ValidationRequest request);
  $async.Future<$2.BoolValue> isValid($1.ValidationRequest request);
}
