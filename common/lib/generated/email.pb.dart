///
//  Generated code. Do not modify.
//  source: email.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core.pb.dart' as $0;
import 'json.pb.dart' as $2;

class EmailConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'login')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secure')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromName', protoName: 'fromName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromAddress', protoName: 'fromAddress')
    ..aOM<$0.ChannelServiceConfig>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableLog', protoName: 'enableLog')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientDomain', protoName: 'clientDomain')
    ..hasRequiredFields = false
  ;

  EmailConfig._() : super();
  factory EmailConfig({
    $core.String host,
    $core.int port,
    $core.String login,
    $core.String password,
    $core.bool secure,
    $core.String fromName,
    $core.String fromAddress,
    $0.ChannelServiceConfig serviceConfig,
    $core.bool enableLog,
    $core.String clientDomain,
  }) {
    final _result = create();
    if (host != null) {
      _result.host = host;
    }
    if (port != null) {
      _result.port = port;
    }
    if (login != null) {
      _result.login = login;
    }
    if (password != null) {
      _result.password = password;
    }
    if (secure != null) {
      _result.secure = secure;
    }
    if (fromName != null) {
      _result.fromName = fromName;
    }
    if (fromAddress != null) {
      _result.fromAddress = fromAddress;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    if (enableLog != null) {
      _result.enableLog = enableLog;
    }
    if (clientDomain != null) {
      _result.clientDomain = clientDomain;
    }
    return _result;
  }
  factory EmailConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailConfig clone() => EmailConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailConfig copyWith(void Function(EmailConfig) updates) => super.copyWith((message) => updates(message as EmailConfig)) as EmailConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailConfig create() => EmailConfig._();
  EmailConfig createEmptyInstance() => create();
  static $pb.PbList<EmailConfig> createRepeated() => $pb.PbList<EmailConfig>();
  @$core.pragma('dart2js:noInline')
  static EmailConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailConfig>(create);
  static EmailConfig _defaultInstance;

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
  $core.String get login => $_getSZ(2);
  @$pb.TagNumber(3)
  set login($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogin() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get secure => $_getBF(4);
  @$pb.TagNumber(5)
  set secure($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSecure() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecure() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fromName => $_getSZ(5);
  @$pb.TagNumber(6)
  set fromName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFromName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFromName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fromAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set fromAddress($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFromAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearFromAddress() => clearField(7);

  @$pb.TagNumber(8)
  $0.ChannelServiceConfig get serviceConfig => $_getN(7);
  @$pb.TagNumber(8)
  set serviceConfig($0.ChannelServiceConfig v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasServiceConfig() => $_has(7);
  @$pb.TagNumber(8)
  void clearServiceConfig() => clearField(8);
  @$pb.TagNumber(8)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get enableLog => $_getBF(8);
  @$pb.TagNumber(9)
  set enableLog($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEnableLog() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnableLog() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get clientDomain => $_getSZ(9);
  @$pb.TagNumber(10)
  set clientDomain($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasClientDomain() => $_has(9);
  @$pb.TagNumber(10)
  void clearClientDomain() => clearField(10);
}

class EmailStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailStatus', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details')
    ..hasRequiredFields = false
  ;

  EmailStatus._() : super();
  factory EmailStatus({
    $core.bool success,
    $core.String details,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory EmailStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailStatus clone() => EmailStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailStatus copyWith(void Function(EmailStatus) updates) => super.copyWith((message) => updates(message as EmailStatus)) as EmailStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailStatus create() => EmailStatus._();
  EmailStatus createEmptyInstance() => create();
  static $pb.PbList<EmailStatus> createRepeated() => $pb.PbList<EmailStatus>();
  @$core.pragma('dart2js:noInline')
  static EmailStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailStatus>(create);
  static EmailStatus _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get details => $_getSZ(1);
  @$pb.TagNumber(2)
  set details($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => clearField(2);
}

class EmailPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailPayload', createEmptyInstance: create)
    ..pc<EmailAddress>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to', $pb.PbFieldType.PM, subBuilder: EmailAddress.create)
    ..pc<EmailAddress>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cc', $pb.PbFieldType.PM, subBuilder: EmailAddress.create)
    ..pc<EmailAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cci', $pb.PbFieldType.PM, subBuilder: EmailAddress.create)
    ..aOM<EmailAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from', subBuilder: EmailAddress.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawSubject', protoName: 'rawSubject')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawText', protoName: 'rawText')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawHtml', protoName: 'rawHtml')
    ..pc<EmailAttachment>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: EmailAttachment.create)
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dynamic')
    ..aOM<$2.JsonObjectValue>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'variables', subBuilder: $2.JsonObjectValue.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'i18Subject', protoName: 'i18Subject')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'i18Text', protoName: 'i18Text')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'i18Html', protoName: 'i18Html')
    ..hasRequiredFields = false
  ;

  EmailPayload._() : super();
  factory EmailPayload({
    $core.Iterable<EmailAddress> to,
    $core.Iterable<EmailAddress> cc,
    $core.Iterable<EmailAddress> cci,
    EmailAddress from,
    $core.String rawSubject,
    $core.String rawText,
    $core.String rawHtml,
    $core.Iterable<EmailAttachment> attachments,
    $core.bool dynamic,
    $2.JsonObjectValue variables,
    $core.String i18Subject,
    $core.String i18Text,
    $core.String i18Html,
  }) {
    final _result = create();
    if (to != null) {
      _result.to.addAll(to);
    }
    if (cc != null) {
      _result.cc.addAll(cc);
    }
    if (cci != null) {
      _result.cci.addAll(cci);
    }
    if (from != null) {
      _result.from = from;
    }
    if (rawSubject != null) {
      _result.rawSubject = rawSubject;
    }
    if (rawText != null) {
      _result.rawText = rawText;
    }
    if (rawHtml != null) {
      _result.rawHtml = rawHtml;
    }
    if (attachments != null) {
      _result.attachments.addAll(attachments);
    }
    if (dynamic != null) {
      _result.dynamic = dynamic;
    }
    if (variables != null) {
      _result.variables = variables;
    }
    if (i18Subject != null) {
      _result.i18Subject = i18Subject;
    }
    if (i18Text != null) {
      _result.i18Text = i18Text;
    }
    if (i18Html != null) {
      _result.i18Html = i18Html;
    }
    return _result;
  }
  factory EmailPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailPayload clone() => EmailPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailPayload copyWith(void Function(EmailPayload) updates) => super.copyWith((message) => updates(message as EmailPayload)) as EmailPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailPayload create() => EmailPayload._();
  EmailPayload createEmptyInstance() => create();
  static $pb.PbList<EmailPayload> createRepeated() => $pb.PbList<EmailPayload>();
  @$core.pragma('dart2js:noInline')
  static EmailPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailPayload>(create);
  static EmailPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EmailAddress> get to => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<EmailAddress> get cc => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<EmailAddress> get cci => $_getList(2);

  @$pb.TagNumber(4)
  EmailAddress get from => $_getN(3);
  @$pb.TagNumber(4)
  set from(EmailAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);
  @$pb.TagNumber(4)
  EmailAddress ensureFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get rawSubject => $_getSZ(4);
  @$pb.TagNumber(5)
  set rawSubject($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRawSubject() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawSubject() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rawText => $_getSZ(5);
  @$pb.TagNumber(6)
  set rawText($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRawText() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawText() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rawHtml => $_getSZ(6);
  @$pb.TagNumber(7)
  set rawHtml($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRawHtml() => $_has(6);
  @$pb.TagNumber(7)
  void clearRawHtml() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<EmailAttachment> get attachments => $_getList(7);

  @$pb.TagNumber(9)
  $core.bool get dynamic => $_getBF(8);
  @$pb.TagNumber(9)
  set dynamic($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDynamic() => $_has(8);
  @$pb.TagNumber(9)
  void clearDynamic() => clearField(9);

  @$pb.TagNumber(10)
  $2.JsonObjectValue get variables => $_getN(9);
  @$pb.TagNumber(10)
  set variables($2.JsonObjectValue v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasVariables() => $_has(9);
  @$pb.TagNumber(10)
  void clearVariables() => clearField(10);
  @$pb.TagNumber(10)
  $2.JsonObjectValue ensureVariables() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get i18Subject => $_getSZ(10);
  @$pb.TagNumber(11)
  set i18Subject($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasI18Subject() => $_has(10);
  @$pb.TagNumber(11)
  void clearI18Subject() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get i18Text => $_getSZ(11);
  @$pb.TagNumber(12)
  set i18Text($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasI18Text() => $_has(11);
  @$pb.TagNumber(12)
  void clearI18Text() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get i18Html => $_getSZ(12);
  @$pb.TagNumber(13)
  set i18Html($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasI18Html() => $_has(12);
  @$pb.TagNumber(13)
  void clearI18Html() => clearField(13);
}

class EmailAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailAddress', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  EmailAddress._() : super();
  factory EmailAddress({
    $core.String name,
    $core.String address,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory EmailAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailAddress clone() => EmailAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailAddress copyWith(void Function(EmailAddress) updates) => super.copyWith((message) => updates(message as EmailAddress)) as EmailAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailAddress create() => EmailAddress._();
  EmailAddress createEmptyInstance() => create();
  static $pb.PbList<EmailAddress> createRepeated() => $pb.PbList<EmailAddress>();
  @$core.pragma('dart2js:noInline')
  static EmailAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailAddress>(create);
  static EmailAddress _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class EmailAttachment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailAttachment', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', protoName: 'contentType')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  EmailAttachment._() : super();
  factory EmailAttachment({
    $core.String name,
    $core.String contentType,
    $core.List<$core.int> data,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory EmailAttachment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailAttachment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailAttachment clone() => EmailAttachment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailAttachment copyWith(void Function(EmailAttachment) updates) => super.copyWith((message) => updates(message as EmailAttachment)) as EmailAttachment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailAttachment create() => EmailAttachment._();
  EmailAttachment createEmptyInstance() => create();
  static $pb.PbList<EmailAttachment> createRepeated() => $pb.PbList<EmailAttachment>();
  @$core.pragma('dart2js:noInline')
  static EmailAttachment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailAttachment>(create);
  static EmailAttachment _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contentType => $_getSZ(1);
  @$pb.TagNumber(2)
  set contentType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

