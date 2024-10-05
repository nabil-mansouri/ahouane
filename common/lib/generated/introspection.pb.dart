///
//  Generated code. Do not modify.
//  source: introspection.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:ahouane_common/generated/validate.pb.dart' as $1;

class IntrospectionObjects extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IntrospectionObjects', createEmptyInstance: create)
    ..m<$core.String, IntrospectionObject>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objects', entryClassName: 'IntrospectionObjects.ObjectsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: IntrospectionObject.create)
    ..hasRequiredFields = false
  ;

  IntrospectionObjects._() : super();
  factory IntrospectionObjects({
    $core.Map<$core.String, IntrospectionObject> objects,
  }) {
    final _result = create();
    if (objects != null) {
      _result.objects.addAll(objects);
    }
    return _result;
  }
  factory IntrospectionObjects.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IntrospectionObjects.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IntrospectionObjects clone() => IntrospectionObjects()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IntrospectionObjects copyWith(void Function(IntrospectionObjects) updates) => super.copyWith((message) => updates(message as IntrospectionObjects)) as IntrospectionObjects; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntrospectionObjects create() => IntrospectionObjects._();
  IntrospectionObjects createEmptyInstance() => create();
  static $pb.PbList<IntrospectionObjects> createRepeated() => $pb.PbList<IntrospectionObjects>();
  @$core.pragma('dart2js:noInline')
  static IntrospectionObjects getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IntrospectionObjects>(create);
  static IntrospectionObjects _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, IntrospectionObject> get objects => $_getMap(0);
}

class IntrospectionObject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IntrospectionObject', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qualifiedName', protoName: 'qualifiedName')
    ..pc<IntrospectionField>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: IntrospectionField.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName', protoName: 'displayName')
    ..hasRequiredFields = false
  ;

  IntrospectionObject._() : super();
  factory IntrospectionObject({
    $core.String qualifiedName,
    $core.Iterable<IntrospectionField> fields,
    $core.String displayName,
  }) {
    final _result = create();
    if (qualifiedName != null) {
      _result.qualifiedName = qualifiedName;
    }
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    return _result;
  }
  factory IntrospectionObject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IntrospectionObject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IntrospectionObject clone() => IntrospectionObject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IntrospectionObject copyWith(void Function(IntrospectionObject) updates) => super.copyWith((message) => updates(message as IntrospectionObject)) as IntrospectionObject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntrospectionObject create() => IntrospectionObject._();
  IntrospectionObject createEmptyInstance() => create();
  static $pb.PbList<IntrospectionObject> createRepeated() => $pb.PbList<IntrospectionObject>();
  @$core.pragma('dart2js:noInline')
  static IntrospectionObject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IntrospectionObject>(create);
  static IntrospectionObject _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualifiedName => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualifiedName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQualifiedName() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualifiedName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<IntrospectionField> get fields => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);
}

class IntrospectionField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IntrospectionField', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldName', protoName: 'fieldName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldTypeName', protoName: 'fieldTypeName')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldTypeInt', $pb.PbFieldType.O3, protoName: 'fieldTypeInt')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isEnum', protoName: 'isEnum')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isMessage', protoName: 'isMessage')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRepeated', protoName: 'isRepeated')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isMap', protoName: 'isMap')
    ..pPS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enumValues', protoName: 'enumValues')
    ..aOM<IntrospectionObject>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'embedType', protoName: 'embedType', subBuilder: IntrospectionObject.create)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagNumber', $pb.PbFieldType.O3, protoName: 'tagNumber')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldKeyTypeInt', $pb.PbFieldType.O3, protoName: 'fieldKeyTypeInt')
    ..aOM<$1.FieldRules>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validationRules', protoName: 'validationRules', subBuilder: $1.FieldRules.create)
    ..hasRequiredFields = false
  ;

  IntrospectionField._() : super();
  factory IntrospectionField({
    $core.String fieldName,
    $core.String fieldTypeName,
    $core.int fieldTypeInt,
    $core.bool isEnum,
    $core.bool isMessage,
    $core.bool isRepeated,
    $core.bool isMap,
    $core.Iterable<$core.String> enumValues,
    IntrospectionObject embedType,
    $core.int tagNumber,
    $core.int fieldKeyTypeInt,
    $1.FieldRules validationRules,
  }) {
    final _result = create();
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (fieldTypeName != null) {
      _result.fieldTypeName = fieldTypeName;
    }
    if (fieldTypeInt != null) {
      _result.fieldTypeInt = fieldTypeInt;
    }
    if (isEnum != null) {
      _result.isEnum = isEnum;
    }
    if (isMessage != null) {
      _result.isMessage = isMessage;
    }
    if (isRepeated != null) {
      _result.isRepeated = isRepeated;
    }
    if (isMap != null) {
      _result.isMap = isMap;
    }
    if (enumValues != null) {
      _result.enumValues.addAll(enumValues);
    }
    if (embedType != null) {
      _result.embedType = embedType;
    }
    if (tagNumber != null) {
      _result.tagNumber = tagNumber;
    }
    if (fieldKeyTypeInt != null) {
      _result.fieldKeyTypeInt = fieldKeyTypeInt;
    }
    if (validationRules != null) {
      _result.validationRules = validationRules;
    }
    return _result;
  }
  factory IntrospectionField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IntrospectionField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IntrospectionField clone() => IntrospectionField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IntrospectionField copyWith(void Function(IntrospectionField) updates) => super.copyWith((message) => updates(message as IntrospectionField)) as IntrospectionField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntrospectionField create() => IntrospectionField._();
  IntrospectionField createEmptyInstance() => create();
  static $pb.PbList<IntrospectionField> createRepeated() => $pb.PbList<IntrospectionField>();
  @$core.pragma('dart2js:noInline')
  static IntrospectionField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IntrospectionField>(create);
  static IntrospectionField _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fieldName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fieldName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldTypeName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldTypeName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldTypeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldTypeName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get fieldTypeInt => $_getIZ(2);
  @$pb.TagNumber(3)
  set fieldTypeInt($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldTypeInt() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldTypeInt() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isEnum => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnum($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnum() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnum() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isMessage => $_getBF(4);
  @$pb.TagNumber(5)
  set isMessage($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsMessage() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isRepeated => $_getBF(5);
  @$pb.TagNumber(6)
  set isRepeated($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsRepeated() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsRepeated() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isMap => $_getBF(6);
  @$pb.TagNumber(7)
  set isMap($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsMap() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsMap() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get enumValues => $_getList(7);

  @$pb.TagNumber(10)
  IntrospectionObject get embedType => $_getN(8);
  @$pb.TagNumber(10)
  set embedType(IntrospectionObject v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEmbedType() => $_has(8);
  @$pb.TagNumber(10)
  void clearEmbedType() => clearField(10);
  @$pb.TagNumber(10)
  IntrospectionObject ensureEmbedType() => $_ensure(8);

  @$pb.TagNumber(11)
  $core.int get tagNumber => $_getIZ(9);
  @$pb.TagNumber(11)
  set tagNumber($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasTagNumber() => $_has(9);
  @$pb.TagNumber(11)
  void clearTagNumber() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get fieldKeyTypeInt => $_getIZ(10);
  @$pb.TagNumber(12)
  set fieldKeyTypeInt($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasFieldKeyTypeInt() => $_has(10);
  @$pb.TagNumber(12)
  void clearFieldKeyTypeInt() => clearField(12);

  @$pb.TagNumber(13)
  $1.FieldRules get validationRules => $_getN(11);
  @$pb.TagNumber(13)
  set validationRules($1.FieldRules v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasValidationRules() => $_has(11);
  @$pb.TagNumber(13)
  void clearValidationRules() => clearField(13);
  @$pb.TagNumber(13)
  $1.FieldRules ensureValidationRules() => $_ensure(11);
}

