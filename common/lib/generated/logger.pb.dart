///
//  Generated code. Do not modify.
//  source: logger.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

import 'logger.pbenum.dart';

export 'logger.pbenum.dart';

class LogMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogMessage', createEmptyInstance: create)
    ..e<LogMessage_Level>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level', $pb.PbFieldType.QE, defaultOrMaker: LogMessage_Level.Verbose, valueOf: LogMessage_Level.valueOf, enumValues: LogMessage_Level.values)
    ..aQM<$1.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'when', subBuilder: $1.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'who')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'where')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'what')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceid')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stacktrace')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details')
  ;

  LogMessage._() : super();
  factory LogMessage({
    LogMessage_Level level,
    $1.Timestamp when,
    $core.String who,
    $core.String where,
    $core.String what,
    $core.String description,
    $core.String serviceid,
    $core.String stacktrace,
    $core.String error,
    $core.String details,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (when != null) {
      _result.when = when;
    }
    if (who != null) {
      _result.who = who;
    }
    if (where != null) {
      _result.where = where;
    }
    if (what != null) {
      _result.what = what;
    }
    if (description != null) {
      _result.description = description;
    }
    if (serviceid != null) {
      _result.serviceid = serviceid;
    }
    if (stacktrace != null) {
      _result.stacktrace = stacktrace;
    }
    if (error != null) {
      _result.error = error;
    }
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory LogMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogMessage clone() => LogMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogMessage copyWith(void Function(LogMessage) updates) => super.copyWith((message) => updates(message as LogMessage)) as LogMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogMessage create() => LogMessage._();
  LogMessage createEmptyInstance() => create();
  static $pb.PbList<LogMessage> createRepeated() => $pb.PbList<LogMessage>();
  @$core.pragma('dart2js:noInline')
  static LogMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogMessage>(create);
  static LogMessage _defaultInstance;

  @$pb.TagNumber(1)
  LogMessage_Level get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(LogMessage_Level v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get when => $_getN(1);
  @$pb.TagNumber(2)
  set when($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasWhen() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhen() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureWhen() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get who => $_getSZ(2);
  @$pb.TagNumber(3)
  set who($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWho() => $_has(2);
  @$pb.TagNumber(3)
  void clearWho() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get where => $_getSZ(3);
  @$pb.TagNumber(4)
  set where($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWhere() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhere() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get what => $_getSZ(4);
  @$pb.TagNumber(5)
  set what($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWhat() => $_has(4);
  @$pb.TagNumber(5)
  void clearWhat() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get serviceid => $_getSZ(6);
  @$pb.TagNumber(7)
  set serviceid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasServiceid() => $_has(6);
  @$pb.TagNumber(7)
  void clearServiceid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get stacktrace => $_getSZ(7);
  @$pb.TagNumber(8)
  set stacktrace($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStacktrace() => $_has(7);
  @$pb.TagNumber(8)
  void clearStacktrace() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get error => $_getSZ(8);
  @$pb.TagNumber(9)
  set error($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get details => $_getSZ(9);
  @$pb.TagNumber(10)
  set details($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDetails() => $_has(9);
  @$pb.TagNumber(10)
  void clearDetails() => clearField(10);
}

class AHLogMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AHLogMessage', createEmptyInstance: create)
    ..e<LogMessage_Level>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level', $pb.PbFieldType.QE, defaultOrMaker: LogMessage_Level.Verbose, valueOf: LogMessage_Level.valueOf, enumValues: LogMessage_Level.values)
    ..aQM<$1.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'when', subBuilder: $1.Timestamp.create)
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..m<$core.String, $core.String>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variables', entryClassName: 'AHLogMessage.VariablesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stacktrace')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
  ;

  AHLogMessage._() : super();
  factory AHLogMessage({
    LogMessage_Level level,
    $1.Timestamp when,
    $core.String id,
    $core.Map<$core.String, $core.String> variables,
    $core.String stacktrace,
    $core.String error,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (when != null) {
      _result.when = when;
    }
    if (id != null) {
      _result.id = id;
    }
    if (variables != null) {
      _result.variables.addAll(variables);
    }
    if (stacktrace != null) {
      _result.stacktrace = stacktrace;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory AHLogMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AHLogMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AHLogMessage clone() => AHLogMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AHLogMessage copyWith(void Function(AHLogMessage) updates) => super.copyWith((message) => updates(message as AHLogMessage)) as AHLogMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AHLogMessage create() => AHLogMessage._();
  AHLogMessage createEmptyInstance() => create();
  static $pb.PbList<AHLogMessage> createRepeated() => $pb.PbList<AHLogMessage>();
  @$core.pragma('dart2js:noInline')
  static AHLogMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AHLogMessage>(create);
  static AHLogMessage _defaultInstance;

  @$pb.TagNumber(1)
  LogMessage_Level get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(LogMessage_Level v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get when => $_getN(1);
  @$pb.TagNumber(2)
  set when($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasWhen() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhen() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureWhen() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get variables => $_getMap(3);

  @$pb.TagNumber(5)
  $core.String get stacktrace => $_getSZ(4);
  @$pb.TagNumber(5)
  set stacktrace($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStacktrace() => $_has(4);
  @$pb.TagNumber(5)
  void clearStacktrace() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => clearField(6);
}

class ConsoleLogWritterConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConsoleLogWritterConfig', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDefault', protoName: 'isDefault')
    ..e<LogMessage_Level>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minLevel', $pb.PbFieldType.OE, protoName: 'minLevel', defaultOrMaker: LogMessage_Level.Debug, valueOf: LogMessage_Level.valueOf, enumValues: LogMessage_Level.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'methodCount', $pb.PbFieldType.O3, protoName: 'methodCount', defaultOrMaker: 1)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMethodCount', $pb.PbFieldType.O3, protoName: 'errorMethodCount', defaultOrMaker: 8)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lineLength', $pb.PbFieldType.O3, protoName: 'lineLength', defaultOrMaker: 120)
    ..a<$core.bool>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colors', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'printEmojis', $pb.PbFieldType.OB, protoName: 'printEmojis', defaultOrMaker: true)
    ..a<$core.bool>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'printTime', $pb.PbFieldType.OB, protoName: 'printTime', defaultOrMaker: true)
    ..a<$core.bool>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prettyError', $pb.PbFieldType.OB, protoName: 'prettyError', defaultOrMaker: true)
    ..a<$core.bool>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prettyWarn', $pb.PbFieldType.OB, protoName: 'prettyWarn', defaultOrMaker: true)
    ..hasRequiredFields = false
  ;

  ConsoleLogWritterConfig._() : super();
  factory ConsoleLogWritterConfig({
    $core.bool isDefault,
    LogMessage_Level minLevel,
    $core.int methodCount,
    $core.int errorMethodCount,
    $core.int lineLength,
    $core.bool colors,
    $core.bool printEmojis,
    $core.bool printTime,
    $core.bool prettyError,
    $core.bool prettyWarn,
  }) {
    final _result = create();
    if (isDefault != null) {
      _result.isDefault = isDefault;
    }
    if (minLevel != null) {
      _result.minLevel = minLevel;
    }
    if (methodCount != null) {
      _result.methodCount = methodCount;
    }
    if (errorMethodCount != null) {
      _result.errorMethodCount = errorMethodCount;
    }
    if (lineLength != null) {
      _result.lineLength = lineLength;
    }
    if (colors != null) {
      _result.colors = colors;
    }
    if (printEmojis != null) {
      _result.printEmojis = printEmojis;
    }
    if (printTime != null) {
      _result.printTime = printTime;
    }
    if (prettyError != null) {
      _result.prettyError = prettyError;
    }
    if (prettyWarn != null) {
      _result.prettyWarn = prettyWarn;
    }
    return _result;
  }
  factory ConsoleLogWritterConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConsoleLogWritterConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConsoleLogWritterConfig clone() => ConsoleLogWritterConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConsoleLogWritterConfig copyWith(void Function(ConsoleLogWritterConfig) updates) => super.copyWith((message) => updates(message as ConsoleLogWritterConfig)) as ConsoleLogWritterConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConsoleLogWritterConfig create() => ConsoleLogWritterConfig._();
  ConsoleLogWritterConfig createEmptyInstance() => create();
  static $pb.PbList<ConsoleLogWritterConfig> createRepeated() => $pb.PbList<ConsoleLogWritterConfig>();
  @$core.pragma('dart2js:noInline')
  static ConsoleLogWritterConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConsoleLogWritterConfig>(create);
  static ConsoleLogWritterConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isDefault => $_getBF(0);
  @$pb.TagNumber(1)
  set isDefault($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsDefault() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsDefault() => clearField(1);

  @$pb.TagNumber(2)
  LogMessage_Level get minLevel => $_getN(1);
  @$pb.TagNumber(2)
  set minLevel(LogMessage_Level v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get methodCount => $_getI(2, 1);
  @$pb.TagNumber(3)
  set methodCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMethodCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMethodCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get errorMethodCount => $_getI(3, 8);
  @$pb.TagNumber(4)
  set errorMethodCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasErrorMethodCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMethodCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get lineLength => $_getI(4, 120);
  @$pb.TagNumber(5)
  set lineLength($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLineLength() => $_has(4);
  @$pb.TagNumber(5)
  void clearLineLength() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get colors => $_getB(5, true);
  @$pb.TagNumber(6)
  set colors($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasColors() => $_has(5);
  @$pb.TagNumber(6)
  void clearColors() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get printEmojis => $_getB(6, true);
  @$pb.TagNumber(7)
  set printEmojis($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPrintEmojis() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrintEmojis() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get printTime => $_getB(7, true);
  @$pb.TagNumber(8)
  set printTime($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPrintTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrintTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get prettyError => $_getB(8, true);
  @$pb.TagNumber(9)
  set prettyError($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrettyError() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrettyError() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get prettyWarn => $_getB(9, true);
  @$pb.TagNumber(10)
  set prettyWarn($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPrettyWarn() => $_has(9);
  @$pb.TagNumber(10)
  void clearPrettyWarn() => clearField(10);
}

class AHLogFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AHLogFilter', createEmptyInstance: create)
    ..e<LogMessage_Level>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minLevel', $pb.PbFieldType.OE, protoName: 'minLevel', defaultOrMaker: LogMessage_Level.Debug, valueOf: LogMessage_Level.valueOf, enumValues: LogMessage_Level.values)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contains')
    ..hasRequiredFields = false
  ;

  AHLogFilter._() : super();
  factory AHLogFilter({
    LogMessage_Level minLevel,
    $core.Iterable<$core.String> contains,
  }) {
    final _result = create();
    if (minLevel != null) {
      _result.minLevel = minLevel;
    }
    if (contains != null) {
      _result.contains.addAll(contains);
    }
    return _result;
  }
  factory AHLogFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AHLogFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AHLogFilter clone() => AHLogFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AHLogFilter copyWith(void Function(AHLogFilter) updates) => super.copyWith((message) => updates(message as AHLogFilter)) as AHLogFilter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AHLogFilter create() => AHLogFilter._();
  AHLogFilter createEmptyInstance() => create();
  static $pb.PbList<AHLogFilter> createRepeated() => $pb.PbList<AHLogFilter>();
  @$core.pragma('dart2js:noInline')
  static AHLogFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AHLogFilter>(create);
  static AHLogFilter _defaultInstance;

  @$pb.TagNumber(1)
  LogMessage_Level get minLevel => $_getN(0);
  @$pb.TagNumber(1)
  set minLevel(LogMessage_Level v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get contains => $_getList(1);
}

class LogResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogResponse', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LogResponse._() : super();
  factory LogResponse() => create();
  factory LogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogResponse clone() => LogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogResponse copyWith(void Function(LogResponse) updates) => super.copyWith((message) => updates(message as LogResponse)) as LogResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogResponse create() => LogResponse._();
  LogResponse createEmptyInstance() => create();
  static $pb.PbList<LogResponse> createRepeated() => $pb.PbList<LogResponse>();
  @$core.pragma('dart2js:noInline')
  static LogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogResponse>(create);
  static LogResponse _defaultInstance;
}

