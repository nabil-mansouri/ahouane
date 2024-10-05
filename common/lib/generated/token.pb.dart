///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

class TokenConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ressource')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenLength', $pb.PbFieldType.O3, protoName: 'tokenLength')
    ..hasRequiredFields = false
  ;

  TokenConfig._() : super();
  factory TokenConfig({
    $core.String ressource,
    $core.int tokenLength,
  }) {
    final _result = create();
    if (ressource != null) {
      _result.ressource = ressource;
    }
    if (tokenLength != null) {
      _result.tokenLength = tokenLength;
    }
    return _result;
  }
  factory TokenConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenConfig clone() => TokenConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenConfig copyWith(void Function(TokenConfig) updates) => super.copyWith((message) => updates(message as TokenConfig)) as TokenConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenConfig create() => TokenConfig._();
  TokenConfig createEmptyInstance() => create();
  static $pb.PbList<TokenConfig> createRepeated() => $pb.PbList<TokenConfig>();
  @$core.pragma('dart2js:noInline')
  static TokenConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenConfig>(create);
  static TokenConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ressource => $_getSZ(0);
  @$pb.TagNumber(1)
  set ressource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRessource() => $_has(0);
  @$pb.TagNumber(1)
  void clearRessource() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tokenLength => $_getIZ(1);
  @$pb.TagNumber(2)
  set tokenLength($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenLength() => clearField(2);
}

class TokenEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenEmpty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  TokenEmpty._() : super();
  factory TokenEmpty() => create();
  factory TokenEmpty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenEmpty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenEmpty clone() => TokenEmpty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenEmpty copyWith(void Function(TokenEmpty) updates) => super.copyWith((message) => updates(message as TokenEmpty)) as TokenEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenEmpty create() => TokenEmpty._();
  TokenEmpty createEmptyInstance() => create();
  static $pb.PbList<TokenEmpty> createRepeated() => $pb.PbList<TokenEmpty>();
  @$core.pragma('dart2js:noInline')
  static TokenEmpty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenEmpty>(create);
  static TokenEmpty _defaultInstance;
}

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Token', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenType', protoName: 'tokenType')
    ..aOM<$1.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireAt', protoName: 'expireAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Token._() : super();
  factory Token({
    $core.String value,
    $core.String tokenType,
    $1.Timestamp createdAt,
    $1.Timestamp expireAt,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (tokenType != null) {
      _result.tokenType = tokenType;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (expireAt != null) {
      _result.expireAt = expireAt;
    }
    return _result;
  }
  factory Token.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) => super.copyWith((message) => updates(message as Token)) as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenType => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenType() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get expireAt => $_getN(3);
  @$pb.TagNumber(4)
  set expireAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpireAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureExpireAt() => $_ensure(3);
}

class TokenPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenPayload', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenType', protoName: 'tokenType')
    ..hasRequiredFields = false
  ;

  TokenPayload._() : super();
  factory TokenPayload({
    $core.String value,
    $core.String tokenType,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (tokenType != null) {
      _result.tokenType = tokenType;
    }
    return _result;
  }
  factory TokenPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenPayload clone() => TokenPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenPayload copyWith(void Function(TokenPayload) updates) => super.copyWith((message) => updates(message as TokenPayload)) as TokenPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenPayload create() => TokenPayload._();
  TokenPayload createEmptyInstance() => create();
  static $pb.PbList<TokenPayload> createRepeated() => $pb.PbList<TokenPayload>();
  @$core.pragma('dart2js:noInline')
  static TokenPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenPayload>(create);
  static TokenPayload _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenType => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenType() => clearField(2);
}

class CreateTokenPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTokenPayload', createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenType', protoName: 'tokenType')
    ..aOM<$1.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireAt', protoName: 'expireAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  CreateTokenPayload._() : super();
  factory CreateTokenPayload({
    $core.String tokenType,
    $1.Timestamp expireAt,
  }) {
    final _result = create();
    if (tokenType != null) {
      _result.tokenType = tokenType;
    }
    if (expireAt != null) {
      _result.expireAt = expireAt;
    }
    return _result;
  }
  factory CreateTokenPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTokenPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTokenPayload clone() => CreateTokenPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTokenPayload copyWith(void Function(CreateTokenPayload) updates) => super.copyWith((message) => updates(message as CreateTokenPayload)) as CreateTokenPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTokenPayload create() => CreateTokenPayload._();
  CreateTokenPayload createEmptyInstance() => create();
  static $pb.PbList<CreateTokenPayload> createRepeated() => $pb.PbList<CreateTokenPayload>();
  @$core.pragma('dart2js:noInline')
  static CreateTokenPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTokenPayload>(create);
  static CreateTokenPayload _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get tokenType => $_getSZ(0);
  @$pb.TagNumber(2)
  set tokenType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenType() => $_has(0);
  @$pb.TagNumber(2)
  void clearTokenType() => clearField(2);

  @$pb.TagNumber(4)
  $1.Timestamp get expireAt => $_getN(1);
  @$pb.TagNumber(4)
  set expireAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpireAt() => $_has(1);
  @$pb.TagNumber(4)
  void clearExpireAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureExpireAt() => $_ensure(1);
}

class TokenValidation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenValidation', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  TokenValidation._() : super();
  factory TokenValidation({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory TokenValidation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenValidation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenValidation clone() => TokenValidation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenValidation copyWith(void Function(TokenValidation) updates) => super.copyWith((message) => updates(message as TokenValidation)) as TokenValidation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TokenValidation create() => TokenValidation._();
  TokenValidation createEmptyInstance() => create();
  static $pb.PbList<TokenValidation> createRepeated() => $pb.PbList<TokenValidation>();
  @$core.pragma('dart2js:noInline')
  static TokenValidation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenValidation>(create);
  static TokenValidation _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

