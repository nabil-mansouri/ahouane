///
//  Generated code. Do not modify.
//  source: microservice.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'google/protobuf/any.pb.dart' as $1;

export 'microservice.pbenum.dart';

class MessageSession extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageSession', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName', protoName: 'displayName')
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireAt', protoName: 'expireAt', subBuilder: $0.Timestamp.create)
    ..pc<$1.Any>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custom', $pb.PbFieldType.PM, subBuilder: $1.Any.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dirty')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lang')
    ..pPS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scopes')
    ..pPS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles')
    ..hasRequiredFields = false
  ;

  MessageSession._() : super();
  factory MessageSession({
    $core.String id,
    $core.String userId,
    $core.String displayName,
    $0.Timestamp createdAt,
    $0.Timestamp updatedAt,
    $0.Timestamp expireAt,
    $core.Iterable<$1.Any> custom,
    $core.bool dirty,
    $core.String lang,
    $core.Iterable<$core.String> scopes,
    $core.Iterable<$core.String> roles,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (expireAt != null) {
      _result.expireAt = expireAt;
    }
    if (custom != null) {
      _result.custom.addAll(custom);
    }
    if (dirty != null) {
      _result.dirty = dirty;
    }
    if (lang != null) {
      _result.lang = lang;
    }
    if (scopes != null) {
      _result.scopes.addAll(scopes);
    }
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory MessageSession.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageSession.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageSession clone() => MessageSession()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageSession copyWith(void Function(MessageSession) updates) => super.copyWith((message) => updates(message as MessageSession)) as MessageSession; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageSession create() => MessageSession._();
  MessageSession createEmptyInstance() => create();
  static $pb.PbList<MessageSession> createRepeated() => $pb.PbList<MessageSession>();
  @$core.pragma('dart2js:noInline')
  static MessageSession getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageSession>(create);
  static MessageSession _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureUpdatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get expireAt => $_getN(5);
  @$pb.TagNumber(6)
  set expireAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpireAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpireAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureExpireAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$1.Any> get custom => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get dirty => $_getBF(7);
  @$pb.TagNumber(8)
  set dirty($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDirty() => $_has(7);
  @$pb.TagNumber(8)
  void clearDirty() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get lang => $_getSZ(8);
  @$pb.TagNumber(9)
  set lang($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLang() => $_has(8);
  @$pb.TagNumber(9)
  void clearLang() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get scopes => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$core.String> get roles => $_getList(10);
}

enum MessageHeader_Routeoneof {
  correlationId, 
  route, 
  notSet
}

class MessageHeader extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MessageHeader_Routeoneof> _MessageHeader_RouteoneofByTag = {
    1 : MessageHeader_Routeoneof.correlationId,
    2 : MessageHeader_Routeoneof.route,
    0 : MessageHeader_Routeoneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageHeader', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'correlationId', protoName: 'correlationId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'route')
    ..aOM<MessageSession>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', subBuilder: MessageSession.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', protoName: 'contentType')
    ..m<$core.String, $core.String>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attributes', entryClassName: 'MessageHeader.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorization')
    ..pc<$1.Any>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'custom', $pb.PbFieldType.PM, subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  MessageHeader._() : super();
  factory MessageHeader({
    $core.String correlationId,
    $core.String route,
    MessageSession session,
    $core.String contentType,
    $core.Map<$core.String, $core.String> attributes,
    $core.String authorization,
    $core.Iterable<$1.Any> custom,
  }) {
    final _result = create();
    if (correlationId != null) {
      _result.correlationId = correlationId;
    }
    if (route != null) {
      _result.route = route;
    }
    if (session != null) {
      _result.session = session;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (attributes != null) {
      _result.attributes.addAll(attributes);
    }
    if (authorization != null) {
      _result.authorization = authorization;
    }
    if (custom != null) {
      _result.custom.addAll(custom);
    }
    return _result;
  }
  factory MessageHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageHeader clone() => MessageHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageHeader copyWith(void Function(MessageHeader) updates) => super.copyWith((message) => updates(message as MessageHeader)) as MessageHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageHeader create() => MessageHeader._();
  MessageHeader createEmptyInstance() => create();
  static $pb.PbList<MessageHeader> createRepeated() => $pb.PbList<MessageHeader>();
  @$core.pragma('dart2js:noInline')
  static MessageHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageHeader>(create);
  static MessageHeader _defaultInstance;

  MessageHeader_Routeoneof whichRouteoneof() => _MessageHeader_RouteoneofByTag[$_whichOneof(0)];
  void clearRouteoneof() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get correlationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set correlationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCorrelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCorrelationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get route => $_getSZ(1);
  @$pb.TagNumber(2)
  set route($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoute() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoute() => clearField(2);

  @$pb.TagNumber(3)
  MessageSession get session => $_getN(2);
  @$pb.TagNumber(3)
  set session(MessageSession v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
  @$pb.TagNumber(3)
  MessageSession ensureSession() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get contentType => $_getSZ(3);
  @$pb.TagNumber(4)
  set contentType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContentType() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentType() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(4);

  @$pb.TagNumber(7)
  $core.String get authorization => $_getSZ(5);
  @$pb.TagNumber(7)
  set authorization($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthorization() => $_has(5);
  @$pb.TagNumber(7)
  void clearAuthorization() => clearField(7);

  @$pb.TagNumber(10)
  $core.List<$1.Any> get custom => $_getList(6);
}

enum MessageBody_OneofBody {
  buffer, 
  object, 
  notSet
}

class MessageBody extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MessageBody_OneofBody> _MessageBody_OneofBodyByTag = {
    10 : MessageBody_OneofBody.buffer,
    11 : MessageBody_OneofBody.object,
    0 : MessageBody_OneofBody.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageBody', createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..a<$core.List<$core.int>>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buffer', $pb.PbFieldType.OY)
    ..aOM<$1.Any>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'object', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  MessageBody._() : super();
  factory MessageBody({
    $core.List<$core.int> buffer,
    $1.Any object,
  }) {
    final _result = create();
    if (buffer != null) {
      _result.buffer = buffer;
    }
    if (object != null) {
      _result.object = object;
    }
    return _result;
  }
  factory MessageBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageBody clone() => MessageBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageBody copyWith(void Function(MessageBody) updates) => super.copyWith((message) => updates(message as MessageBody)) as MessageBody; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageBody create() => MessageBody._();
  MessageBody createEmptyInstance() => create();
  static $pb.PbList<MessageBody> createRepeated() => $pb.PbList<MessageBody>();
  @$core.pragma('dart2js:noInline')
  static MessageBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageBody>(create);
  static MessageBody _defaultInstance;

  MessageBody_OneofBody whichOneofBody() => _MessageBody_OneofBodyByTag[$_whichOneof(0)];
  void clearOneofBody() => clearField($_whichOneof(0));

  @$pb.TagNumber(10)
  $core.List<$core.int> get buffer => $_getN(0);
  @$pb.TagNumber(10)
  set buffer($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(10)
  $core.bool hasBuffer() => $_has(0);
  @$pb.TagNumber(10)
  void clearBuffer() => clearField(10);

  @$pb.TagNumber(11)
  $1.Any get object => $_getN(1);
  @$pb.TagNumber(11)
  set object($1.Any v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasObject() => $_has(1);
  @$pb.TagNumber(11)
  void clearObject() => clearField(11);
  @$pb.TagNumber(11)
  $1.Any ensureObject() => $_ensure(1);
}

class MessageTrailer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageTrailer', createEmptyInstance: create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupLength', $pb.PbFieldType.O3, protoName: 'groupLength')
    ..hasRequiredFields = false
  ;

  MessageTrailer._() : super();
  factory MessageTrailer({
    $core.int groupLength,
  }) {
    final _result = create();
    if (groupLength != null) {
      _result.groupLength = groupLength;
    }
    return _result;
  }
  factory MessageTrailer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageTrailer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageTrailer clone() => MessageTrailer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageTrailer copyWith(void Function(MessageTrailer) updates) => super.copyWith((message) => updates(message as MessageTrailer)) as MessageTrailer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageTrailer create() => MessageTrailer._();
  MessageTrailer createEmptyInstance() => create();
  static $pb.PbList<MessageTrailer> createRepeated() => $pb.PbList<MessageTrailer>();
  @$core.pragma('dart2js:noInline')
  static MessageTrailer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageTrailer>(create);
  static MessageTrailer _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get groupLength => $_getIZ(0);
  @$pb.TagNumber(2)
  set groupLength($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupLength() => $_has(0);
  @$pb.TagNumber(2)
  void clearGroupLength() => clearField(2);
}

class MessageError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageError', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$1.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  MessageError._() : super();
  factory MessageError({
    $core.String code,
    $core.String description,
    $1.Any details,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (description != null) {
      _result.description = description;
    }
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory MessageError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageError clone() => MessageError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageError copyWith(void Function(MessageError) updates) => super.copyWith((message) => updates(message as MessageError)) as MessageError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageError create() => MessageError._();
  MessageError createEmptyInstance() => create();
  static $pb.PbList<MessageError> createRepeated() => $pb.PbList<MessageError>();
  @$core.pragma('dart2js:noInline')
  static MessageError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageError>(create);
  static MessageError _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $1.Any get details => $_getN(2);
  @$pb.TagNumber(3)
  set details($1.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetails() => clearField(3);
  @$pb.TagNumber(3)
  $1.Any ensureDetails() => $_ensure(2);
}

enum MessagePart_OneofPart {
  header, 
  body, 
  error, 
  trailer, 
  notSet
}

class MessagePart extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MessagePart_OneofPart> _MessagePart_OneofPartByTag = {
    10 : MessagePart_OneofPart.header,
    11 : MessagePart_OneofPart.body,
    12 : MessagePart_OneofPart.error,
    13 : MessagePart_OneofPart.trailer,
    0 : MessagePart_OneofPart.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessagePart', createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13])
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', protoName: 'groupId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numInGroup', $pb.PbFieldType.O3, protoName: 'numInGroup')
    ..aOM<MessageHeader>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'header', subBuilder: MessageHeader.create)
    ..aOM<MessageBody>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body', subBuilder: MessageBody.create)
    ..aOM<MessageError>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: MessageError.create)
    ..aOM<MessageTrailer>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trailer', subBuilder: MessageTrailer.create)
    ..hasRequiredFields = false
  ;

  MessagePart._() : super();
  factory MessagePart({
    $core.String groupId,
    $core.int numInGroup,
    MessageHeader header,
    MessageBody body,
    MessageError error,
    MessageTrailer trailer,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (numInGroup != null) {
      _result.numInGroup = numInGroup;
    }
    if (header != null) {
      _result.header = header;
    }
    if (body != null) {
      _result.body = body;
    }
    if (error != null) {
      _result.error = error;
    }
    if (trailer != null) {
      _result.trailer = trailer;
    }
    return _result;
  }
  factory MessagePart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessagePart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessagePart clone() => MessagePart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessagePart copyWith(void Function(MessagePart) updates) => super.copyWith((message) => updates(message as MessagePart)) as MessagePart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessagePart create() => MessagePart._();
  MessagePart createEmptyInstance() => create();
  static $pb.PbList<MessagePart> createRepeated() => $pb.PbList<MessagePart>();
  @$core.pragma('dart2js:noInline')
  static MessagePart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessagePart>(create);
  static MessagePart _defaultInstance;

  MessagePart_OneofPart whichOneofPart() => _MessagePart_OneofPartByTag[$_whichOneof(0)];
  void clearOneofPart() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(2)
  set groupId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get numInGroup => $_getIZ(1);
  @$pb.TagNumber(3)
  set numInGroup($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasNumInGroup() => $_has(1);
  @$pb.TagNumber(3)
  void clearNumInGroup() => clearField(3);

  @$pb.TagNumber(10)
  MessageHeader get header => $_getN(2);
  @$pb.TagNumber(10)
  set header(MessageHeader v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasHeader() => $_has(2);
  @$pb.TagNumber(10)
  void clearHeader() => clearField(10);
  @$pb.TagNumber(10)
  MessageHeader ensureHeader() => $_ensure(2);

  @$pb.TagNumber(11)
  MessageBody get body => $_getN(3);
  @$pb.TagNumber(11)
  set body(MessageBody v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(11)
  void clearBody() => clearField(11);
  @$pb.TagNumber(11)
  MessageBody ensureBody() => $_ensure(3);

  @$pb.TagNumber(12)
  MessageError get error => $_getN(4);
  @$pb.TagNumber(12)
  set error(MessageError v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(12)
  void clearError() => clearField(12);
  @$pb.TagNumber(12)
  MessageError ensureError() => $_ensure(4);

  @$pb.TagNumber(13)
  MessageTrailer get trailer => $_getN(5);
  @$pb.TagNumber(13)
  set trailer(MessageTrailer v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasTrailer() => $_has(5);
  @$pb.TagNumber(13)
  void clearTrailer() => clearField(13);
  @$pb.TagNumber(13)
  MessageTrailer ensureTrailer() => $_ensure(5);
}

