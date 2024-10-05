///
//  Generated code. Do not modify.
//  source: storage.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;
import 'google/protobuf/any.pb.dart' as $3;
import 'core.pb.dart' as $0;

class StorageSharePayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageSharePayload', createEmptyInstance: create)
    ..pc<StorageShareRow>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toAdd', $pb.PbFieldType.PM, protoName: 'toAdd', subBuilder: StorageShareRow.create)
    ..pc<StorageShareRow>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toRemove', $pb.PbFieldType.PM, protoName: 'toRemove', subBuilder: StorageShareRow.create)
    ..aOM<StoragePath>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path', subBuilder: StoragePath.create)
    ..hasRequiredFields = false
  ;

  StorageSharePayload._() : super();
  factory StorageSharePayload({
    $core.Iterable<StorageShareRow> toAdd,
    $core.Iterable<StorageShareRow> toRemove,
    StoragePath path,
  }) {
    final _result = create();
    if (toAdd != null) {
      _result.toAdd.addAll(toAdd);
    }
    if (toRemove != null) {
      _result.toRemove.addAll(toRemove);
    }
    if (path != null) {
      _result.path = path;
    }
    return _result;
  }
  factory StorageSharePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageSharePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageSharePayload clone() => StorageSharePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageSharePayload copyWith(void Function(StorageSharePayload) updates) => super.copyWith((message) => updates(message as StorageSharePayload)) as StorageSharePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageSharePayload create() => StorageSharePayload._();
  StorageSharePayload createEmptyInstance() => create();
  static $pb.PbList<StorageSharePayload> createRepeated() => $pb.PbList<StorageSharePayload>();
  @$core.pragma('dart2js:noInline')
  static StorageSharePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageSharePayload>(create);
  static StorageSharePayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StorageShareRow> get toAdd => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<StorageShareRow> get toRemove => $_getList(1);

  @$pb.TagNumber(3)
  StoragePath get path => $_getN(2);
  @$pb.TagNumber(3)
  set path(StoragePath v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);
  @$pb.TagNumber(3)
  StoragePath ensurePath() => $_ensure(2);
}

enum StorageShareRow_ShareOneof {
  user, 
  role, 
  public, 
  authenticated, 
  notSet
}

class StorageShareRow extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StorageShareRow_ShareOneof> _StorageShareRow_ShareOneofByTag = {
    1 : StorageShareRow_ShareOneof.user,
    2 : StorageShareRow_ShareOneof.role,
    3 : StorageShareRow_ShareOneof.public,
    4 : StorageShareRow_ShareOneof.authenticated,
    0 : StorageShareRow_ShareOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageShareRow', createEmptyInstance: create)
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

  StorageShareRow._() : super();
  factory StorageShareRow({
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
  factory StorageShareRow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageShareRow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageShareRow clone() => StorageShareRow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageShareRow copyWith(void Function(StorageShareRow) updates) => super.copyWith((message) => updates(message as StorageShareRow)) as StorageShareRow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageShareRow create() => StorageShareRow._();
  StorageShareRow createEmptyInstance() => create();
  static $pb.PbList<StorageShareRow> createRepeated() => $pb.PbList<StorageShareRow>();
  @$core.pragma('dart2js:noInline')
  static StorageShareRow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageShareRow>(create);
  static StorageShareRow _defaultInstance;

  StorageShareRow_ShareOneof whichShareOneof() => _StorageShareRow_ShareOneofByTag[$_whichOneof(0)];
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

class StorageEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageEmpty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  StorageEmpty._() : super();
  factory StorageEmpty() => create();
  factory StorageEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageEmpty clone() => StorageEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageEmpty copyWith(void Function(StorageEmpty) updates) => super.copyWith((message) => updates(message as StorageEmpty)) as StorageEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageEmpty create() => StorageEmpty._();
  StorageEmpty createEmptyInstance() => create();
  static $pb.PbList<StorageEmpty> createRepeated() => $pb.PbList<StorageEmpty>();
  @$core.pragma('dart2js:noInline')
  static StorageEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageEmpty>(create);
  static StorageEmpty _defaultInstance;
}

class StoragePath extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StoragePath', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bucketId', protoName: 'bucketId')
    ..hasRequiredFields = false
  ;

  StoragePath._() : super();
  factory StoragePath({
    $core.String path,
    $core.String bucketId,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (bucketId != null) {
      _result.bucketId = bucketId;
    }
    return _result;
  }
  factory StoragePath.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StoragePath.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StoragePath clone() => StoragePath()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StoragePath copyWith(void Function(StoragePath) updates) => super.copyWith((message) => updates(message as StoragePath)) as StoragePath; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoragePath create() => StoragePath._();
  StoragePath createEmptyInstance() => create();
  static $pb.PbList<StoragePath> createRepeated() => $pb.PbList<StoragePath>();
  @$core.pragma('dart2js:noInline')
  static StoragePath getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StoragePath>(create);
  static StoragePath _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bucketId => $_getSZ(1);
  @$pb.TagNumber(2)
  set bucketId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBucketId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBucketId() => clearField(2);
}

enum StorageCreatePayload_CreateOneof {
  meta, 
  chunk, 
  notSet
}

class StorageCreatePayload extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StorageCreatePayload_CreateOneof> _StorageCreatePayload_CreateOneofByTag = {
    1 : StorageCreatePayload_CreateOneof.meta,
    2 : StorageCreatePayload_CreateOneof.chunk,
    0 : StorageCreatePayload_CreateOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageCreatePayload', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<StorageMeta>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meta', subBuilder: StorageMeta.create)
    ..aOM<StorageFile>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunk', subBuilder: StorageFile.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upsert')
    ..hasRequiredFields = false
  ;

  StorageCreatePayload._() : super();
  factory StorageCreatePayload({
    StorageMeta meta,
    StorageFile chunk,
    $core.bool upsert,
  }) {
    final _result = create();
    if (meta != null) {
      _result.meta = meta;
    }
    if (chunk != null) {
      _result.chunk = chunk;
    }
    if (upsert != null) {
      _result.upsert = upsert;
    }
    return _result;
  }
  factory StorageCreatePayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageCreatePayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageCreatePayload clone() => StorageCreatePayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageCreatePayload copyWith(void Function(StorageCreatePayload) updates) => super.copyWith((message) => updates(message as StorageCreatePayload)) as StorageCreatePayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageCreatePayload create() => StorageCreatePayload._();
  StorageCreatePayload createEmptyInstance() => create();
  static $pb.PbList<StorageCreatePayload> createRepeated() => $pb.PbList<StorageCreatePayload>();
  @$core.pragma('dart2js:noInline')
  static StorageCreatePayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageCreatePayload>(create);
  static StorageCreatePayload _defaultInstance;

  StorageCreatePayload_CreateOneof whichCreateOneof() => _StorageCreatePayload_CreateOneofByTag[$_whichOneof(0)];
  void clearCreateOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  StorageMeta get meta => $_getN(0);
  @$pb.TagNumber(1)
  set meta(StorageMeta v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeta() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeta() => clearField(1);
  @$pb.TagNumber(1)
  StorageMeta ensureMeta() => $_ensure(0);

  @$pb.TagNumber(2)
  StorageFile get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk(StorageFile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);
  @$pb.TagNumber(2)
  StorageFile ensureChunk() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get upsert => $_getBF(2);
  @$pb.TagNumber(3)
  set upsert($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpsert() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpsert() => clearField(3);
}

class StorageMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageMeta', createEmptyInstance: create)
    ..aOM<StoragePath>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path', subBuilder: StoragePath.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $2.Timestamp.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', protoName: 'contentType')
    ..pc<StorageShareRow>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rights', $pb.PbFieldType.PM, subBuilder: StorageShareRow.create)
    ..pc<$3.Any>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custom', $pb.PbFieldType.PM, subBuilder: $3.Any.create)
    ..hasRequiredFields = false
  ;

  StorageMeta._() : super();
  factory StorageMeta({
    StoragePath path,
    $core.int size,
    $2.Timestamp createdAt,
    $2.Timestamp updatedAt,
    $core.String id,
    $core.String contentType,
    $core.Iterable<StorageShareRow> rights,
    $core.Iterable<$3.Any> custom,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (size != null) {
      _result.size = size;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (id != null) {
      _result.id = id;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (rights != null) {
      _result.rights.addAll(rights);
    }
    if (custom != null) {
      _result.custom.addAll(custom);
    }
    return _result;
  }
  factory StorageMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageMeta clone() => StorageMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageMeta copyWith(void Function(StorageMeta) updates) => super.copyWith((message) => updates(message as StorageMeta)) as StorageMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageMeta create() => StorageMeta._();
  StorageMeta createEmptyInstance() => create();
  static $pb.PbList<StorageMeta> createRepeated() => $pb.PbList<StorageMeta>();
  @$core.pragma('dart2js:noInline')
  static StorageMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageMeta>(create);
  static StorageMeta _defaultInstance;

  @$pb.TagNumber(1)
  StoragePath get path => $_getN(0);
  @$pb.TagNumber(1)
  set path(StoragePath v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
  @$pb.TagNumber(1)
  StoragePath ensurePath() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureUpdatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get id => $_getSZ(4);
  @$pb.TagNumber(5)
  set id($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get contentType => $_getSZ(5);
  @$pb.TagNumber(6)
  set contentType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentType() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<StorageShareRow> get rights => $_getList(6);

  @$pb.TagNumber(20)
  $core.List<$3.Any> get custom => $_getList(7);
}

class StorageFile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StorageFile', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buffer', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  StorageFile._() : super();
  factory StorageFile({
    $core.List<$core.int> buffer,
  }) {
    final _result = create();
    if (buffer != null) {
      _result.buffer = buffer;
    }
    return _result;
  }
  factory StorageFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StorageFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StorageFile clone() => StorageFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StorageFile copyWith(void Function(StorageFile) updates) => super.copyWith((message) => updates(message as StorageFile)) as StorageFile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorageFile create() => StorageFile._();
  StorageFile createEmptyInstance() => create();
  static $pb.PbList<StorageFile> createRepeated() => $pb.PbList<StorageFile>();
  @$core.pragma('dart2js:noInline')
  static StorageFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageFile>(create);
  static StorageFile _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get buffer => $_getN(0);
  @$pb.TagNumber(2)
  set buffer($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasBuffer() => $_has(0);
  @$pb.TagNumber(2)
  void clearBuffer() => clearField(2);
}

class ServerStorageConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerStorageConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'directory')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowDotFiles', protoName: 'allowDotFiles')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowExtentions', protoName: 'allowExtentions')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forbidExtentions', protoName: 'forbidExtentions')
    ..aOM<$0.ChannelServiceConfig>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightResource', protoName: 'rightResource')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxPathDepth', $pb.PbFieldType.O3, protoName: 'maxPathDepth')
    ..hasRequiredFields = false
  ;

  ServerStorageConfig._() : super();
  factory ServerStorageConfig({
    $core.String directory,
    $core.bool allowDotFiles,
    $core.Iterable<$core.String> allowExtentions,
    $core.Iterable<$core.String> forbidExtentions,
    $0.ChannelServiceConfig serviceConfig,
    $core.String rightResource,
    $core.int maxPathDepth,
  }) {
    final _result = create();
    if (directory != null) {
      _result.directory = directory;
    }
    if (allowDotFiles != null) {
      _result.allowDotFiles = allowDotFiles;
    }
    if (allowExtentions != null) {
      _result.allowExtentions.addAll(allowExtentions);
    }
    if (forbidExtentions != null) {
      _result.forbidExtentions.addAll(forbidExtentions);
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    if (rightResource != null) {
      _result.rightResource = rightResource;
    }
    if (maxPathDepth != null) {
      _result.maxPathDepth = maxPathDepth;
    }
    return _result;
  }
  factory ServerStorageConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerStorageConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerStorageConfig clone() => ServerStorageConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerStorageConfig copyWith(void Function(ServerStorageConfig) updates) => super.copyWith((message) => updates(message as ServerStorageConfig)) as ServerStorageConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerStorageConfig create() => ServerStorageConfig._();
  ServerStorageConfig createEmptyInstance() => create();
  static $pb.PbList<ServerStorageConfig> createRepeated() => $pb.PbList<ServerStorageConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerStorageConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerStorageConfig>(create);
  static ServerStorageConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get directory => $_getSZ(0);
  @$pb.TagNumber(1)
  set directory($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDirectory() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirectory() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get allowDotFiles => $_getBF(1);
  @$pb.TagNumber(2)
  set allowDotFiles($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAllowDotFiles() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowDotFiles() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowExtentions => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get forbidExtentions => $_getList(3);

  @$pb.TagNumber(5)
  $0.ChannelServiceConfig get serviceConfig => $_getN(4);
  @$pb.TagNumber(5)
  set serviceConfig($0.ChannelServiceConfig v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasServiceConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearServiceConfig() => clearField(5);
  @$pb.TagNumber(5)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get rightResource => $_getSZ(5);
  @$pb.TagNumber(6)
  set rightResource($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRightResource() => $_has(5);
  @$pb.TagNumber(6)
  void clearRightResource() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get maxPathDepth => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxPathDepth($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxPathDepth() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxPathDepth() => clearField(7);
}

