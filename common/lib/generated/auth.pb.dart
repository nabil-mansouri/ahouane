///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $4;
import 'json.pb.dart' as $5;
import 'core.pb.dart' as $0;

class VerifyMailPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyMailPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  VerifyMailPayload._() : super();
  factory VerifyMailPayload({
    $core.String email,
    $core.String token,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory VerifyMailPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyMailPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyMailPayload clone() => VerifyMailPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyMailPayload copyWith(void Function(VerifyMailPayload) updates) => super.copyWith((message) => updates(message as VerifyMailPayload)) as VerifyMailPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyMailPayload create() => VerifyMailPayload._();
  VerifyMailPayload createEmptyInstance() => create();
  static $pb.PbList<VerifyMailPayload> createRepeated() => $pb.PbList<VerifyMailPayload>();
  @$core.pragma('dart2js:noInline')
  static VerifyMailPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyMailPayload>(create);
  static VerifyMailPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class ResetPasswordPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  ResetPasswordPayload._() : super();
  factory ResetPasswordPayload({
    $core.String email,
    $core.String token,
    $core.String password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (token != null) {
      _result.token = token;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ResetPasswordPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordPayload clone() => ResetPasswordPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordPayload copyWith(void Function(ResetPasswordPayload) updates) => super.copyWith((message) => updates(message as ResetPasswordPayload)) as ResetPasswordPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordPayload create() => ResetPasswordPayload._();
  ResetPasswordPayload createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordPayload> createRepeated() => $pb.PbList<ResetPasswordPayload>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordPayload>(create);
  static ResetPasswordPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class SendResetPasswordPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendResetPasswordPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  SendResetPasswordPayload._() : super();
  factory SendResetPasswordPayload({
    $core.String email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory SendResetPasswordPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendResetPasswordPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendResetPasswordPayload clone() => SendResetPasswordPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendResetPasswordPayload copyWith(void Function(SendResetPasswordPayload) updates) => super.copyWith((message) => updates(message as SendResetPasswordPayload)) as SendResetPasswordPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendResetPasswordPayload create() => SendResetPasswordPayload._();
  SendResetPasswordPayload createEmptyInstance() => create();
  static $pb.PbList<SendResetPasswordPayload> createRepeated() => $pb.PbList<SendResetPasswordPayload>();
  @$core.pragma('dart2js:noInline')
  static SendResetPasswordPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendResetPasswordPayload>(create);
  static SendResetPasswordPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class SendMailVerificationPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendMailVerificationPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  SendMailVerificationPayload._() : super();
  factory SendMailVerificationPayload({
    $core.String email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory SendMailVerificationPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMailVerificationPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMailVerificationPayload clone() => SendMailVerificationPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMailVerificationPayload copyWith(void Function(SendMailVerificationPayload) updates) => super.copyWith((message) => updates(message as SendMailVerificationPayload)) as SendMailVerificationPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMailVerificationPayload create() => SendMailVerificationPayload._();
  SendMailVerificationPayload createEmptyInstance() => create();
  static $pb.PbList<SendMailVerificationPayload> createRepeated() => $pb.PbList<SendMailVerificationPayload>();
  @$core.pragma('dart2js:noInline')
  static SendMailVerificationPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMailVerificationPayload>(create);
  static SendMailVerificationPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class AuthEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthEmpty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AuthEmpty._() : super();
  factory AuthEmpty() => create();
  factory AuthEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthEmpty clone() => AuthEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthEmpty copyWith(void Function(AuthEmpty) updates) => super.copyWith((message) => updates(message as AuthEmpty)) as AuthEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthEmpty create() => AuthEmpty._();
  AuthEmpty createEmptyInstance() => create();
  static $pb.PbList<AuthEmpty> createRepeated() => $pb.PbList<AuthEmpty>();
  @$core.pragma('dart2js:noInline')
  static AuthEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthEmpty>(create);
  static AuthEmpty _defaultInstance;
}

class CreateUserByEmailPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserByEmailPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  CreateUserByEmailPayload._() : super();
  factory CreateUserByEmailPayload({
    $core.String email,
    $core.String password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory CreateUserByEmailPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserByEmailPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserByEmailPayload clone() => CreateUserByEmailPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserByEmailPayload copyWith(void Function(CreateUserByEmailPayload) updates) => super.copyWith((message) => updates(message as CreateUserByEmailPayload)) as CreateUserByEmailPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserByEmailPayload create() => CreateUserByEmailPayload._();
  CreateUserByEmailPayload createEmptyInstance() => create();
  static $pb.PbList<CreateUserByEmailPayload> createRepeated() => $pb.PbList<CreateUserByEmailPayload>();
  @$core.pragma('dart2js:noInline')
  static CreateUserByEmailPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserByEmailPayload>(create);
  static CreateUserByEmailPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginInByEmailPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginInByEmailPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginInByEmailPayload._() : super();
  factory LoginInByEmailPayload({
    $core.String email,
    $core.String password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginInByEmailPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginInByEmailPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginInByEmailPayload clone() => LoginInByEmailPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginInByEmailPayload copyWith(void Function(LoginInByEmailPayload) updates) => super.copyWith((message) => updates(message as LoginInByEmailPayload)) as LoginInByEmailPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginInByEmailPayload create() => LoginInByEmailPayload._();
  LoginInByEmailPayload createEmptyInstance() => create();
  static $pb.PbList<LoginInByEmailPayload> createRepeated() => $pb.PbList<LoginInByEmailPayload>();
  @$core.pragma('dart2js:noInline')
  static LoginInByEmailPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginInByEmailPayload>(create);
  static LoginInByEmailPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName', protoName: 'displayName')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifiedEmail', protoName: 'verifiedEmail')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifiedPhone', protoName: 'verifiedPhone')
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $4.Timestamp.create)
    ..aOM<UserDetails>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details', subBuilder: UserDetails.create)
    ..aOM<UserAddress>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: UserAddress.create)
    ..aOM<$5.JsonObjectValue>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custom', subBuilder: $5.JsonObjectValue.create)
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blocked')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String id,
    $core.String email,
    $core.String phone,
    $core.String displayName,
    $core.bool verifiedEmail,
    $core.bool verifiedPhone,
    $4.Timestamp createdAt,
    $4.Timestamp updatedAt,
    UserDetails details,
    UserAddress address,
    $5.JsonObjectValue custom,
    $core.String password,
    $core.bool blocked,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (email != null) {
      _result.email = email;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (verifiedEmail != null) {
      _result.verifiedEmail = verifiedEmail;
    }
    if (verifiedPhone != null) {
      _result.verifiedPhone = verifiedPhone;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (details != null) {
      _result.details = details;
    }
    if (address != null) {
      _result.address = address;
    }
    if (custom != null) {
      _result.custom = custom;
    }
    if (password != null) {
      _result.password = password;
    }
    if (blocked != null) {
      _result.blocked = blocked;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get displayName => $_getSZ(3);
  @$pb.TagNumber(4)
  set displayName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplayName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplayName() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get verifiedEmail => $_getBF(4);
  @$pb.TagNumber(5)
  set verifiedEmail($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVerifiedEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerifiedEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get verifiedPhone => $_getBF(5);
  @$pb.TagNumber(6)
  set verifiedPhone($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVerifiedPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearVerifiedPhone() => clearField(6);

  @$pb.TagNumber(7)
  $4.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($4.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureUpdatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  UserDetails get details => $_getN(8);
  @$pb.TagNumber(9)
  set details(UserDetails v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDetails() => $_has(8);
  @$pb.TagNumber(9)
  void clearDetails() => clearField(9);
  @$pb.TagNumber(9)
  UserDetails ensureDetails() => $_ensure(8);

  @$pb.TagNumber(10)
  UserAddress get address => $_getN(9);
  @$pb.TagNumber(10)
  set address(UserAddress v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddress() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddress() => clearField(10);
  @$pb.TagNumber(10)
  UserAddress ensureAddress() => $_ensure(9);

  @$pb.TagNumber(11)
  $5.JsonObjectValue get custom => $_getN(10);
  @$pb.TagNumber(11)
  set custom($5.JsonObjectValue v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCustom() => $_has(10);
  @$pb.TagNumber(11)
  void clearCustom() => clearField(11);
  @$pb.TagNumber(11)
  $5.JsonObjectValue ensureCustom() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get password => $_getSZ(11);
  @$pb.TagNumber(12)
  set password($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPassword() => $_has(11);
  @$pb.TagNumber(12)
  void clearPassword() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get blocked => $_getBF(12);
  @$pb.TagNumber(13)
  set blocked($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasBlocked() => $_has(12);
  @$pb.TagNumber(13)
  void clearBlocked() => clearField(13);
}

class UserDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserDetails', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName', protoName: 'firstName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName', protoName: 'lastName')
    ..aOM<$4.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'birthDate', protoName: 'birthDate', subBuilder: $4.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  UserDetails._() : super();
  factory UserDetails({
    $core.String firstName,
    $core.String lastName,
    $4.Timestamp birthDate,
    $core.String title,
  }) {
    final _result = create();
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (birthDate != null) {
      _result.birthDate = birthDate;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory UserDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserDetails clone() => UserDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserDetails copyWith(void Function(UserDetails) updates) => super.copyWith((message) => updates(message as UserDetails)) as UserDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDetails create() => UserDetails._();
  UserDetails createEmptyInstance() => create();
  static $pb.PbList<UserDetails> createRepeated() => $pb.PbList<UserDetails>();
  @$core.pragma('dart2js:noInline')
  static UserDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDetails>(create);
  static UserDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);

  @$pb.TagNumber(3)
  $4.Timestamp get birthDate => $_getN(2);
  @$pb.TagNumber(3)
  set birthDate($4.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBirthDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirthDate() => clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureBirthDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);
}

class UserAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserAddress', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'street')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'street2')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'informations')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'city')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'zip')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'country')
    ..hasRequiredFields = false
  ;

  UserAddress._() : super();
  factory UserAddress({
    $core.int number,
    $core.String street,
    $core.String street2,
    $core.String informations,
    $core.String city,
    $core.String zip,
    $core.String country,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    if (street != null) {
      _result.street = street;
    }
    if (street2 != null) {
      _result.street2 = street2;
    }
    if (informations != null) {
      _result.informations = informations;
    }
    if (city != null) {
      _result.city = city;
    }
    if (zip != null) {
      _result.zip = zip;
    }
    if (country != null) {
      _result.country = country;
    }
    return _result;
  }
  factory UserAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAddress clone() => UserAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAddress copyWith(void Function(UserAddress) updates) => super.copyWith((message) => updates(message as UserAddress)) as UserAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAddress create() => UserAddress._();
  UserAddress createEmptyInstance() => create();
  static $pb.PbList<UserAddress> createRepeated() => $pb.PbList<UserAddress>();
  @$core.pragma('dart2js:noInline')
  static UserAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAddress>(create);
  static UserAddress _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get number => $_getIZ(0);
  @$pb.TagNumber(1)
  set number($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get street => $_getSZ(1);
  @$pb.TagNumber(2)
  set street($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStreet() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreet() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get street2 => $_getSZ(2);
  @$pb.TagNumber(3)
  set street2($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreet2() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreet2() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get informations => $_getSZ(3);
  @$pb.TagNumber(4)
  set informations($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInformations() => $_has(3);
  @$pb.TagNumber(4)
  void clearInformations() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(5)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearCity() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get zip => $_getSZ(5);
  @$pb.TagNumber(6)
  set zip($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasZip() => $_has(5);
  @$pb.TagNumber(6)
  void clearZip() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(7)
  set country($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountry() => clearField(7);
}

class ServerAuthConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerAuthConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userResource', protoName: 'userResource')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionDurationMinutes', $pb.PbFieldType.O3, protoName: 'sessionDurationMinutes')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenDurationMinutes', $pb.PbFieldType.O3, protoName: 'tokenDurationMinutes')
    ..aOM<$0.ChannelServiceConfig>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyEmailSubject', protoName: 'verifyEmailSubject')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyEmailTemplate', protoName: 'verifyEmailTemplate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resetPwdSubject', protoName: 'resetPwdSubject')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resetPwdTemplate', protoName: 'resetPwdTemplate')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adminApiKey', protoName: 'adminApiKey')
    ..hasRequiredFields = false
  ;

  ServerAuthConfig._() : super();
  factory ServerAuthConfig({
    $core.String userResource,
    $core.int sessionDurationMinutes,
    $core.int tokenDurationMinutes,
    $0.ChannelServiceConfig serviceConfig,
    $core.String verifyEmailSubject,
    $core.String verifyEmailTemplate,
    $core.String resetPwdSubject,
    $core.String resetPwdTemplate,
    $core.String adminApiKey,
  }) {
    final _result = create();
    if (userResource != null) {
      _result.userResource = userResource;
    }
    if (sessionDurationMinutes != null) {
      _result.sessionDurationMinutes = sessionDurationMinutes;
    }
    if (tokenDurationMinutes != null) {
      _result.tokenDurationMinutes = tokenDurationMinutes;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    if (verifyEmailSubject != null) {
      _result.verifyEmailSubject = verifyEmailSubject;
    }
    if (verifyEmailTemplate != null) {
      _result.verifyEmailTemplate = verifyEmailTemplate;
    }
    if (resetPwdSubject != null) {
      _result.resetPwdSubject = resetPwdSubject;
    }
    if (resetPwdTemplate != null) {
      _result.resetPwdTemplate = resetPwdTemplate;
    }
    if (adminApiKey != null) {
      _result.adminApiKey = adminApiKey;
    }
    return _result;
  }
  factory ServerAuthConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerAuthConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerAuthConfig clone() => ServerAuthConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerAuthConfig copyWith(void Function(ServerAuthConfig) updates) => super.copyWith((message) => updates(message as ServerAuthConfig)) as ServerAuthConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerAuthConfig create() => ServerAuthConfig._();
  ServerAuthConfig createEmptyInstance() => create();
  static $pb.PbList<ServerAuthConfig> createRepeated() => $pb.PbList<ServerAuthConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerAuthConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerAuthConfig>(create);
  static ServerAuthConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userResource => $_getSZ(0);
  @$pb.TagNumber(1)
  set userResource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserResource() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get sessionDurationMinutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set sessionDurationMinutes($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionDurationMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionDurationMinutes() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tokenDurationMinutes => $_getIZ(2);
  @$pb.TagNumber(3)
  set tokenDurationMinutes($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenDurationMinutes() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenDurationMinutes() => clearField(3);

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
  $core.String get verifyEmailSubject => $_getSZ(4);
  @$pb.TagNumber(5)
  set verifyEmailSubject($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVerifyEmailSubject() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerifyEmailSubject() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get verifyEmailTemplate => $_getSZ(5);
  @$pb.TagNumber(6)
  set verifyEmailTemplate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVerifyEmailTemplate() => $_has(5);
  @$pb.TagNumber(6)
  void clearVerifyEmailTemplate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get resetPwdSubject => $_getSZ(6);
  @$pb.TagNumber(7)
  set resetPwdSubject($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasResetPwdSubject() => $_has(6);
  @$pb.TagNumber(7)
  void clearResetPwdSubject() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get resetPwdTemplate => $_getSZ(7);
  @$pb.TagNumber(8)
  set resetPwdTemplate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasResetPwdTemplate() => $_has(7);
  @$pb.TagNumber(8)
  void clearResetPwdTemplate() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get adminApiKey => $_getSZ(8);
  @$pb.TagNumber(9)
  set adminApiKey($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAdminApiKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearAdminApiKey() => clearField(9);
}

class UpdateUserPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserPayload', createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false
  ;

  UpdateUserPayload._() : super();
  factory UpdateUserPayload({
    User user,
    $core.String newPassword,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (newPassword != null) {
      _result.newPassword = newPassword;
    }
    return _result;
  }
  factory UpdateUserPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserPayload clone() => UpdateUserPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserPayload copyWith(void Function(UpdateUserPayload) updates) => super.copyWith((message) => updates(message as UpdateUserPayload)) as UpdateUserPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserPayload create() => UpdateUserPayload._();
  UpdateUserPayload createEmptyInstance() => create();
  static $pb.PbList<UpdateUserPayload> createRepeated() => $pb.PbList<UpdateUserPayload>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserPayload>(create);
  static UpdateUserPayload _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => clearField(2);
}

class CreateUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserResponse', createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scopes')
    ..hasRequiredFields = false
  ;

  CreateUserResponse._() : super();
  factory CreateUserResponse({
    User user,
    $core.Iterable<$core.String> roles,
    $core.Iterable<$core.String> scopes,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    if (scopes != null) {
      _result.scopes.addAll(scopes);
    }
    return _result;
  }
  factory CreateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserResponse clone() => CreateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserResponse copyWith(void Function(CreateUserResponse) updates) => super.copyWith((message) => updates(message as CreateUserResponse)) as CreateUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserResponse create() => CreateUserResponse._();
  CreateUserResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserResponse> createRepeated() => $pb.PbList<CreateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserResponse>(create);
  static CreateUserResponse _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get roles => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get scopes => $_getList(2);
}

