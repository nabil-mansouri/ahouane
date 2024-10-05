///
//  Generated code. Do not modify.
//  source: i18.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core.pb.dart' as $0;
import 'json.pb.dart' as $2;

class I18Config extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'I18Config', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseDirectory', protoName: 'baseDirectory')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultLang', protoName: 'defaultLang')
    ..aOM<$0.ChannelServiceConfig>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..hasRequiredFields = false
  ;

  I18Config._() : super();
  factory I18Config({
    $core.String baseDirectory,
    $core.String defaultLang,
    $0.ChannelServiceConfig serviceConfig,
  }) {
    final _result = create();
    if (baseDirectory != null) {
      _result.baseDirectory = baseDirectory;
    }
    if (defaultLang != null) {
      _result.defaultLang = defaultLang;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    return _result;
  }
  factory I18Config.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory I18Config.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  I18Config clone() => I18Config()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  I18Config copyWith(void Function(I18Config) updates) => super.copyWith((message) => updates(message as I18Config)) as I18Config; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static I18Config create() => I18Config._();
  I18Config createEmptyInstance() => create();
  static $pb.PbList<I18Config> createRepeated() => $pb.PbList<I18Config>();
  @$core.pragma('dart2js:noInline')
  static I18Config getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<I18Config>(create);
  static I18Config _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get baseDirectory => $_getSZ(0);
  @$pb.TagNumber(1)
  set baseDirectory($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseDirectory() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseDirectory() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get defaultLang => $_getSZ(1);
  @$pb.TagNumber(2)
  set defaultLang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDefaultLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefaultLang() => clearField(2);

  @$pb.TagNumber(8)
  $0.ChannelServiceConfig get serviceConfig => $_getN(2);
  @$pb.TagNumber(8)
  set serviceConfig($0.ChannelServiceConfig v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasServiceConfig() => $_has(2);
  @$pb.TagNumber(8)
  void clearServiceConfig() => clearField(8);
  @$pb.TagNumber(8)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(2);
}

class I18KeysPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'I18KeysPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forceLang', protoName: 'forceLang')
    ..hasRequiredFields = false
  ;

  I18KeysPayload._() : super();
  factory I18KeysPayload({
    $core.String forceLang,
  }) {
    final _result = create();
    if (forceLang != null) {
      _result.forceLang = forceLang;
    }
    return _result;
  }
  factory I18KeysPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory I18KeysPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  I18KeysPayload clone() => I18KeysPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  I18KeysPayload copyWith(void Function(I18KeysPayload) updates) => super.copyWith((message) => updates(message as I18KeysPayload)) as I18KeysPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static I18KeysPayload create() => I18KeysPayload._();
  I18KeysPayload createEmptyInstance() => create();
  static $pb.PbList<I18KeysPayload> createRepeated() => $pb.PbList<I18KeysPayload>();
  @$core.pragma('dart2js:noInline')
  static I18KeysPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<I18KeysPayload>(create);
  static I18KeysPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get forceLang => $_getSZ(0);
  @$pb.TagNumber(1)
  set forceLang($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForceLang() => $_has(0);
  @$pb.TagNumber(1)
  void clearForceLang() => clearField(1);
}

class I18Values extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'I18Values', createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'I18Values.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lang')
    ..hasRequiredFields = false
  ;

  I18Values._() : super();
  factory I18Values({
    $core.Map<$core.String, $core.String> values,
    $core.String lang,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    if (lang != null) {
      _result.lang = lang;
    }
    return _result;
  }
  factory I18Values.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory I18Values.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  I18Values clone() => I18Values()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  I18Values copyWith(void Function(I18Values) updates) => super.copyWith((message) => updates(message as I18Values)) as I18Values; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static I18Values create() => I18Values._();
  I18Values createEmptyInstance() => create();
  static $pb.PbList<I18Values> createRepeated() => $pb.PbList<I18Values>();
  @$core.pragma('dart2js:noInline')
  static I18Values getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<I18Values>(create);
  static I18Values _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get values => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get lang => $_getSZ(1);
  @$pb.TagNumber(2)
  set lang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearLang() => clearField(2);
}

class I18Key extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'I18Key', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOM<$2.JsonObjectValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variables', subBuilder: $2.JsonObjectValue.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forceLang', protoName: 'forceLang')
    ..hasRequiredFields = false
  ;

  I18Key._() : super();
  factory I18Key({
    $core.String key,
    $2.JsonObjectValue variables,
    $core.String forceLang,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (variables != null) {
      _result.variables = variables;
    }
    if (forceLang != null) {
      _result.forceLang = forceLang;
    }
    return _result;
  }
  factory I18Key.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory I18Key.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  I18Key clone() => I18Key()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  I18Key copyWith(void Function(I18Key) updates) => super.copyWith((message) => updates(message as I18Key)) as I18Key; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static I18Key create() => I18Key._();
  I18Key createEmptyInstance() => create();
  static $pb.PbList<I18Key> createRepeated() => $pb.PbList<I18Key>();
  @$core.pragma('dart2js:noInline')
  static I18Key getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<I18Key>(create);
  static I18Key _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $2.JsonObjectValue get variables => $_getN(1);
  @$pb.TagNumber(2)
  set variables($2.JsonObjectValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVariables() => $_has(1);
  @$pb.TagNumber(2)
  void clearVariables() => clearField(2);
  @$pb.TagNumber(2)
  $2.JsonObjectValue ensureVariables() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get forceLang => $_getSZ(2);
  @$pb.TagNumber(3)
  set forceLang($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasForceLang() => $_has(2);
  @$pb.TagNumber(3)
  void clearForceLang() => clearField(3);
}

class I18Value extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'I18Value', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lang')
    ..hasRequiredFields = false
  ;

  I18Value._() : super();
  factory I18Value({
    $core.String value,
    $core.String lang,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (lang != null) {
      _result.lang = lang;
    }
    return _result;
  }
  factory I18Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory I18Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  I18Value clone() => I18Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  I18Value copyWith(void Function(I18Value) updates) => super.copyWith((message) => updates(message as I18Value)) as I18Value; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static I18Value create() => I18Value._();
  I18Value createEmptyInstance() => create();
  static $pb.PbList<I18Value> createRepeated() => $pb.PbList<I18Value>();
  @$core.pragma('dart2js:noInline')
  static I18Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<I18Value>(create);
  static I18Value _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lang => $_getSZ(1);
  @$pb.TagNumber(2)
  set lang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearLang() => clearField(2);
}

