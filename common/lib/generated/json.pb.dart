///
//  Generated code. Do not modify.
//  source: json.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $0;

enum JsonValue_JsonOneof {
  intValue, 
  doubleValue, 
  stringValue, 
  boolValue, 
  nullValue, 
  object, 
  array, 
  custom, 
  notSet
}

class JsonValue extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, JsonValue_JsonOneof> _JsonValue_JsonOneofByTag = {
    1 : JsonValue_JsonOneof.intValue,
    2 : JsonValue_JsonOneof.doubleValue,
    3 : JsonValue_JsonOneof.stringValue,
    4 : JsonValue_JsonOneof.boolValue,
    5 : JsonValue_JsonOneof.nullValue,
    6 : JsonValue_JsonOneof.object,
    7 : JsonValue_JsonOneof.array,
    8 : JsonValue_JsonOneof.custom,
    0 : JsonValue_JsonOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JsonValue', createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intValue', protoName: 'intValue')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doubleValue', $pb.PbFieldType.OD, protoName: 'doubleValue')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boolValue', protoName: 'boolValue')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nullValue', protoName: 'nullValue')
    ..aOM<JsonObjectValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'object', subBuilder: JsonObjectValue.create)
    ..aOM<JsonArrayValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'array', subBuilder: JsonArrayValue.create)
    ..aOM<$0.Any>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custom', subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  JsonValue._() : super();
  factory JsonValue({
    $fixnum.Int64 intValue,
    $core.double doubleValue,
    $core.String stringValue,
    $core.bool boolValue,
    $core.bool nullValue,
    JsonObjectValue object,
    JsonArrayValue array,
    $0.Any custom,
  }) {
    final _result = create();
    if (intValue != null) {
      _result.intValue = intValue;
    }
    if (doubleValue != null) {
      _result.doubleValue = doubleValue;
    }
    if (stringValue != null) {
      _result.stringValue = stringValue;
    }
    if (boolValue != null) {
      _result.boolValue = boolValue;
    }
    if (nullValue != null) {
      _result.nullValue = nullValue;
    }
    if (object != null) {
      _result.object = object;
    }
    if (array != null) {
      _result.array = array;
    }
    if (custom != null) {
      _result.custom = custom;
    }
    return _result;
  }
  factory JsonValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonValue clone() => JsonValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonValue copyWith(void Function(JsonValue) updates) => super.copyWith((message) => updates(message as JsonValue)) as JsonValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JsonValue create() => JsonValue._();
  JsonValue createEmptyInstance() => create();
  static $pb.PbList<JsonValue> createRepeated() => $pb.PbList<JsonValue>();
  @$core.pragma('dart2js:noInline')
  static JsonValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonValue>(create);
  static JsonValue _defaultInstance;

  JsonValue_JsonOneof whichJsonOneof() => _JsonValue_JsonOneofByTag[$_whichOneof(0)];
  void clearJsonOneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get intValue => $_getI64(0);
  @$pb.TagNumber(1)
  set intValue($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIntValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get doubleValue => $_getN(1);
  @$pb.TagNumber(2)
  set doubleValue($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDoubleValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDoubleValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get stringValue => $_getSZ(2);
  @$pb.TagNumber(3)
  set stringValue($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStringValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearStringValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(3);
  @$pb.TagNumber(4)
  set boolValue($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoolValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get nullValue => $_getBF(4);
  @$pb.TagNumber(5)
  set nullValue($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNullValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearNullValue() => clearField(5);

  @$pb.TagNumber(6)
  JsonObjectValue get object => $_getN(5);
  @$pb.TagNumber(6)
  set object(JsonObjectValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasObject() => $_has(5);
  @$pb.TagNumber(6)
  void clearObject() => clearField(6);
  @$pb.TagNumber(6)
  JsonObjectValue ensureObject() => $_ensure(5);

  @$pb.TagNumber(7)
  JsonArrayValue get array => $_getN(6);
  @$pb.TagNumber(7)
  set array(JsonArrayValue v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArray() => $_has(6);
  @$pb.TagNumber(7)
  void clearArray() => clearField(7);
  @$pb.TagNumber(7)
  JsonArrayValue ensureArray() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Any get custom => $_getN(7);
  @$pb.TagNumber(8)
  set custom($0.Any v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCustom() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustom() => clearField(8);
  @$pb.TagNumber(8)
  $0.Any ensureCustom() => $_ensure(7);
}

class JsonObjectValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JsonObjectValue', createEmptyInstance: create)
    ..m<$core.String, JsonValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', entryClassName: 'JsonObjectValue.ValueEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: JsonValue.create)
    ..hasRequiredFields = false
  ;

  JsonObjectValue._() : super();
  factory JsonObjectValue({
    $core.Map<$core.String, JsonValue> value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory JsonObjectValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonObjectValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonObjectValue clone() => JsonObjectValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonObjectValue copyWith(void Function(JsonObjectValue) updates) => super.copyWith((message) => updates(message as JsonObjectValue)) as JsonObjectValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JsonObjectValue create() => JsonObjectValue._();
  JsonObjectValue createEmptyInstance() => create();
  static $pb.PbList<JsonObjectValue> createRepeated() => $pb.PbList<JsonObjectValue>();
  @$core.pragma('dart2js:noInline')
  static JsonObjectValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonObjectValue>(create);
  static JsonObjectValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, JsonValue> get value => $_getMap(0);
}

class JsonArrayValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JsonArrayValue', createEmptyInstance: create)
    ..pc<JsonValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.PM, subBuilder: JsonValue.create)
    ..hasRequiredFields = false
  ;

  JsonArrayValue._() : super();
  factory JsonArrayValue({
    $core.Iterable<JsonValue> value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory JsonArrayValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JsonArrayValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JsonArrayValue clone() => JsonArrayValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JsonArrayValue copyWith(void Function(JsonArrayValue) updates) => super.copyWith((message) => updates(message as JsonArrayValue)) as JsonArrayValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JsonArrayValue create() => JsonArrayValue._();
  JsonArrayValue createEmptyInstance() => create();
  static $pb.PbList<JsonArrayValue> createRepeated() => $pb.PbList<JsonArrayValue>();
  @$core.pragma('dart2js:noInline')
  static JsonArrayValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JsonArrayValue>(create);
  static JsonArrayValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<JsonValue> get value => $_getList(0);
}

