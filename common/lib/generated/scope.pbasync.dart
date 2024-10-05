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

abstract class ScopeServiceAsync extends $grpc.Service {
  $core.String get $name => 'ScopeService';
  $core.bool get $isAsync => true;

  ScopeServiceAsync() {
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
    return createScope(await request);
  }

  $async.Future<$4.Role> createRole_Pre(
      $grpc.ServiceCall call, $async.Future<$4.Role> request) async {
    return createRole(await request);
  }

  $async.Future<$4.RoleList> getRoles_Pre(
      $grpc.ServiceCall call, $async.Future<$4.ScopesPayload> request) async {
    return getRoles(await request);
  }

  $async.Future<$4.ScopeEmpty> attachScope_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachScopePayload> request) async {
    return attachScope(await request);
  }

  $async.Future<$4.ScopeEmpty> detachScope_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachScopePayload> request) async {
    return detachScope(await request);
  }

  $async.Future<$4.ScopeEmpty> attachRole_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachRolePayload> request) async {
    return attachRole(await request);
  }

  $async.Future<$4.ScopeEmpty> detachRole_Pre($grpc.ServiceCall call,
      $async.Future<$4.AttachRolePayload> request) async {
    return detachRole(await request);
  }

  $async.Future<$4.RoleList> affectDefaultRoles_Pre(
      $grpc.ServiceCall call, $async.Future<$3.User> request) async {
    return affectDefaultRoles(await request);
  }

  $async.Future<$4.Scope> createScope($4.Scope request);
  $async.Future<$4.Role> createRole($4.Role request);
  $async.Future<$4.RoleList> getRoles($4.ScopesPayload request);
  $async.Future<$4.ScopeEmpty> attachScope($4.AttachScopePayload request);
  $async.Future<$4.ScopeEmpty> detachScope($4.AttachScopePayload request);
  $async.Future<$4.ScopeEmpty> attachRole($4.AttachRolePayload request);
  $async.Future<$4.ScopeEmpty> detachRole($4.AttachRolePayload request);
  $async.Future<$4.RoleList> affectDefaultRoles($3.User request);
}
