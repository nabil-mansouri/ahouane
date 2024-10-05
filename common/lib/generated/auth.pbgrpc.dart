///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $3;
export 'auth.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$createUserByEmail =
      $grpc.ClientMethod<$3.CreateUserByEmailPayload, $3.User>(
          '/AuthService/createUserByEmail',
          ($3.CreateUserByEmailPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$3.User, $3.User>(
      '/AuthService/updateUser',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$3.User, $3.AuthEmpty>(
      '/AuthService/deleteUser',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));
  static final _$currentUser = $grpc.ClientMethod<$3.AuthEmpty, $3.User>(
      '/AuthService/currentUser',
      ($3.AuthEmpty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$loginInByEmail =
      $grpc.ClientMethod<$3.LoginInByEmailPayload, $3.User>(
          '/AuthService/loginInByEmail',
          ($3.LoginInByEmailPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$3.AuthEmpty, $3.AuthEmpty>(
      '/AuthService/logout',
      ($3.AuthEmpty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));
  static final _$sendMailVerification =
      $grpc.ClientMethod<$3.SendMailVerificationPayload, $3.AuthEmpty>(
          '/AuthService/sendMailVerification',
          ($3.SendMailVerificationPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));
  static final _$sendResetPasswordByMail =
      $grpc.ClientMethod<$3.SendResetPasswordPayload, $3.AuthEmpty>(
          '/AuthService/sendResetPasswordByMail',
          ($3.SendResetPasswordPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));
  static final _$resetPasswordByMail =
      $grpc.ClientMethod<$3.ResetPasswordPayload, $3.User>(
          '/AuthService/resetPasswordByMail',
          ($3.ResetPasswordPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$verifyMail =
      $grpc.ClientMethod<$3.VerifyMailPayload, $3.AuthEmpty>(
          '/AuthService/verifyMail',
          ($3.VerifyMailPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.User> createUserByEmail(
      $3.CreateUserByEmailPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createUserByEmail, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> updateUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> deleteUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> currentUser($3.AuthEmpty request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$currentUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> loginInByEmail($3.LoginInByEmailPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$loginInByEmail, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> logout($3.AuthEmpty request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> sendMailVerification(
      $3.SendMailVerificationPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$sendMailVerification, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> sendResetPasswordByMail(
      $3.SendResetPasswordPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$sendResetPasswordByMail, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.User> resetPasswordByMail(
      $3.ResetPasswordPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$resetPasswordByMail, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> verifyMail($3.VerifyMailPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$verifyMail, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateUserByEmailPayload, $3.User>(
        'createUserByEmail',
        createUserByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateUserByEmailPayload.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.User>(
        'updateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.AuthEmpty>(
        'deleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.AuthEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.AuthEmpty, $3.User>(
        'currentUser',
        currentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.LoginInByEmailPayload, $3.User>(
        'loginInByEmail',
        loginInByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.LoginInByEmailPayload.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.AuthEmpty, $3.AuthEmpty>(
        'logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value),
        ($3.AuthEmpty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.SendMailVerificationPayload, $3.AuthEmpty>(
            'sendMailVerification',
            sendMailVerification_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.SendMailVerificationPayload.fromBuffer(value),
            ($3.AuthEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.SendResetPasswordPayload, $3.AuthEmpty>(
        'sendResetPasswordByMail',
        sendResetPasswordByMail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.SendResetPasswordPayload.fromBuffer(value),
        ($3.AuthEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ResetPasswordPayload, $3.User>(
        'resetPasswordByMail',
        resetPasswordByMail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ResetPasswordPayload.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.VerifyMailPayload, $3.AuthEmpty>(
        'verifyMail',
        verifyMail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.VerifyMailPayload.fromBuffer(value),
        ($3.AuthEmpty value) => value.writeToBuffer()));
  }

  $async.Future<$3.User> createUserByEmail_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateUserByEmailPayload> request) async {
    return createUserByEmail(call, await request);
  }

  $async.Future<$3.User> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$3.AuthEmpty> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$3.User> currentUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AuthEmpty> request) async {
    return currentUser(call, await request);
  }

  $async.Future<$3.User> loginInByEmail_Pre($grpc.ServiceCall call,
      $async.Future<$3.LoginInByEmailPayload> request) async {
    return loginInByEmail(call, await request);
  }

  $async.Future<$3.AuthEmpty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AuthEmpty> request) async {
    return logout(call, await request);
  }

  $async.Future<$3.AuthEmpty> sendMailVerification_Pre($grpc.ServiceCall call,
      $async.Future<$3.SendMailVerificationPayload> request) async {
    return sendMailVerification(call, await request);
  }

  $async.Future<$3.AuthEmpty> sendResetPasswordByMail_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.SendResetPasswordPayload> request) async {
    return sendResetPasswordByMail(call, await request);
  }

  $async.Future<$3.User> resetPasswordByMail_Pre($grpc.ServiceCall call,
      $async.Future<$3.ResetPasswordPayload> request) async {
    return resetPasswordByMail(call, await request);
  }

  $async.Future<$3.AuthEmpty> verifyMail_Pre($grpc.ServiceCall call,
      $async.Future<$3.VerifyMailPayload> request) async {
    return verifyMail(call, await request);
  }

  $async.Future<$3.User> createUserByEmail(
      $grpc.ServiceCall call, $3.CreateUserByEmailPayload request);
  $async.Future<$3.User> updateUser($grpc.ServiceCall call, $3.User request);
  $async.Future<$3.AuthEmpty> deleteUser(
      $grpc.ServiceCall call, $3.User request);
  $async.Future<$3.User> currentUser(
      $grpc.ServiceCall call, $3.AuthEmpty request);
  $async.Future<$3.User> loginInByEmail(
      $grpc.ServiceCall call, $3.LoginInByEmailPayload request);
  $async.Future<$3.AuthEmpty> logout(
      $grpc.ServiceCall call, $3.AuthEmpty request);
  $async.Future<$3.AuthEmpty> sendMailVerification(
      $grpc.ServiceCall call, $3.SendMailVerificationPayload request);
  $async.Future<$3.AuthEmpty> sendResetPasswordByMail(
      $grpc.ServiceCall call, $3.SendResetPasswordPayload request);
  $async.Future<$3.User> resetPasswordByMail(
      $grpc.ServiceCall call, $3.ResetPasswordPayload request);
  $async.Future<$3.AuthEmpty> verifyMail(
      $grpc.ServiceCall call, $3.VerifyMailPayload request);
}

class AuthAdminServiceClient extends $grpc.Client {
  static final _$listUsers = $grpc.ClientMethod<$3.AuthEmpty, $3.User>(
      '/AuthAdminService/listUsers',
      ($3.AuthEmpty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$createUser =
      $grpc.ClientMethod<$3.User, $3.CreateUserResponse>(
          '/AuthAdminService/createUser',
          ($3.User value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.CreateUserResponse.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$3.UpdateUserPayload, $3.User>(
      '/AuthAdminService/updateUser',
      ($3.UpdateUserPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$3.User, $3.AuthEmpty>(
      '/AuthAdminService/deleteUser',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value));
  static final _$blockUser = $grpc.ClientMethod<$3.User, $3.User>(
      '/AuthAdminService/blockUser',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));
  static final _$unblockUser = $grpc.ClientMethod<$3.User, $3.User>(
      '/AuthAdminService/unblockUser',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.User.fromBuffer(value));

  AuthAdminServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$3.User> listUsers($3.AuthEmpty request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(
        _$listUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.CreateUserResponse> createUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> updateUser($3.UpdateUserPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.AuthEmpty> deleteUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> blockUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$blockUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.User> unblockUser($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$unblockUser, request, options: options);
  }
}

abstract class AuthAdminServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthAdminService';

  AuthAdminServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.AuthEmpty, $3.User>(
        'listUsers',
        listUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.AuthEmpty.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.CreateUserResponse>(
        'createUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.CreateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateUserPayload, $3.User>(
        'updateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateUserPayload.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.AuthEmpty>(
        'deleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.AuthEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.User>(
        'blockUser',
        blockUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $3.User>(
        'unblockUser',
        unblockUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($3.User value) => value.writeToBuffer()));
  }

  $async.Stream<$3.User> listUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AuthEmpty> request) async* {
    yield* listUsers(call, await request);
  }

  $async.Future<$3.CreateUserResponse> createUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return createUser(call, await request);
  }

  $async.Future<$3.User> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateUserPayload> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$3.AuthEmpty> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$3.User> blockUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return blockUser(call, await request);
  }

  $async.Future<$3.User> unblockUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return unblockUser(call, await request);
  }

  $async.Stream<$3.User> listUsers(
      $grpc.ServiceCall call, $3.AuthEmpty request);
  $async.Future<$3.CreateUserResponse> createUser(
      $grpc.ServiceCall call, $3.User request);
  $async.Future<$3.User> updateUser(
      $grpc.ServiceCall call, $3.UpdateUserPayload request);
  $async.Future<$3.AuthEmpty> deleteUser(
      $grpc.ServiceCall call, $3.User request);
  $async.Future<$3.User> blockUser($grpc.ServiceCall call, $3.User request);
  $async.Future<$3.User> unblockUser($grpc.ServiceCall call, $3.User request);
}
