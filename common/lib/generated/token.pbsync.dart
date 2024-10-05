///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'token.pb.dart' as $0;
export 'token.pb.dart';

abstract class TokenServiceSync extends $grpc.Service {
  $core.String get $name => 'TokenService';
  $core.bool get $isAsync => false;

  TokenServiceSync() {
    $addMethod($grpc.ServiceMethod<$0.CreateTokenPayload, $0.Token>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateTokenPayload.fromBuffer(value),
        ($0.Token value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TokenPayload, $0.TokenValidation>(
        'validate',
        validate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokenPayload.fromBuffer(value),
        ($0.TokenValidation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TokenPayload, $0.TokenValidation>(
        'validateAndRemove',
        validateAndRemove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokenPayload.fromBuffer(value),
        ($0.TokenValidation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TokenPayload, $0.TokenEmpty>(
        'remove',
        remove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokenPayload.fromBuffer(value),
        ($0.TokenEmpty value) => value.writeToBuffer()));
  }

  $0.Token create_Pre($grpc.ServiceCall call, $0.CreateTokenPayload request) {
    return create(request);
  }

  $0.TokenValidation validate_Pre(
      $grpc.ServiceCall call, $0.TokenPayload request) {
    return validate(request);
  }

  $0.TokenValidation validateAndRemove_Pre(
      $grpc.ServiceCall call, $0.TokenPayload request) {
    return validateAndRemove(request);
  }

  $0.TokenEmpty remove_Pre($grpc.ServiceCall call, $0.TokenPayload request) {
    return remove(request);
  }

  $0.Token create($0.CreateTokenPayload request);
  $0.TokenValidation validate($0.TokenPayload request);
  $0.TokenValidation validateAndRemove($0.TokenPayload request);
  $0.TokenEmpty remove($0.TokenPayload request);
}
