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

class TokenServiceClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$0.CreateTokenPayload, $0.Token>(
      '/TokenService/create',
      ($0.CreateTokenPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Token.fromBuffer(value));
  static final _$validate =
      $grpc.ClientMethod<$0.TokenPayload, $0.TokenValidation>(
          '/TokenService/validate',
          ($0.TokenPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TokenValidation.fromBuffer(value));
  static final _$validateAndRemove =
      $grpc.ClientMethod<$0.TokenPayload, $0.TokenValidation>(
          '/TokenService/validateAndRemove',
          ($0.TokenPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TokenValidation.fromBuffer(value));
  static final _$remove = $grpc.ClientMethod<$0.TokenPayload, $0.TokenEmpty>(
      '/TokenService/remove',
      ($0.TokenPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokenEmpty.fromBuffer(value));

  TokenServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Token> create($0.CreateTokenPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenValidation> validate($0.TokenPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$validate, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenValidation> validateAndRemove(
      $0.TokenPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$validateAndRemove, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenEmpty> remove($0.TokenPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$remove, request, options: options);
  }
}

abstract class TokenServiceBase extends $grpc.Service {
  $core.String get $name => 'TokenService';

  TokenServiceBase() {
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

  $async.Future<$0.Token> create_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTokenPayload> request) async {
    return create(call, await request);
  }

  $async.Future<$0.TokenValidation> validate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TokenPayload> request) async {
    return validate(call, await request);
  }

  $async.Future<$0.TokenValidation> validateAndRemove_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TokenPayload> request) async {
    return validateAndRemove(call, await request);
  }

  $async.Future<$0.TokenEmpty> remove_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TokenPayload> request) async {
    return remove(call, await request);
  }

  $async.Future<$0.Token> create(
      $grpc.ServiceCall call, $0.CreateTokenPayload request);
  $async.Future<$0.TokenValidation> validate(
      $grpc.ServiceCall call, $0.TokenPayload request);
  $async.Future<$0.TokenValidation> validateAndRemove(
      $grpc.ServiceCall call, $0.TokenPayload request);
  $async.Future<$0.TokenEmpty> remove(
      $grpc.ServiceCall call, $0.TokenPayload request);
}
