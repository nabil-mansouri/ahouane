///
//  Generated code. Do not modify.
//  source: db.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core.pb.dart' as $0;
import 'json.pb.dart' as $2;
import 'google/protobuf/any.pb.dart' as $3;
import 'google/protobuf/timestamp.pb.dart' as $4;

import 'db.pbenum.dart';

export 'db.pbenum.dart';

class MongoDBConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MongoDBConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'db')
    ..aOM<$0.ChannelServiceConfig>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicResources', protoName: 'publicResources')
    ..pPS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protectedResources', protoName: 'protectedResources')
    ..pPS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateResources', protoName: 'privateResources')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'collectionPrefix', protoName: 'collectionPrefix')
    ..hasRequiredFields = false
  ;

  MongoDBConfig._() : super();
  factory MongoDBConfig({
    $core.String host,
    $core.int port,
    $core.String db,
    $0.ChannelServiceConfig serviceConfig,
    $core.String username,
    $core.String password,
    $core.Iterable<$core.String> publicResources,
    $core.Iterable<$core.String> protectedResources,
    $core.Iterable<$core.String> privateResources,
    $core.String collectionPrefix,
  }) {
    final _result = create();
    if (host != null) {
      _result.host = host;
    }
    if (port != null) {
      _result.port = port;
    }
    if (db != null) {
      _result.db = db;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    if (username != null) {
      _result.username = username;
    }
    if (password != null) {
      _result.password = password;
    }
    if (publicResources != null) {
      _result.publicResources.addAll(publicResources);
    }
    if (protectedResources != null) {
      _result.protectedResources.addAll(protectedResources);
    }
    if (privateResources != null) {
      _result.privateResources.addAll(privateResources);
    }
    if (collectionPrefix != null) {
      _result.collectionPrefix = collectionPrefix;
    }
    return _result;
  }
  factory MongoDBConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MongoDBConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MongoDBConfig clone() => MongoDBConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MongoDBConfig copyWith(void Function(MongoDBConfig) updates) => super.copyWith((message) => updates(message as MongoDBConfig)) as MongoDBConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MongoDBConfig create() => MongoDBConfig._();
  MongoDBConfig createEmptyInstance() => create();
  static $pb.PbList<MongoDBConfig> createRepeated() => $pb.PbList<MongoDBConfig>();
  @$core.pragma('dart2js:noInline')
  static MongoDBConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MongoDBConfig>(create);
  static MongoDBConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get db => $_getSZ(2);
  @$pb.TagNumber(3)
  set db($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDb() => $_has(2);
  @$pb.TagNumber(3)
  void clearDb() => clearField(3);

  @$pb.TagNumber(4)
  $0.ChannelServiceConfig get serviceConfig => $_getN(3);
  @$pb.TagNumber(4)
  set serviceConfig($0.ChannelServiceConfig v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasServiceConfig() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceConfig() => clearField(4);
  @$pb.TagNumber(4)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get username => $_getSZ(4);
  @$pb.TagNumber(5)
  set username($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearUsername() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get publicResources => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get protectedResources => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.String> get privateResources => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get collectionPrefix => $_getSZ(9);
  @$pb.TagNumber(10)
  set collectionPrefix($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCollectionPrefix() => $_has(9);
  @$pb.TagNumber(10)
  void clearCollectionPrefix() => clearField(10);
}

class DBSharePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBSharePayload', createEmptyInstance: create)
    ..pc<DBShareRow>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toAdd', $pb.PbFieldType.PM, protoName: 'toAdd', subBuilder: DBShareRow.create)
    ..pc<DBShareRow>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toRemove', $pb.PbFieldType.PM, protoName: 'toRemove', subBuilder: DBShareRow.create)
    ..aOM<Query>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Query.create)
    ..hasRequiredFields = false
  ;

  DBSharePayload._() : super();
  factory DBSharePayload({
    $core.Iterable<DBShareRow> toAdd,
    $core.Iterable<DBShareRow> toRemove,
    Query query,
  }) {
    final _result = create();
    if (toAdd != null) {
      _result.toAdd.addAll(toAdd);
    }
    if (toRemove != null) {
      _result.toRemove.addAll(toRemove);
    }
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory DBSharePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBSharePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBSharePayload clone() => DBSharePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBSharePayload copyWith(void Function(DBSharePayload) updates) => super.copyWith((message) => updates(message as DBSharePayload)) as DBSharePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBSharePayload create() => DBSharePayload._();
  DBSharePayload createEmptyInstance() => create();
  static $pb.PbList<DBSharePayload> createRepeated() => $pb.PbList<DBSharePayload>();
  @$core.pragma('dart2js:noInline')
  static DBSharePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBSharePayload>(create);
  static DBSharePayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DBShareRow> get toAdd => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<DBShareRow> get toRemove => $_getList(1);

  @$pb.TagNumber(3)
  Query get query => $_getN(2);
  @$pb.TagNumber(3)
  set query(Query v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => clearField(3);
  @$pb.TagNumber(3)
  Query ensureQuery() => $_ensure(2);
}

enum DBShareRow_ShareOneof {
  user, 
  role, 
  public, 
  authenticated, 
  notSet
}

class DBShareRow extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DBShareRow_ShareOneof> _DBShareRow_ShareOneofByTag = {
    1 : DBShareRow_ShareOneof.user,
    2 : DBShareRow_ShareOneof.role,
    3 : DBShareRow_ShareOneof.public,
    4 : DBShareRow_ShareOneof.authenticated,
    0 : DBShareRow_ShareOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBShareRow', createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'public')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenticated')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'read')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'write')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'manage')
    ..hasRequiredFields = false
  ;

  DBShareRow._() : super();
  factory DBShareRow({
    $core.String user,
    $core.String role,
    $core.bool public,
    $core.bool authenticated,
    $core.bool read,
    $core.bool write,
    $core.bool manage,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (role != null) {
      _result.role = role;
    }
    if (public != null) {
      _result.public = public;
    }
    if (authenticated != null) {
      _result.authenticated = authenticated;
    }
    if (read != null) {
      _result.read = read;
    }
    if (write != null) {
      _result.write = write;
    }
    if (manage != null) {
      _result.manage = manage;
    }
    return _result;
  }
  factory DBShareRow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBShareRow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBShareRow clone() => DBShareRow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBShareRow copyWith(void Function(DBShareRow) updates) => super.copyWith((message) => updates(message as DBShareRow)) as DBShareRow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBShareRow create() => DBShareRow._();
  DBShareRow createEmptyInstance() => create();
  static $pb.PbList<DBShareRow> createRepeated() => $pb.PbList<DBShareRow>();
  @$core.pragma('dart2js:noInline')
  static DBShareRow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBShareRow>(create);
  static DBShareRow _defaultInstance;

  DBShareRow_ShareOneof whichShareOneof() => _DBShareRow_ShareOneofByTag[$_whichOneof(0)];
  void clearShareOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get user => $_getSZ(0);
  @$pb.TagNumber(1)
  set user($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get public => $_getBF(2);
  @$pb.TagNumber(3)
  set public($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublic() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublic() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get authenticated => $_getBF(3);
  @$pb.TagNumber(4)
  set authenticated($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenticated() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenticated() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get read => $_getBF(4);
  @$pb.TagNumber(5)
  set read($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRead() => $_has(4);
  @$pb.TagNumber(5)
  void clearRead() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get write => $_getBF(5);
  @$pb.TagNumber(6)
  set write($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWrite() => $_has(5);
  @$pb.TagNumber(6)
  void clearWrite() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get manage => $_getBF(6);
  @$pb.TagNumber(7)
  set manage($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasManage() => $_has(6);
  @$pb.TagNumber(7)
  void clearManage() => clearField(7);
}

class CountResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CountResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CountResult._() : super();
  factory CountResult({
    $core.int count,
  }) {
    final _result = create();
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory CountResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountResult clone() => CountResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountResult copyWith(void Function(CountResult) updates) => super.copyWith((message) => updates(message as CountResult)) as CountResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CountResult create() => CountResult._();
  CountResult createEmptyInstance() => create();
  static $pb.PbList<CountResult> createRepeated() => $pb.PbList<CountResult>();
  @$core.pragma('dart2js:noInline')
  static CountResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountResult>(create);
  static CountResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class FetchOneResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchOneResponse', createEmptyInstance: create)
    ..aOM<$2.JsonObjectValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'object', subBuilder: $2.JsonObjectValue.create)
    ..hasRequiredFields = false
  ;

  FetchOneResponse._() : super();
  factory FetchOneResponse({
    $2.JsonObjectValue object,
  }) {
    final _result = create();
    if (object != null) {
      _result.object = object;
    }
    return _result;
  }
  factory FetchOneResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchOneResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchOneResponse clone() => FetchOneResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchOneResponse copyWith(void Function(FetchOneResponse) updates) => super.copyWith((message) => updates(message as FetchOneResponse)) as FetchOneResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchOneResponse create() => FetchOneResponse._();
  FetchOneResponse createEmptyInstance() => create();
  static $pb.PbList<FetchOneResponse> createRepeated() => $pb.PbList<FetchOneResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchOneResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchOneResponse>(create);
  static FetchOneResponse _defaultInstance;

  @$pb.TagNumber(1)
  $2.JsonObjectValue get object => $_getN(0);
  @$pb.TagNumber(1)
  set object($2.JsonObjectValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasObject() => $_has(0);
  @$pb.TagNumber(1)
  void clearObject() => clearField(1);
  @$pb.TagNumber(1)
  $2.JsonObjectValue ensureObject() => $_ensure(0);
}

class CreateIndexPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateIndexPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unique')
    ..pc<QuerySort>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: QuerySort.create)
    ..aOM<$3.Any>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'others', subBuilder: $3.Any.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireAfterSeconds', $pb.PbFieldType.O3, protoName: 'expireAfterSeconds')
    ..hasRequiredFields = false
  ;

  CreateIndexPayload._() : super();
  factory CreateIndexPayload({
    $core.String name,
    $core.String resource,
    $core.bool unique,
    $core.Iterable<QuerySort> fields,
    $3.Any others,
    $core.int expireAfterSeconds,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (resource != null) {
      _result.resource = resource;
    }
    if (unique != null) {
      _result.unique = unique;
    }
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    if (others != null) {
      _result.others = others;
    }
    if (expireAfterSeconds != null) {
      _result.expireAfterSeconds = expireAfterSeconds;
    }
    return _result;
  }
  factory CreateIndexPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateIndexPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateIndexPayload clone() => CreateIndexPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateIndexPayload copyWith(void Function(CreateIndexPayload) updates) => super.copyWith((message) => updates(message as CreateIndexPayload)) as CreateIndexPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateIndexPayload create() => CreateIndexPayload._();
  CreateIndexPayload createEmptyInstance() => create();
  static $pb.PbList<CreateIndexPayload> createRepeated() => $pb.PbList<CreateIndexPayload>();
  @$core.pragma('dart2js:noInline')
  static CreateIndexPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateIndexPayload>(create);
  static CreateIndexPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resource => $_getSZ(1);
  @$pb.TagNumber(2)
  set resource($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get unique => $_getBF(2);
  @$pb.TagNumber(3)
  set unique($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnique() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnique() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<QuerySort> get fields => $_getList(3);

  @$pb.TagNumber(6)
  $3.Any get others => $_getN(4);
  @$pb.TagNumber(6)
  set others($3.Any v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOthers() => $_has(4);
  @$pb.TagNumber(6)
  void clearOthers() => clearField(6);
  @$pb.TagNumber(6)
  $3.Any ensureOthers() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.int get expireAfterSeconds => $_getIZ(5);
  @$pb.TagNumber(7)
  set expireAfterSeconds($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasExpireAfterSeconds() => $_has(5);
  @$pb.TagNumber(7)
  void clearExpireAfterSeconds() => clearField(7);
}

class CreateIndexResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateIndexResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nbIndex', $pb.PbFieldType.O3, protoName: 'nbIndex')
    ..hasRequiredFields = false
  ;

  CreateIndexResult._() : super();
  factory CreateIndexResult({
    $core.int nbIndex,
  }) {
    final _result = create();
    if (nbIndex != null) {
      _result.nbIndex = nbIndex;
    }
    return _result;
  }
  factory CreateIndexResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateIndexResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateIndexResult clone() => CreateIndexResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateIndexResult copyWith(void Function(CreateIndexResult) updates) => super.copyWith((message) => updates(message as CreateIndexResult)) as CreateIndexResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateIndexResult create() => CreateIndexResult._();
  CreateIndexResult createEmptyInstance() => create();
  static $pb.PbList<CreateIndexResult> createRepeated() => $pb.PbList<CreateIndexResult>();
  @$core.pragma('dart2js:noInline')
  static CreateIndexResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateIndexResult>(create);
  static CreateIndexResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nbIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set nbIndex($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNbIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearNbIndex() => clearField(1);
}

class FetchPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPayload', createEmptyInstance: create)
    ..aOM<Query>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Query.create)
    ..hasRequiredFields = false
  ;

  FetchPayload._() : super();
  factory FetchPayload({
    Query query,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory FetchPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPayload clone() => FetchPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPayload copyWith(void Function(FetchPayload) updates) => super.copyWith((message) => updates(message as FetchPayload)) as FetchPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPayload create() => FetchPayload._();
  FetchPayload createEmptyInstance() => create();
  static $pb.PbList<FetchPayload> createRepeated() => $pb.PbList<FetchPayload>();
  @$core.pragma('dart2js:noInline')
  static FetchPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPayload>(create);
  static FetchPayload _defaultInstance;

  @$pb.TagNumber(1)
  Query get query => $_getN(0);
  @$pb.TagNumber(1)
  set query(Query v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
  @$pb.TagNumber(1)
  Query ensureQuery() => $_ensure(0);
}

class CreatePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..aOM<$2.JsonObjectValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $2.JsonObjectValue.create)
    ..aOM<DBSharePayload>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'share', subBuilder: DBSharePayload.create)
    ..hasRequiredFields = false
  ;

  CreatePayload._() : super();
  factory CreatePayload({
    $core.String resource,
    $2.JsonObjectValue value,
    DBSharePayload share,
  }) {
    final _result = create();
    if (resource != null) {
      _result.resource = resource;
    }
    if (value != null) {
      _result.value = value;
    }
    if (share != null) {
      _result.share = share;
    }
    return _result;
  }
  factory CreatePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePayload clone() => CreatePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePayload copyWith(void Function(CreatePayload) updates) => super.copyWith((message) => updates(message as CreatePayload)) as CreatePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePayload create() => CreatePayload._();
  CreatePayload createEmptyInstance() => create();
  static $pb.PbList<CreatePayload> createRepeated() => $pb.PbList<CreatePayload>();
  @$core.pragma('dart2js:noInline')
  static CreatePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePayload>(create);
  static CreatePayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => clearField(1);

  @$pb.TagNumber(2)
  $2.JsonObjectValue get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($2.JsonObjectValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  $2.JsonObjectValue ensureValue() => $_ensure(1);

  @$pb.TagNumber(3)
  DBSharePayload get share => $_getN(2);
  @$pb.TagNumber(3)
  set share(DBSharePayload v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearShare() => clearField(3);
  @$pb.TagNumber(3)
  DBSharePayload ensureShare() => $_ensure(2);
}

class CreateResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateResult', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  CreateResult._() : super();
  factory CreateResult({
    $core.String id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory CreateResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateResult clone() => CreateResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateResult copyWith(void Function(CreateResult) updates) => super.copyWith((message) => updates(message as CreateResult)) as CreateResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateResult create() => CreateResult._();
  CreateResult createEmptyInstance() => create();
  static $pb.PbList<CreateResult> createRepeated() => $pb.PbList<CreateResult>();
  @$core.pragma('dart2js:noInline')
  static CreateResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateResult>(create);
  static CreateResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PatchPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatchPayload', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upsert')
    ..aOM<Query>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Query.create)
    ..pc<DBPatchOperation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operation', $pb.PbFieldType.PM, subBuilder: DBPatchOperation.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'multiple')
    ..hasRequiredFields = false
  ;

  PatchPayload._() : super();
  factory PatchPayload({
    $core.bool upsert,
    Query query,
    $core.Iterable<DBPatchOperation> operation,
    $core.bool multiple,
  }) {
    final _result = create();
    if (upsert != null) {
      _result.upsert = upsert;
    }
    if (query != null) {
      _result.query = query;
    }
    if (operation != null) {
      _result.operation.addAll(operation);
    }
    if (multiple != null) {
      _result.multiple = multiple;
    }
    return _result;
  }
  factory PatchPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatchPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatchPayload clone() => PatchPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatchPayload copyWith(void Function(PatchPayload) updates) => super.copyWith((message) => updates(message as PatchPayload)) as PatchPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatchPayload create() => PatchPayload._();
  PatchPayload createEmptyInstance() => create();
  static $pb.PbList<PatchPayload> createRepeated() => $pb.PbList<PatchPayload>();
  @$core.pragma('dart2js:noInline')
  static PatchPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatchPayload>(create);
  static PatchPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get upsert => $_getBF(0);
  @$pb.TagNumber(1)
  set upsert($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpsert() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpsert() => clearField(1);

  @$pb.TagNumber(2)
  Query get query => $_getN(1);
  @$pb.TagNumber(2)
  set query(Query v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);
  @$pb.TagNumber(2)
  Query ensureQuery() => $_ensure(1);

  @$pb.TagNumber(4)
  $core.List<DBPatchOperation> get operation => $_getList(2);

  @$pb.TagNumber(5)
  $core.bool get multiple => $_getBF(3);
  @$pb.TagNumber(5)
  set multiple($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasMultiple() => $_has(3);
  @$pb.TagNumber(5)
  void clearMultiple() => clearField(5);
}

class PatchResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PatchResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nbModified', $pb.PbFieldType.O3, protoName: 'nbModified')
    ..hasRequiredFields = false
  ;

  PatchResult._() : super();
  factory PatchResult({
    $core.int nbModified,
  }) {
    final _result = create();
    if (nbModified != null) {
      _result.nbModified = nbModified;
    }
    return _result;
  }
  factory PatchResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatchResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PatchResult clone() => PatchResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PatchResult copyWith(void Function(PatchResult) updates) => super.copyWith((message) => updates(message as PatchResult)) as PatchResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatchResult create() => PatchResult._();
  PatchResult createEmptyInstance() => create();
  static $pb.PbList<PatchResult> createRepeated() => $pb.PbList<PatchResult>();
  @$core.pragma('dart2js:noInline')
  static PatchResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PatchResult>(create);
  static PatchResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nbModified => $_getIZ(0);
  @$pb.TagNumber(1)
  set nbModified($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNbModified() => $_has(0);
  @$pb.TagNumber(1)
  void clearNbModified() => clearField(1);
}

class UpdatePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePayload', createEmptyInstance: create)
    ..aOM<Query>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Query.create)
    ..aOM<$2.JsonObjectValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $2.JsonObjectValue.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upsert')
    ..aOM<DBSharePayload>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'share', subBuilder: DBSharePayload.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'multiple')
    ..hasRequiredFields = false
  ;

  UpdatePayload._() : super();
  factory UpdatePayload({
    Query query,
    $2.JsonObjectValue value,
    $core.bool upsert,
    DBSharePayload share,
    $core.bool multiple,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    if (value != null) {
      _result.value = value;
    }
    if (upsert != null) {
      _result.upsert = upsert;
    }
    if (share != null) {
      _result.share = share;
    }
    if (multiple != null) {
      _result.multiple = multiple;
    }
    return _result;
  }
  factory UpdatePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePayload clone() => UpdatePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePayload copyWith(void Function(UpdatePayload) updates) => super.copyWith((message) => updates(message as UpdatePayload)) as UpdatePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePayload create() => UpdatePayload._();
  UpdatePayload createEmptyInstance() => create();
  static $pb.PbList<UpdatePayload> createRepeated() => $pb.PbList<UpdatePayload>();
  @$core.pragma('dart2js:noInline')
  static UpdatePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePayload>(create);
  static UpdatePayload _defaultInstance;

  @$pb.TagNumber(1)
  Query get query => $_getN(0);
  @$pb.TagNumber(1)
  set query(Query v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
  @$pb.TagNumber(1)
  Query ensureQuery() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.JsonObjectValue get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($2.JsonObjectValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  $2.JsonObjectValue ensureValue() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get upsert => $_getBF(2);
  @$pb.TagNumber(3)
  set upsert($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpsert() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpsert() => clearField(3);

  @$pb.TagNumber(4)
  DBSharePayload get share => $_getN(3);
  @$pb.TagNumber(4)
  set share(DBSharePayload v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasShare() => $_has(3);
  @$pb.TagNumber(4)
  void clearShare() => clearField(4);
  @$pb.TagNumber(4)
  DBSharePayload ensureShare() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get multiple => $_getBF(4);
  @$pb.TagNumber(5)
  set multiple($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMultiple() => $_has(4);
  @$pb.TagNumber(5)
  void clearMultiple() => clearField(5);
}

class UpdateResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nbModified', $pb.PbFieldType.O3, protoName: 'nbModified')
    ..hasRequiredFields = false
  ;

  UpdateResult._() : super();
  factory UpdateResult({
    $core.int nbModified,
  }) {
    final _result = create();
    if (nbModified != null) {
      _result.nbModified = nbModified;
    }
    return _result;
  }
  factory UpdateResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateResult clone() => UpdateResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateResult copyWith(void Function(UpdateResult) updates) => super.copyWith((message) => updates(message as UpdateResult)) as UpdateResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateResult create() => UpdateResult._();
  UpdateResult createEmptyInstance() => create();
  static $pb.PbList<UpdateResult> createRepeated() => $pb.PbList<UpdateResult>();
  @$core.pragma('dart2js:noInline')
  static UpdateResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateResult>(create);
  static UpdateResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nbModified => $_getIZ(0);
  @$pb.TagNumber(1)
  set nbModified($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNbModified() => $_has(0);
  @$pb.TagNumber(1)
  void clearNbModified() => clearField(1);
}

class DeletePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePayload', createEmptyInstance: create)
    ..aOM<Query>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Query.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'multiple')
    ..hasRequiredFields = false
  ;

  DeletePayload._() : super();
  factory DeletePayload({
    Query query,
    $core.bool multiple,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    if (multiple != null) {
      _result.multiple = multiple;
    }
    return _result;
  }
  factory DeletePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePayload clone() => DeletePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePayload copyWith(void Function(DeletePayload) updates) => super.copyWith((message) => updates(message as DeletePayload)) as DeletePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePayload create() => DeletePayload._();
  DeletePayload createEmptyInstance() => create();
  static $pb.PbList<DeletePayload> createRepeated() => $pb.PbList<DeletePayload>();
  @$core.pragma('dart2js:noInline')
  static DeletePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePayload>(create);
  static DeletePayload _defaultInstance;

  @$pb.TagNumber(1)
  Query get query => $_getN(0);
  @$pb.TagNumber(1)
  set query(Query v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
  @$pb.TagNumber(1)
  Query ensureQuery() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get multiple => $_getBF(1);
  @$pb.TagNumber(2)
  set multiple($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMultiple() => $_has(1);
  @$pb.TagNumber(2)
  void clearMultiple() => clearField(2);
}

class DeleteResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nbDeleted', $pb.PbFieldType.O3, protoName: 'nbDeleted')
    ..hasRequiredFields = false
  ;

  DeleteResult._() : super();
  factory DeleteResult({
    $core.int nbDeleted,
  }) {
    final _result = create();
    if (nbDeleted != null) {
      _result.nbDeleted = nbDeleted;
    }
    return _result;
  }
  factory DeleteResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteResult clone() => DeleteResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteResult copyWith(void Function(DeleteResult) updates) => super.copyWith((message) => updates(message as DeleteResult)) as DeleteResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteResult create() => DeleteResult._();
  DeleteResult createEmptyInstance() => create();
  static $pb.PbList<DeleteResult> createRepeated() => $pb.PbList<DeleteResult>();
  @$core.pragma('dart2js:noInline')
  static DeleteResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteResult>(create);
  static DeleteResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nbDeleted => $_getIZ(0);
  @$pb.TagNumber(1)
  set nbDeleted($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNbDeleted() => $_has(0);
  @$pb.TagNumber(1)
  void clearNbDeleted() => clearField(1);
}

class UnknownStringValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnknownStringValue', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'representation')
    ..hasRequiredFields = false
  ;

  UnknownStringValue._() : super();
  factory UnknownStringValue({
    $core.String representation,
  }) {
    final _result = create();
    if (representation != null) {
      _result.representation = representation;
    }
    return _result;
  }
  factory UnknownStringValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnknownStringValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnknownStringValue clone() => UnknownStringValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnknownStringValue copyWith(void Function(UnknownStringValue) updates) => super.copyWith((message) => updates(message as UnknownStringValue)) as UnknownStringValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnknownStringValue create() => UnknownStringValue._();
  UnknownStringValue createEmptyInstance() => create();
  static $pb.PbList<UnknownStringValue> createRepeated() => $pb.PbList<UnknownStringValue>();
  @$core.pragma('dart2js:noInline')
  static UnknownStringValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnknownStringValue>(create);
  static UnknownStringValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get representation => $_getSZ(0);
  @$pb.TagNumber(1)
  set representation($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepresentation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepresentation() => clearField(1);
}

enum DBValue_DbvalueOneof {
  regexValue, 
  objectId, 
  dateValue, 
  bufferValue, 
  unknown, 
  notSet
}

class DBValue extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DBValue_DbvalueOneof> _DBValue_DbvalueOneofByTag = {
    1 : DBValue_DbvalueOneof.regexValue,
    2 : DBValue_DbvalueOneof.objectId,
    3 : DBValue_DbvalueOneof.dateValue,
    4 : DBValue_DbvalueOneof.bufferValue,
    5 : DBValue_DbvalueOneof.unknown,
    0 : DBValue_DbvalueOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBValue', createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regexValue', protoName: 'regexValue')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objectId', protoName: 'objectId')
    ..aOM<$4.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateValue', protoName: 'dateValue', subBuilder: $4.Timestamp.create)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bufferValue', $pb.PbFieldType.OY, protoName: 'bufferValue')
    ..aOM<UnknownStringValue>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unknown', subBuilder: UnknownStringValue.create)
    ..hasRequiredFields = false
  ;

  DBValue._() : super();
  factory DBValue({
    $core.String regexValue,
    $core.String objectId,
    $4.Timestamp dateValue,
    $core.List<$core.int> bufferValue,
    UnknownStringValue unknown,
  }) {
    final _result = create();
    if (regexValue != null) {
      _result.regexValue = regexValue;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (dateValue != null) {
      _result.dateValue = dateValue;
    }
    if (bufferValue != null) {
      _result.bufferValue = bufferValue;
    }
    if (unknown != null) {
      _result.unknown = unknown;
    }
    return _result;
  }
  factory DBValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBValue clone() => DBValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBValue copyWith(void Function(DBValue) updates) => super.copyWith((message) => updates(message as DBValue)) as DBValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBValue create() => DBValue._();
  DBValue createEmptyInstance() => create();
  static $pb.PbList<DBValue> createRepeated() => $pb.PbList<DBValue>();
  @$core.pragma('dart2js:noInline')
  static DBValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBValue>(create);
  static DBValue _defaultInstance;

  DBValue_DbvalueOneof whichDbvalueOneof() => _DBValue_DbvalueOneofByTag[$_whichOneof(0)];
  void clearDbvalueOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get regexValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set regexValue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegexValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegexValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasObjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectId() => clearField(2);

  @$pb.TagNumber(3)
  $4.Timestamp get dateValue => $_getN(2);
  @$pb.TagNumber(3)
  set dateValue($4.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateValue() => clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureDateValue() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bufferValue => $_getN(3);
  @$pb.TagNumber(4)
  set bufferValue($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBufferValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBufferValue() => clearField(4);

  @$pb.TagNumber(5)
  UnknownStringValue get unknown => $_getN(4);
  @$pb.TagNumber(5)
  set unknown(UnknownStringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUnknown() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnknown() => clearField(5);
  @$pb.TagNumber(5)
  UnknownStringValue ensureUnknown() => $_ensure(4);
}

class DBLinkOperation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBLinkOperation', createEmptyInstance: create)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignId', protoName: 'foreignId')
    ..aOM<DBForeignField>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignField', protoName: 'foreignField', subBuilder: DBForeignField.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..hasRequiredFields = false
  ;

  DBLinkOperation._() : super();
  factory DBLinkOperation({
    $core.Iterable<$core.String> foreignId,
    DBForeignField foreignField,
    $core.bool link,
  }) {
    final _result = create();
    if (foreignId != null) {
      _result.foreignId.addAll(foreignId);
    }
    if (foreignField != null) {
      _result.foreignField = foreignField;
    }
    if (link != null) {
      _result.link = link;
    }
    return _result;
  }
  factory DBLinkOperation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBLinkOperation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBLinkOperation clone() => DBLinkOperation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBLinkOperation copyWith(void Function(DBLinkOperation) updates) => super.copyWith((message) => updates(message as DBLinkOperation)) as DBLinkOperation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBLinkOperation create() => DBLinkOperation._();
  DBLinkOperation createEmptyInstance() => create();
  static $pb.PbList<DBLinkOperation> createRepeated() => $pb.PbList<DBLinkOperation>();
  @$core.pragma('dart2js:noInline')
  static DBLinkOperation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBLinkOperation>(create);
  static DBLinkOperation _defaultInstance;

  @$pb.TagNumber(3)
  $core.List<$core.String> get foreignId => $_getList(0);

  @$pb.TagNumber(4)
  DBForeignField get foreignField => $_getN(1);
  @$pb.TagNumber(4)
  set foreignField(DBForeignField v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasForeignField() => $_has(1);
  @$pb.TagNumber(4)
  void clearForeignField() => clearField(4);
  @$pb.TagNumber(4)
  DBForeignField ensureForeignField() => $_ensure(1);

  @$pb.TagNumber(5)
  $core.bool get link => $_getBF(2);
  @$pb.TagNumber(5)
  set link($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(5)
  void clearLink() => clearField(5);
}

class DBPatchListOperation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBPatchListOperation', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'add')
    ..pc<$2.JsonObjectValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', $pb.PbFieldType.PM, subBuilder: $2.JsonObjectValue.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..hasRequiredFields = false
  ;

  DBPatchListOperation._() : super();
  factory DBPatchListOperation({
    $core.bool add,
    $core.Iterable<$2.JsonObjectValue> values,
    $core.String fieldName,
  }) {
    final _result = create();
    if (add != null) {
      _result.add = add;
    }
    if (values != null) {
      _result.values.addAll(values);
    }
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    return _result;
  }
  factory DBPatchListOperation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBPatchListOperation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBPatchListOperation clone() => DBPatchListOperation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBPatchListOperation copyWith(void Function(DBPatchListOperation) updates) => super.copyWith((message) => updates(message as DBPatchListOperation)) as DBPatchListOperation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBPatchListOperation create() => DBPatchListOperation._();
  DBPatchListOperation createEmptyInstance() => create();
  static $pb.PbList<DBPatchListOperation> createRepeated() => $pb.PbList<DBPatchListOperation>();
  @$core.pragma('dart2js:noInline')
  static DBPatchListOperation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBPatchListOperation>(create);
  static DBPatchListOperation _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get add => $_getBF(0);
  @$pb.TagNumber(1)
  set add($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdd() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdd() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$2.JsonObjectValue> get values => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get fieldName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fieldName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldName() => clearField(3);
}

class DBPatchUpdateOperation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBPatchUpdateOperation', createEmptyInstance: create)
    ..m<$core.String, $2.JsonValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', entryClassName: 'DBPatchUpdateOperation.DataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $2.JsonValue.create)
    ..hasRequiredFields = false
  ;

  DBPatchUpdateOperation._() : super();
  factory DBPatchUpdateOperation({
    $core.Map<$core.String, $2.JsonValue> data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory DBPatchUpdateOperation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBPatchUpdateOperation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBPatchUpdateOperation clone() => DBPatchUpdateOperation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBPatchUpdateOperation copyWith(void Function(DBPatchUpdateOperation) updates) => super.copyWith((message) => updates(message as DBPatchUpdateOperation)) as DBPatchUpdateOperation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBPatchUpdateOperation create() => DBPatchUpdateOperation._();
  DBPatchUpdateOperation createEmptyInstance() => create();
  static $pb.PbList<DBPatchUpdateOperation> createRepeated() => $pb.PbList<DBPatchUpdateOperation>();
  @$core.pragma('dart2js:noInline')
  static DBPatchUpdateOperation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBPatchUpdateOperation>(create);
  static DBPatchUpdateOperation _defaultInstance;

  @$pb.TagNumber(3)
  $core.Map<$core.String, $2.JsonValue> get data => $_getMap(0);
}

enum DBPatchOperation_PathopeOneof {
  link, 
  listOpe, 
  updateOp, 
  notSet
}

class DBPatchOperation extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DBPatchOperation_PathopeOneof> _DBPatchOperation_PathopeOneofByTag = {
    1 : DBPatchOperation_PathopeOneof.link,
    2 : DBPatchOperation_PathopeOneof.listOpe,
    3 : DBPatchOperation_PathopeOneof.updateOp,
    0 : DBPatchOperation_PathopeOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBPatchOperation', createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DBLinkOperation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link', subBuilder: DBLinkOperation.create)
    ..aOM<DBPatchListOperation>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listOpe', protoName: 'listOpe', subBuilder: DBPatchListOperation.create)
    ..aOM<DBPatchUpdateOperation>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateOp', protoName: 'updateOp', subBuilder: DBPatchUpdateOperation.create)
    ..hasRequiredFields = false
  ;

  DBPatchOperation._() : super();
  factory DBPatchOperation({
    DBLinkOperation link,
    DBPatchListOperation listOpe,
    DBPatchUpdateOperation updateOp,
  }) {
    final _result = create();
    if (link != null) {
      _result.link = link;
    }
    if (listOpe != null) {
      _result.listOpe = listOpe;
    }
    if (updateOp != null) {
      _result.updateOp = updateOp;
    }
    return _result;
  }
  factory DBPatchOperation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBPatchOperation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBPatchOperation clone() => DBPatchOperation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBPatchOperation copyWith(void Function(DBPatchOperation) updates) => super.copyWith((message) => updates(message as DBPatchOperation)) as DBPatchOperation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBPatchOperation create() => DBPatchOperation._();
  DBPatchOperation createEmptyInstance() => create();
  static $pb.PbList<DBPatchOperation> createRepeated() => $pb.PbList<DBPatchOperation>();
  @$core.pragma('dart2js:noInline')
  static DBPatchOperation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBPatchOperation>(create);
  static DBPatchOperation _defaultInstance;

  DBPatchOperation_PathopeOneof whichPathopeOneof() => _DBPatchOperation_PathopeOneofByTag[$_whichOneof(0)];
  void clearPathopeOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DBLinkOperation get link => $_getN(0);
  @$pb.TagNumber(1)
  set link(DBLinkOperation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearLink() => clearField(1);
  @$pb.TagNumber(1)
  DBLinkOperation ensureLink() => $_ensure(0);

  @$pb.TagNumber(2)
  DBPatchListOperation get listOpe => $_getN(1);
  @$pb.TagNumber(2)
  set listOpe(DBPatchListOperation v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasListOpe() => $_has(1);
  @$pb.TagNumber(2)
  void clearListOpe() => clearField(2);
  @$pb.TagNumber(2)
  DBPatchListOperation ensureListOpe() => $_ensure(1);

  @$pb.TagNumber(3)
  DBPatchUpdateOperation get updateOp => $_getN(2);
  @$pb.TagNumber(3)
  set updateOp(DBPatchUpdateOperation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateOp() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateOp() => clearField(3);
  @$pb.TagNumber(3)
  DBPatchUpdateOperation ensureUpdateOp() => $_ensure(2);
}

class Query extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Query', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..pc<QueryProjection>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projections', $pb.PbFieldType.PM, subBuilder: QueryProjection.create)
    ..pc<QueryFilter>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.PM, subBuilder: QueryFilter.create)
    ..pc<QuerySort>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sorts', $pb.PbFieldType.PM, subBuilder: QuerySort.create)
    ..pc<QueryJoin>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joins', $pb.PbFieldType.PM, subBuilder: QueryJoin.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'skip', $pb.PbFieldType.O3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Query._() : super();
  factory Query({
    $core.String resource,
    $core.Iterable<QueryProjection> projections,
    $core.Iterable<QueryFilter> filters,
    $core.Iterable<QuerySort> sorts,
    $core.Iterable<QueryJoin> joins,
    $core.int skip,
    $core.int limit,
  }) {
    final _result = create();
    if (resource != null) {
      _result.resource = resource;
    }
    if (projections != null) {
      _result.projections.addAll(projections);
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    if (sorts != null) {
      _result.sorts.addAll(sorts);
    }
    if (joins != null) {
      _result.joins.addAll(joins);
    }
    if (skip != null) {
      _result.skip = skip;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory Query.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Query.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Query clone() => Query()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Query copyWith(void Function(Query) updates) => super.copyWith((message) => updates(message as Query)) as Query; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Query create() => Query._();
  Query createEmptyInstance() => create();
  static $pb.PbList<Query> createRepeated() => $pb.PbList<Query>();
  @$core.pragma('dart2js:noInline')
  static Query getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Query>(create);
  static Query _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<QueryProjection> get projections => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<QueryFilter> get filters => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<QuerySort> get sorts => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<QueryJoin> get joins => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get skip => $_getIZ(5);
  @$pb.TagNumber(6)
  set skip($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSkip() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkip() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get limit => $_getIZ(6);
  @$pb.TagNumber(7)
  set limit($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearLimit() => clearField(7);
}

class QueryJoin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryJoin', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..pc<QueryJoinCompare>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comparators', $pb.PbFieldType.PM, subBuilder: QueryJoinCompare.create)
    ..hasRequiredFields = false
  ;

  QueryJoin._() : super();
  factory QueryJoin({
    $core.String resource,
    $core.Iterable<QueryJoinCompare> comparators,
  }) {
    final _result = create();
    if (resource != null) {
      _result.resource = resource;
    }
    if (comparators != null) {
      _result.comparators.addAll(comparators);
    }
    return _result;
  }
  factory QueryJoin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryJoin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryJoin clone() => QueryJoin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryJoin copyWith(void Function(QueryJoin) updates) => super.copyWith((message) => updates(message as QueryJoin)) as QueryJoin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryJoin create() => QueryJoin._();
  QueryJoin createEmptyInstance() => create();
  static $pb.PbList<QueryJoin> createRepeated() => $pb.PbList<QueryJoin>();
  @$core.pragma('dart2js:noInline')
  static QueryJoin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryJoin>(create);
  static QueryJoin _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<QueryJoinCompare> get comparators => $_getList(1);
}

class QueryJoinCompare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryJoinCompare', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignResource', protoName: 'foreignResource')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignField', protoName: 'foreignField')
    ..e<QueryFilterComparator>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comparator', $pb.PbFieldType.OE, defaultOrMaker: QueryFilterComparator.eq, valueOf: QueryFilterComparator.valueOf, enumValues: QueryFilterComparator.values)
    ..hasRequiredFields = false
  ;

  QueryJoinCompare._() : super();
  factory QueryJoinCompare({
    $core.String fieldName,
    $core.String foreignResource,
    $core.String foreignField,
    QueryFilterComparator comparator,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (foreignResource != null) {
      _result.foreignResource = foreignResource;
    }
    if (foreignField != null) {
      _result.foreignField = foreignField;
    }
    if (comparator != null) {
      _result.comparator = comparator;
    }
    return _result;
  }
  factory QueryJoinCompare.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryJoinCompare.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryJoinCompare clone() => QueryJoinCompare()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryJoinCompare copyWith(void Function(QueryJoinCompare) updates) => super.copyWith((message) => updates(message as QueryJoinCompare)) as QueryJoinCompare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryJoinCompare create() => QueryJoinCompare._();
  QueryJoinCompare createEmptyInstance() => create();
  static $pb.PbList<QueryJoinCompare> createRepeated() => $pb.PbList<QueryJoinCompare>();
  @$core.pragma('dart2js:noInline')
  static QueryJoinCompare getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryJoinCompare>(create);
  static QueryJoinCompare _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get foreignResource => $_getSZ(1);
  @$pb.TagNumber(2)
  set foreignResource($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForeignResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearForeignResource() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get foreignField => $_getSZ(2);
  @$pb.TagNumber(3)
  set foreignField($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasForeignField() => $_has(2);
  @$pb.TagNumber(3)
  void clearForeignField() => clearField(3);

  @$pb.TagNumber(4)
  QueryFilterComparator get comparator => $_getN(3);
  @$pb.TagNumber(4)
  set comparator(QueryFilterComparator v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasComparator() => $_has(3);
  @$pb.TagNumber(4)
  void clearComparator() => clearField(4);
}

class QueryProjection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryProjection', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alias')
    ..hasRequiredFields = false
  ;

  QueryProjection._() : super();
  factory QueryProjection({
    $core.String fieldName,
    $core.String alias,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (alias != null) {
      _result.alias = alias;
    }
    return _result;
  }
  factory QueryProjection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryProjection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryProjection clone() => QueryProjection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryProjection copyWith(void Function(QueryProjection) updates) => super.copyWith((message) => updates(message as QueryProjection)) as QueryProjection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryProjection create() => QueryProjection._();
  QueryProjection createEmptyInstance() => create();
  static $pb.PbList<QueryProjection> createRepeated() => $pb.PbList<QueryProjection>();
  @$core.pragma('dart2js:noInline')
  static QueryProjection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryProjection>(create);
  static QueryProjection _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get alias => $_getSZ(1);
  @$pb.TagNumber(2)
  set alias($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAlias() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlias() => clearField(2);
}

class QuerySort extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QuerySort', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descending')
    ..aOM<DBForeignField>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignField', protoName: 'foreignField', subBuilder: DBForeignField.create)
    ..hasRequiredFields = false
  ;

  QuerySort._() : super();
  factory QuerySort({
    $core.String fieldName,
    $core.bool descending,
    DBForeignField foreignField,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (descending != null) {
      _result.descending = descending;
    }
    if (foreignField != null) {
      _result.foreignField = foreignField;
    }
    return _result;
  }
  factory QuerySort.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuerySort.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuerySort clone() => QuerySort()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuerySort copyWith(void Function(QuerySort) updates) => super.copyWith((message) => updates(message as QuerySort)) as QuerySort; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuerySort create() => QuerySort._();
  QuerySort createEmptyInstance() => create();
  static $pb.PbList<QuerySort> createRepeated() => $pb.PbList<QuerySort>();
  @$core.pragma('dart2js:noInline')
  static QuerySort getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuerySort>(create);
  static QuerySort _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get descending => $_getBF(1);
  @$pb.TagNumber(2)
  set descending($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescending() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescending() => clearField(2);

  @$pb.TagNumber(3)
  DBForeignField get foreignField => $_getN(2);
  @$pb.TagNumber(3)
  set foreignField(DBForeignField v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasForeignField() => $_has(2);
  @$pb.TagNumber(3)
  void clearForeignField() => clearField(3);
  @$pb.TagNumber(3)
  DBForeignField ensureForeignField() => $_ensure(2);
}

enum QueryFilter_FilterOneof {
  compare, 
  logical, 
  any, 
  link, 
  subQuery, 
  notSet
}

class QueryFilter extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, QueryFilter_FilterOneof> _QueryFilter_FilterOneofByTag = {
    1 : QueryFilter_FilterOneof.compare,
    2 : QueryFilter_FilterOneof.logical,
    3 : QueryFilter_FilterOneof.any,
    4 : QueryFilter_FilterOneof.link,
    5 : QueryFilter_FilterOneof.subQuery,
    0 : QueryFilter_FilterOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFilter', createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<QueryFilterCompare>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compare', subBuilder: QueryFilterCompare.create)
    ..aOM<QueryFilterLogical>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logical', subBuilder: QueryFilterLogical.create)
    ..aOM<$3.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'any', subBuilder: $3.Any.create)
    ..aOM<QueryFilterLink>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link', subBuilder: QueryFilterLink.create)
    ..aOM<SubQueryFilterMatch>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subQuery', protoName: 'subQuery', subBuilder: SubQueryFilterMatch.create)
    ..hasRequiredFields = false
  ;

  QueryFilter._() : super();
  factory QueryFilter({
    QueryFilterCompare compare,
    QueryFilterLogical logical,
    $3.Any any,
    QueryFilterLink link,
    SubQueryFilterMatch subQuery,
  }) {
    final _result = create();
    if (compare != null) {
      _result.compare = compare;
    }
    if (logical != null) {
      _result.logical = logical;
    }
    if (any != null) {
      _result.any = any;
    }
    if (link != null) {
      _result.link = link;
    }
    if (subQuery != null) {
      _result.subQuery = subQuery;
    }
    return _result;
  }
  factory QueryFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFilter clone() => QueryFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFilter copyWith(void Function(QueryFilter) updates) => super.copyWith((message) => updates(message as QueryFilter)) as QueryFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFilter create() => QueryFilter._();
  QueryFilter createEmptyInstance() => create();
  static $pb.PbList<QueryFilter> createRepeated() => $pb.PbList<QueryFilter>();
  @$core.pragma('dart2js:noInline')
  static QueryFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFilter>(create);
  static QueryFilter _defaultInstance;

  QueryFilter_FilterOneof whichFilterOneof() => _QueryFilter_FilterOneofByTag[$_whichOneof(0)];
  void clearFilterOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  QueryFilterCompare get compare => $_getN(0);
  @$pb.TagNumber(1)
  set compare(QueryFilterCompare v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompare() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompare() => clearField(1);
  @$pb.TagNumber(1)
  QueryFilterCompare ensureCompare() => $_ensure(0);

  @$pb.TagNumber(2)
  QueryFilterLogical get logical => $_getN(1);
  @$pb.TagNumber(2)
  set logical(QueryFilterLogical v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogical() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogical() => clearField(2);
  @$pb.TagNumber(2)
  QueryFilterLogical ensureLogical() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Any get any => $_getN(2);
  @$pb.TagNumber(3)
  set any($3.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAny() => $_has(2);
  @$pb.TagNumber(3)
  void clearAny() => clearField(3);
  @$pb.TagNumber(3)
  $3.Any ensureAny() => $_ensure(2);

  @$pb.TagNumber(4)
  QueryFilterLink get link => $_getN(3);
  @$pb.TagNumber(4)
  set link(QueryFilterLink v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => clearField(4);
  @$pb.TagNumber(4)
  QueryFilterLink ensureLink() => $_ensure(3);

  @$pb.TagNumber(5)
  SubQueryFilterMatch get subQuery => $_getN(4);
  @$pb.TagNumber(5)
  set subQuery(SubQueryFilterMatch v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSubQuery() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubQuery() => clearField(5);
  @$pb.TagNumber(5)
  SubQueryFilterMatch ensureSubQuery() => $_ensure(4);
}

class SubQueryFilterMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubQueryFilterMatch', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..pc<QueryFilter>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filter', $pb.PbFieldType.PM, subBuilder: QueryFilter.create)
    ..hasRequiredFields = false
  ;

  SubQueryFilterMatch._() : super();
  factory SubQueryFilterMatch({
    $core.String fieldName,
    $core.Iterable<QueryFilter> filter,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (filter != null) {
      _result.filter.addAll(filter);
    }
    return _result;
  }
  factory SubQueryFilterMatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubQueryFilterMatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubQueryFilterMatch clone() => SubQueryFilterMatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubQueryFilterMatch copyWith(void Function(SubQueryFilterMatch) updates) => super.copyWith((message) => updates(message as SubQueryFilterMatch)) as SubQueryFilterMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubQueryFilterMatch create() => SubQueryFilterMatch._();
  SubQueryFilterMatch createEmptyInstance() => create();
  static $pb.PbList<SubQueryFilterMatch> createRepeated() => $pb.PbList<SubQueryFilterMatch>();
  @$core.pragma('dart2js:noInline')
  static SubQueryFilterMatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubQueryFilterMatch>(create);
  static SubQueryFilterMatch _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<QueryFilter> get filter => $_getList(1);
}

class QueryFilterLink extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFilterLink', createEmptyInstance: create)
    ..aOM<DBForeignField>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignField', protoName: 'foreignField', subBuilder: DBForeignField.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foreignId', protoName: 'foreignId')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..hasRequiredFields = false
  ;

  QueryFilterLink._() : super();
  factory QueryFilterLink({
    DBForeignField foreignField,
    $core.String foreignId,
    $core.bool link,
  }) {
    final _result = create();
    if (foreignField != null) {
      _result.foreignField = foreignField;
    }
    if (foreignId != null) {
      _result.foreignId = foreignId;
    }
    if (link != null) {
      _result.link = link;
    }
    return _result;
  }
  factory QueryFilterLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFilterLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFilterLink clone() => QueryFilterLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFilterLink copyWith(void Function(QueryFilterLink) updates) => super.copyWith((message) => updates(message as QueryFilterLink)) as QueryFilterLink; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFilterLink create() => QueryFilterLink._();
  QueryFilterLink createEmptyInstance() => create();
  static $pb.PbList<QueryFilterLink> createRepeated() => $pb.PbList<QueryFilterLink>();
  @$core.pragma('dart2js:noInline')
  static QueryFilterLink getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFilterLink>(create);
  static QueryFilterLink _defaultInstance;

  @$pb.TagNumber(1)
  DBForeignField get foreignField => $_getN(0);
  @$pb.TagNumber(1)
  set foreignField(DBForeignField v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasForeignField() => $_has(0);
  @$pb.TagNumber(1)
  void clearForeignField() => clearField(1);
  @$pb.TagNumber(1)
  DBForeignField ensureForeignField() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get foreignId => $_getSZ(1);
  @$pb.TagNumber(2)
  set foreignId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForeignId() => $_has(1);
  @$pb.TagNumber(2)
  void clearForeignId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get link => $_getBF(2);
  @$pb.TagNumber(3)
  set link($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => clearField(3);
}

class QueryFilterCompare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFilterCompare', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..aOM<$2.JsonValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: $2.JsonValue.create)
    ..e<QueryFilterComparator>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comparator', $pb.PbFieldType.OE, defaultOrMaker: QueryFilterComparator.eq, valueOf: QueryFilterComparator.valueOf, enumValues: QueryFilterComparator.values)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isid')
    ..hasRequiredFields = false
  ;

  QueryFilterCompare._() : super();
  factory QueryFilterCompare({
    $core.String fieldName,
    $2.JsonValue value,
    QueryFilterComparator comparator,
    $core.bool isid,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (value != null) {
      _result.value = value;
    }
    if (comparator != null) {
      _result.comparator = comparator;
    }
    if (isid != null) {
      _result.isid = isid;
    }
    return _result;
  }
  factory QueryFilterCompare.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFilterCompare.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFilterCompare clone() => QueryFilterCompare()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFilterCompare copyWith(void Function(QueryFilterCompare) updates) => super.copyWith((message) => updates(message as QueryFilterCompare)) as QueryFilterCompare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFilterCompare create() => QueryFilterCompare._();
  QueryFilterCompare createEmptyInstance() => create();
  static $pb.PbList<QueryFilterCompare> createRepeated() => $pb.PbList<QueryFilterCompare>();
  @$core.pragma('dart2js:noInline')
  static QueryFilterCompare getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFilterCompare>(create);
  static QueryFilterCompare _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $2.JsonValue get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($2.JsonValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  $2.JsonValue ensureValue() => $_ensure(1);

  @$pb.TagNumber(3)
  QueryFilterComparator get comparator => $_getN(2);
  @$pb.TagNumber(3)
  set comparator(QueryFilterComparator v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasComparator() => $_has(2);
  @$pb.TagNumber(3)
  void clearComparator() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isid => $_getBF(3);
  @$pb.TagNumber(4)
  set isid($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsid() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsid() => clearField(4);
}

class QueryFilterLogical extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFilterLogical', createEmptyInstance: create)
    ..pc<QueryFilter>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: QueryFilter.create)
    ..e<QueryFilterLogical_Operator>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operation', $pb.PbFieldType.OE, defaultOrMaker: QueryFilterLogical_Operator.not, valueOf: QueryFilterLogical_Operator.valueOf, enumValues: QueryFilterLogical_Operator.values)
    ..hasRequiredFields = false
  ;

  QueryFilterLogical._() : super();
  factory QueryFilterLogical({
    $core.Iterable<QueryFilter> groups,
    QueryFilterLogical_Operator operation,
  }) {
    final _result = create();
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    if (operation != null) {
      _result.operation = operation;
    }
    return _result;
  }
  factory QueryFilterLogical.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFilterLogical.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFilterLogical clone() => QueryFilterLogical()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFilterLogical copyWith(void Function(QueryFilterLogical) updates) => super.copyWith((message) => updates(message as QueryFilterLogical)) as QueryFilterLogical; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFilterLogical create() => QueryFilterLogical._();
  QueryFilterLogical createEmptyInstance() => create();
  static $pb.PbList<QueryFilterLogical> createRepeated() => $pb.PbList<QueryFilterLogical>();
  @$core.pragma('dart2js:noInline')
  static QueryFilterLogical getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFilterLogical>(create);
  static QueryFilterLogical _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<QueryFilter> get groups => $_getList(0);

  @$pb.TagNumber(2)
  QueryFilterLogical_Operator get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation(QueryFilterLogical_Operator v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);
}

class DBForeignField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DBForeignField', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..hasRequiredFields = false
  ;

  DBForeignField._() : super();
  factory DBForeignField({
    $core.String resource,
    $core.String fieldName,
  }) {
    final _result = create();
    if (resource != null) {
      _result.resource = resource;
    }
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    return _result;
  }
  factory DBForeignField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DBForeignField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DBForeignField clone() => DBForeignField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DBForeignField copyWith(void Function(DBForeignField) updates) => super.copyWith((message) => updates(message as DBForeignField)) as DBForeignField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DBForeignField create() => DBForeignField._();
  DBForeignField createEmptyInstance() => create();
  static $pb.PbList<DBForeignField> createRepeated() => $pb.PbList<DBForeignField>();
  @$core.pragma('dart2js:noInline')
  static DBForeignField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBForeignField>(create);
  static DBForeignField _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldName() => clearField(2);
}

