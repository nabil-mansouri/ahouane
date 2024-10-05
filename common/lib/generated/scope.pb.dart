///
//  Generated code. Do not modify.
//  source: scope.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core.pb.dart' as $0;

class ServerScopeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerScopeConfig', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultRoleIds', protoName: 'defaultRoleIds')
    ..pc<Role>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initRoles', $pb.PbFieldType.PM, protoName: 'initRoles', subBuilder: Role.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleResource', protoName: 'roleResource')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userResource', protoName: 'userResource')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scopeResource', protoName: 'scopeResource')
    ..aOM<$0.ChannelServiceConfig>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intercept')
    ..pPS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicScopes', protoName: 'publicScopes')
    ..hasRequiredFields = false
  ;

  ServerScopeConfig._() : super();
  factory ServerScopeConfig({
    $core.Iterable<$core.String> defaultRoleIds,
    $core.Iterable<Role> initRoles,
    $core.String roleResource,
    $core.String userResource,
    $core.String scopeResource,
    $0.ChannelServiceConfig serviceConfig,
    $core.String intercept,
    $core.Iterable<$core.String> publicScopes,
  }) {
    final _result = create();
    if (defaultRoleIds != null) {
      _result.defaultRoleIds.addAll(defaultRoleIds);
    }
    if (initRoles != null) {
      _result.initRoles.addAll(initRoles);
    }
    if (roleResource != null) {
      _result.roleResource = roleResource;
    }
    if (userResource != null) {
      _result.userResource = userResource;
    }
    if (scopeResource != null) {
      _result.scopeResource = scopeResource;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    if (intercept != null) {
      _result.intercept = intercept;
    }
    if (publicScopes != null) {
      _result.publicScopes.addAll(publicScopes);
    }
    return _result;
  }
  factory ServerScopeConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerScopeConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerScopeConfig clone() => ServerScopeConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerScopeConfig copyWith(void Function(ServerScopeConfig) updates) => super.copyWith((message) => updates(message as ServerScopeConfig)) as ServerScopeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerScopeConfig create() => ServerScopeConfig._();
  ServerScopeConfig createEmptyInstance() => create();
  static $pb.PbList<ServerScopeConfig> createRepeated() => $pb.PbList<ServerScopeConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerScopeConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerScopeConfig>(create);
  static ServerScopeConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get defaultRoleIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Role> get initRoles => $_getList(1);

  @$pb.TagNumber(4)
  $core.String get roleResource => $_getSZ(2);
  @$pb.TagNumber(4)
  set roleResource($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoleResource() => $_has(2);
  @$pb.TagNumber(4)
  void clearRoleResource() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userResource => $_getSZ(3);
  @$pb.TagNumber(5)
  set userResource($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserResource() => $_has(3);
  @$pb.TagNumber(5)
  void clearUserResource() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get scopeResource => $_getSZ(4);
  @$pb.TagNumber(6)
  set scopeResource($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasScopeResource() => $_has(4);
  @$pb.TagNumber(6)
  void clearScopeResource() => clearField(6);

  @$pb.TagNumber(7)
  $0.ChannelServiceConfig get serviceConfig => $_getN(5);
  @$pb.TagNumber(7)
  set serviceConfig($0.ChannelServiceConfig v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasServiceConfig() => $_has(5);
  @$pb.TagNumber(7)
  void clearServiceConfig() => clearField(7);
  @$pb.TagNumber(7)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(5);

  @$pb.TagNumber(8)
  $core.String get intercept => $_getSZ(6);
  @$pb.TagNumber(8)
  set intercept($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasIntercept() => $_has(6);
  @$pb.TagNumber(8)
  void clearIntercept() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get publicScopes => $_getList(7);
}

class RoleList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleList', createEmptyInstance: create)
    ..pc<Role>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: Role.create)
    ..hasRequiredFields = false
  ;

  RoleList._() : super();
  factory RoleList({
    $core.Iterable<Role> roles,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory RoleList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleList clone() => RoleList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleList copyWith(void Function(RoleList) updates) => super.copyWith((message) => updates(message as RoleList)) as RoleList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleList create() => RoleList._();
  RoleList createEmptyInstance() => create();
  static $pb.PbList<RoleList> createRepeated() => $pb.PbList<RoleList>();
  @$core.pragma('dart2js:noInline')
  static RoleList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleList>(create);
  static RoleList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Role> get roles => $_getList(0);
}

class Role extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Role', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scopes')
    ..hasRequiredFields = false
  ;

  Role._() : super();
  factory Role({
    $core.String id,
    $core.String name,
    $core.Iterable<$core.String> scopes,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (scopes != null) {
      _result.scopes.addAll(scopes);
    }
    return _result;
  }
  factory Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Role clone() => Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Role copyWith(void Function(Role) updates) => super.copyWith((message) => updates(message as Role)) as Role; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Role create() => Role._();
  Role createEmptyInstance() => create();
  static $pb.PbList<Role> createRepeated() => $pb.PbList<Role>();
  @$core.pragma('dart2js:noInline')
  static Role getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Role>(create);
  static Role _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get scopes => $_getList(2);
}

class Scope extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scope', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Scope._() : super();
  factory Scope({
    $core.String id,
    $core.String name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Scope.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Scope.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Scope clone() => Scope()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Scope copyWith(void Function(Scope) updates) => super.copyWith((message) => updates(message as Scope)) as Scope; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Scope create() => Scope._();
  Scope createEmptyInstance() => create();
  static $pb.PbList<Scope> createRepeated() => $pb.PbList<Scope>();
  @$core.pragma('dart2js:noInline')
  static Scope getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Scope>(create);
  static Scope _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class ScopesPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScopesPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  ScopesPayload._() : super();
  factory ScopesPayload({
    $core.String userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory ScopesPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScopesPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScopesPayload clone() => ScopesPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScopesPayload copyWith(void Function(ScopesPayload) updates) => super.copyWith((message) => updates(message as ScopesPayload)) as ScopesPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScopesPayload create() => ScopesPayload._();
  ScopesPayload createEmptyInstance() => create();
  static $pb.PbList<ScopesPayload> createRepeated() => $pb.PbList<ScopesPayload>();
  @$core.pragma('dart2js:noInline')
  static ScopesPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScopesPayload>(create);
  static ScopesPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class AttachScopePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttachScopePayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scopeId', protoName: 'scopeId')
    ..hasRequiredFields = false
  ;

  AttachScopePayload._() : super();
  factory AttachScopePayload({
    $core.String roleId,
    $core.String scopeId,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (scopeId != null) {
      _result.scopeId = scopeId;
    }
    return _result;
  }
  factory AttachScopePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttachScopePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttachScopePayload clone() => AttachScopePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttachScopePayload copyWith(void Function(AttachScopePayload) updates) => super.copyWith((message) => updates(message as AttachScopePayload)) as AttachScopePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttachScopePayload create() => AttachScopePayload._();
  AttachScopePayload createEmptyInstance() => create();
  static $pb.PbList<AttachScopePayload> createRepeated() => $pb.PbList<AttachScopePayload>();
  @$core.pragma('dart2js:noInline')
  static AttachScopePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttachScopePayload>(create);
  static AttachScopePayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get scopeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set scopeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScopeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearScopeId() => clearField(2);
}

class AttachRolePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttachRolePayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..hasRequiredFields = false
  ;

  AttachRolePayload._() : super();
  factory AttachRolePayload({
    $core.String userId,
    $core.String roleId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    return _result;
  }
  factory AttachRolePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttachRolePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttachRolePayload clone() => AttachRolePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttachRolePayload copyWith(void Function(AttachRolePayload) updates) => super.copyWith((message) => updates(message as AttachRolePayload)) as AttachRolePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttachRolePayload create() => AttachRolePayload._();
  AttachRolePayload createEmptyInstance() => create();
  static $pb.PbList<AttachRolePayload> createRepeated() => $pb.PbList<AttachRolePayload>();
  @$core.pragma('dart2js:noInline')
  static AttachRolePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttachRolePayload>(create);
  static AttachRolePayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);
}

class ScopeEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScopeEmpty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ScopeEmpty._() : super();
  factory ScopeEmpty() => create();
  factory ScopeEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScopeEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScopeEmpty clone() => ScopeEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScopeEmpty copyWith(void Function(ScopeEmpty) updates) => super.copyWith((message) => updates(message as ScopeEmpty)) as ScopeEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScopeEmpty create() => ScopeEmpty._();
  ScopeEmpty createEmptyInstance() => create();
  static $pb.PbList<ScopeEmpty> createRepeated() => $pb.PbList<ScopeEmpty>();
  @$core.pragma('dart2js:noInline')
  static ScopeEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScopeEmpty>(create);
  static ScopeEmpty _defaultInstance;
}

