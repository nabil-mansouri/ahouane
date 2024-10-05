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

abstract class AuthServiceAsync extends $grpc.Service {
  $core.String get $name => 'AuthService';
  $core.bool get $isAsync => true;

  AuthServiceAsync() {
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
    return createUserByEmail(await request);
  }

  $async.Future<$3.User> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return updateUser(await request);
  }

  $async.Future<$3.AuthEmpty> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return deleteUser(await request);
  }

  $async.Future<$3.User> currentUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AuthEmpty> request) async {
    return currentUser(await request);
  }

  $async.Future<$3.User> loginInByEmail_Pre($grpc.ServiceCall call,
      $async.Future<$3.LoginInByEmailPayload> request) async {
    return loginInByEmail(await request);
  }

  $async.Future<$3.AuthEmpty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AuthEmpty> request) async {
    return logout(await request);
  }

  $async.Future<$3.AuthEmpty> sendMailVerification_Pre($grpc.ServiceCall call,
      $async.Future<$3.SendMailVerificationPayload> request) async {
    return sendMailVerification(await request);
  }

  $async.Future<$3.AuthEmpty> sendResetPasswordByMail_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.SendResetPasswordPayload> request) async {
    return sendResetPasswordByMail(await request);
  }

  $async.Future<$3.User> resetPasswordByMail_Pre($grpc.ServiceCall call,
      $async.Future<$3.ResetPasswordPayload> request) async {
    return resetPasswordByMail(await request);
  }

  $async.Future<$3.AuthEmpty> verifyMail_Pre($grpc.ServiceCall call,
      $async.Future<$3.VerifyMailPayload> request) async {
    return verifyMail(await request);
  }

  $async.Future<$3.User> createUserByEmail($3.CreateUserByEmailPayload request);
  $async.Future<$3.User> updateUser($3.User request);
  $async.Future<$3.AuthEmpty> deleteUser($3.User request);
  $async.Future<$3.User> currentUser($3.AuthEmpty request);
  $async.Future<$3.User> loginInByEmail($3.LoginInByEmailPayload request);
  $async.Future<$3.AuthEmpty> logout($3.AuthEmpty request);
  $async.Future<$3.AuthEmpty> sendMailVerification(
      $3.SendMailVerificationPayload request);
  $async.Future<$3.AuthEmpty> sendResetPasswordByMail(
      $3.SendResetPasswordPayload request);
  $async.Future<$3.User> resetPasswordByMail($3.ResetPasswordPayload request);
  $async.Future<$3.AuthEmpty> verifyMail($3.VerifyMailPayload request);
}

abstract class AuthAdminServiceAsync extends $grpc.Service {
  $core.String get $name => 'AuthAdminService';
  $core.bool get $isAsync => true;

  AuthAdminServiceAsync() {
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
    yield* listUsers(await request);
  }

  $async.Future<$3.CreateUserResponse> createUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return createUser(await request);
  }

  $async.Future<$3.User> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateUserPayload> request) async {
    return updateUser(await request);
  }

  $async.Future<$3.AuthEmpty> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return deleteUser(await request);
  }

  $async.Future<$3.User> blockUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return blockUser(await request);
  }

  $async.Future<$3.User> unblockUser_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return unblockUser(await request);
  }

  $async.Stream<$3.User> listUsers($3.AuthEmpty request);
  $async.Future<$3.CreateUserResponse> createUser($3.User request);
  $async.Future<$3.User> updateUser($3.UpdateUserPayload request);
  $async.Future<$3.AuthEmpty> deleteUser($3.User request);
  $async.Future<$3.User> blockUser($3.User request);
  $async.Future<$3.User> unblockUser($3.User request);
}
