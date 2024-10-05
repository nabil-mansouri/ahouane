///
//  Generated code. Do not modify.
//  source: scope.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'scope.pb.dart' as $4;
import 'auth.pb.dart' as $3;
export 'scope.pb.dart';

class ScopeServiceClient extends $grpc.Client {
  static final _$createScope = $grpc.ClientMethod<$4.Scope, $4.Scope>(
      '/ScopeService/createScope',
      ($4.Scope value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Scope.fromBuffer(value));
  static final _$createRole = $grpc.ClientMethod<$4.Role, $4.Role>(
      '/ScopeService/createRole',
      ($4.Role value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Role.fromBuffer(value));
  static final _$getRoles = $grpc.ClientMethod<$4.ScopesPayload, $4.RoleList>(
      '/ScopeService/getRoles',
      ($4.ScopesPayload value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.RoleList.fromBuffer(value));
  static final _$attachScope =
      $grpc.ClientMethod<$4.AttachScopePayload, $4.ScopeEmpty>(
          '/ScopeService/attachScope',
          ($4.AttachScopePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScopeEmpty.fromBuffer(value));
  static final _$detachScope =
      $grpc.ClientMethod<$4.AttachScopePayload, $4.ScopeEmpty>(
          '/ScopeService/detachScope',
          ($4.AttachScopePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScopeEmpty.fromBuffer(value));
  static final _$attachRole =
      $grpc.ClientMethod<$4.AttachRolePayload, $4.ScopeEmpty>(
          '/ScopeService/attachRole',
          ($4.AttachRolePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScopeEmpty.fromBuffer(value));
  static final _$detachRole =
      $grpc.ClientMethod<$4.AttachRolePayload, $4.ScopeEmpty>(
          '/ScopeService/detachRole',
          ($4.AttachRolePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScopeEmpty.fromBuffer(value));
  static final _$affectDefaultRoles = $grpc.ClientMethod<$3.User, $4.RoleList>(
      '/ScopeService/affectDefaultRoles',
      ($3.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.RoleList.fromBuffer(value));

  ScopeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.Scope> createScope($4.Scope request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createScope, request, options: options);
  }

  $grpc.ResponseFuture<$4.Role> createRole($4.Role request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$createRole, request, options: options);
  }

  $grpc.ResponseFuture<$4.RoleList> getRoles($4.ScopesPayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getRoles, request, options: options);
  }

  $grpc.ResponseFuture<$4.ScopeEmpty> attachScope($4.AttachScopePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$attachScope, request, options: options);
  }

  $grpc.ResponseFuture<$4.ScopeEmpty> detachScope($4.AttachScopePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$detachScope, request, options: options);
  }

  $grpc.ResponseFuture<$4.ScopeEmpty> attachRole($4.AttachRolePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$attachRole, request, options: options);
  }

  $grpc.ResponseFuture<$4.ScopeEmpty> detachRole($4.AttachRolePayload request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$detachRole, request, options: options);
  }

  $grpc.ResponseFuture<$4.RoleList> affectDefaultRoles($3.User request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$affectDefaultRoles, request, options: options);
  }
}

abstract class ScopeServiceBase extends $grpc.Service {
  $core.String get $name => 'ScopeService';

  ScopeServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.Scope, $4.Scope>(
        'createScope',
        createScope_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Scope.fromBuffer(value),
        ($4.Scope value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.Role, $4.Role>(
        'createRole',
        createRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Role.fromBuffer(value),
        ($4.Role value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ScopesPayload, $4.RoleList>(
        'getRoles',
        getRoles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ScopesPayload.fromBuffer(value),
        ($4.RoleList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AttachScopePayload, $4.ScopeEmpty>(
        'attachScope',
        attachScope_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.AttachScopePayload.fromBuffer(value),
        ($4.ScopeEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AttachScopePayload, $4.ScopeEmpty>(
        'detachScope',
        detachScope_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.AttachScopePayload.fromBuffer(value),
        ($4.ScopeEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AttachRolePayload, $4.ScopeEmpty>(
        'attachRole',
        attachRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.AttachRolePayload.fromBuffer(value),
        ($4.ScopeEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AttachRolePayload, $4.ScopeEmpty>(
        'detachRole',
        detachRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.AttachRolePayload.fromBuffer(value),
        ($4.ScopeEmpty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.User, $4.RoleList>(
        'affectDefaultRoles',
        affectDefaultRoles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.User.fromBuffer(value),
        ($4.RoleList value) => value.writeToBuffer()));
  }

  $async.Future<$4.Scope> createScope_Pre(
      $grpc.ServiceCall call, $async.Future<$4.Scope> request) async {
    return createScope(call, await request);
  }

  $async.Future<$4.Role> createRole_Pre(
      $grpc.ServiceCall call, $async.Future<$4.Role> request) async {
    return createRole(call, await request);
  }

  $async.Future<$4.RoleList> getRoles_Pre(
      $grpc.ServiceCall call, $async.Future<$4.ScopesPayload> request) async {
    return getRoles(call, await request);
  }

  $async.Future<$4.ScopeEmpty> attachScope_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachScopePayload> request) async {
    return attachScope(call, await request);
  }

  $async.Future<$4.ScopeEmpty> detachScope_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachScopePayload> request) async {
    return detachScope(call, await request);
  }

  $async.Future<$4.ScopeEmpty> attachRole_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachRolePayload> request) async {
    return attachRole(call, await request);
  }

  $async.Future<$4.ScopeEmpty> detachRole_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachRolePayload> request) async {
    return detachRole(call, await request);
  }

  $async.Future<$4.RoleList> affectDefaultRoles_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return affectDefaultRoles(call, await request);
  }

  $async.Future<$4.Scope> createScope($grpc.ServiceCall call, $4.Scope request);
  $async.Future<$4.Role> createRole($grpc.ServiceCall call, $4.Role request);
  $async.Future<$4.RoleList> getRoles(
      $grpc.ServiceCall call, $4.ScopesPayload request);
  $async.Future<$4.ScopeEmpty> attachScope(
      $grpc.ServiceCall call, $4.AttachScopePayload request);
  $async.Future<$4.ScopeEmpty> detachScope(
      $grpc.ServiceCall call, $4.AttachScopePayload request);
  $async.Future<$4.ScopeEmpty> attachRole(
      $grpc.ServiceCall call, $4.AttachRolePayload request);
  $async.Future<$4.ScopeEmpty> detachRole(
      $grpc.ServiceCall call, $4.AttachRolePayload request);
  $async.Future<$4.RoleList> affectDefaultRoles(
      $grpc.ServiceCall call, $3.User request);
}
