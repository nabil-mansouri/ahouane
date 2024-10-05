///
//  Generated code. Do not modify.
//  source: http.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core.pb.dart' as $0;
import 'google/protobuf/timestamp.pb.dart' as $1;
import 'google/protobuf/duration.pb.dart' as $2;

class HttpClientConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HttpClientConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseUri', protoName: 'baseUri')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emulateMethods', protoName: 'emulateMethods')
    ..hasRequiredFields = false
  ;

  HttpClientConfig._() : super();
  factory HttpClientConfig({
    $core.String baseUri,
    $core.bool emulateMethods,
  }) {
    final _result = create();
    if (baseUri != null) {
      _result.baseUri = baseUri;
    }
    if (emulateMethods != null) {
      _result.emulateMethods = emulateMethods;
    }
    return _result;
  }
  factory HttpClientConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpClientConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpClientConfig clone() => HttpClientConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpClientConfig copyWith(void Function(HttpClientConfig) updates) => super.copyWith((message) => updates(message as HttpClientConfig)) as HttpClientConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpClientConfig create() => HttpClientConfig._();
  HttpClientConfig createEmptyInstance() => create();
  static $pb.PbList<HttpClientConfig> createRepeated() => $pb.PbList<HttpClientConfig>();
  @$core.pragma('dart2js:noInline')
  static HttpClientConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpClientConfig>(create);
  static HttpClientConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get baseUri => $_getSZ(0);
  @$pb.TagNumber(1)
  set baseUri($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseUri() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get emulateMethods => $_getBF(1);
  @$pb.TagNumber(2)
  set emulateMethods($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmulateMethods() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmulateMethods() => clearField(2);
}

class HttpServiceConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HttpServiceConfig', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxBodySize', $pb.PbFieldType.O3, protoName: 'maxBodySize')
    ..aOM<$0.ChannelServiceConfig>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceConfig', protoName: 'serviceConfig', subBuilder: $0.ChannelServiceConfig.create)
    ..hasRequiredFields = false
  ;

  HttpServiceConfig._() : super();
  factory HttpServiceConfig({
    $core.int maxBodySize,
    $0.ChannelServiceConfig serviceConfig,
  }) {
    final _result = create();
    if (maxBodySize != null) {
      _result.maxBodySize = maxBodySize;
    }
    if (serviceConfig != null) {
      _result.serviceConfig = serviceConfig;
    }
    return _result;
  }
  factory HttpServiceConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpServiceConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpServiceConfig clone() => HttpServiceConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpServiceConfig copyWith(void Function(HttpServiceConfig) updates) => super.copyWith((message) => updates(message as HttpServiceConfig)) as HttpServiceConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpServiceConfig create() => HttpServiceConfig._();
  HttpServiceConfig createEmptyInstance() => create();
  static $pb.PbList<HttpServiceConfig> createRepeated() => $pb.PbList<HttpServiceConfig>();
  @$core.pragma('dart2js:noInline')
  static HttpServiceConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpServiceConfig>(create);
  static HttpServiceConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxBodySize => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxBodySize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxBodySize() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxBodySize() => clearField(1);

  @$pb.TagNumber(4)
  $0.ChannelServiceConfig get serviceConfig => $_getN(1);
  @$pb.TagNumber(4)
  set serviceConfig($0.ChannelServiceConfig v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasServiceConfig() => $_has(1);
  @$pb.TagNumber(4)
  void clearServiceConfig() => clearField(4);
  @$pb.TagNumber(4)
  $0.ChannelServiceConfig ensureServiceConfig() => $_ensure(1);
}

class HttpServerConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HttpServerConfig', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secure')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'certificatePath', protoName: 'certificatePath')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKeyPath', protoName: 'privateKeyPath')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKeyPassword', protoName: 'privateKeyPassword')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableMetrics', protoName: 'enableMetrics')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableLogs', protoName: 'enableLogs')
    ..hasRequiredFields = false
  ;

  HttpServerConfig._() : super();
  factory HttpServerConfig({
    $core.int port,
    $core.bool secure,
    $core.String host,
    $core.String certificatePath,
    $core.String privateKeyPath,
    $core.String privateKeyPassword,
    $core.bool enableMetrics,
    $core.bool enableLogs,
  }) {
    final _result = create();
    if (port != null) {
      _result.port = port;
    }
    if (secure != null) {
      _result.secure = secure;
    }
    if (host != null) {
      _result.host = host;
    }
    if (certificatePath != null) {
      _result.certificatePath = certificatePath;
    }
    if (privateKeyPath != null) {
      _result.privateKeyPath = privateKeyPath;
    }
    if (privateKeyPassword != null) {
      _result.privateKeyPassword = privateKeyPassword;
    }
    if (enableMetrics != null) {
      _result.enableMetrics = enableMetrics;
    }
    if (enableLogs != null) {
      _result.enableLogs = enableLogs;
    }
    return _result;
  }
  factory HttpServerConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HttpServerConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HttpServerConfig clone() => HttpServerConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HttpServerConfig copyWith(void Function(HttpServerConfig) updates) => super.copyWith((message) => updates(message as HttpServerConfig)) as HttpServerConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpServerConfig create() => HttpServerConfig._();
  HttpServerConfig createEmptyInstance() => create();
  static $pb.PbList<HttpServerConfig> createRepeated() => $pb.PbList<HttpServerConfig>();
  @$core.pragma('dart2js:noInline')
  static HttpServerConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpServerConfig>(create);
  static HttpServerConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get port => $_getIZ(0);
  @$pb.TagNumber(1)
  set port($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPort() => $_has(0);
  @$pb.TagNumber(1)
  void clearPort() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get secure => $_getBF(1);
  @$pb.TagNumber(2)
  set secure($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecure() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecure() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get host => $_getSZ(2);
  @$pb.TagNumber(3)
  set host($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearHost() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get certificatePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set certificatePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCertificatePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearCertificatePath() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get privateKeyPath => $_getSZ(4);
  @$pb.TagNumber(5)
  set privateKeyPath($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrivateKeyPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrivateKeyPath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get privateKeyPassword => $_getSZ(5);
  @$pb.TagNumber(6)
  set privateKeyPassword($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPrivateKeyPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrivateKeyPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enableMetrics => $_getBF(6);
  @$pb.TagNumber(7)
  set enableMetrics($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEnableMetrics() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnableMetrics() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get enableLogs => $_getBF(7);
  @$pb.TagNumber(8)
  set enableLogs($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEnableLogs() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnableLogs() => clearField(8);
}

class MHttpHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MHttpHeader', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values')
    ..hasRequiredFields = false
  ;

  MHttpHeader._() : super();
  factory MHttpHeader({
    $core.Iterable<$core.String> values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory MHttpHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MHttpHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MHttpHeader clone() => MHttpHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MHttpHeader copyWith(void Function(MHttpHeader) updates) => super.copyWith((message) => updates(message as MHttpHeader)) as MHttpHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MHttpHeader create() => MHttpHeader._();
  MHttpHeader createEmptyInstance() => create();
  static $pb.PbList<MHttpHeader> createRepeated() => $pb.PbList<MHttpHeader>();
  @$core.pragma('dart2js:noInline')
  static MHttpHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MHttpHeader>(create);
  static MHttpHeader _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get values => $_getList(0);
}

class MHttpHeaders extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MHttpHeaders', createEmptyInstance: create)
    ..aOM<$1.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expires', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ifModifiedSince', protoName: 'ifModifiedSince', subBuilder: $1.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', protoName: 'contentType')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentLength', $pb.PbFieldType.O3, protoName: 'contentLength')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'persistentConnection', protoName: 'persistentConnection')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunkedTransferEncoding', protoName: 'chunkedTransferEncoding')
    ..m<$core.String, MHttpHeader>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', entryClassName: 'MHttpHeaders.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: MHttpHeader.create)
    ..hasRequiredFields = false
  ;

  MHttpHeaders._() : super();
  factory MHttpHeaders({
    $1.Timestamp date,
    $1.Timestamp expires,
    $1.Timestamp ifModifiedSince,
    $core.String host,
    $core.int port,
    $core.String contentType,
    $core.int contentLength,
    $core.bool persistentConnection,
    $core.bool chunkedTransferEncoding,
    $core.Map<$core.String, MHttpHeader> headers,
  }) {
    final _result = create();
    if (date != null) {
      _result.date = date;
    }
    if (expires != null) {
      _result.expires = expires;
    }
    if (ifModifiedSince != null) {
      _result.ifModifiedSince = ifModifiedSince;
    }
    if (host != null) {
      _result.host = host;
    }
    if (port != null) {
      _result.port = port;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (contentLength != null) {
      _result.contentLength = contentLength;
    }
    if (persistentConnection != null) {
      _result.persistentConnection = persistentConnection;
    }
    if (chunkedTransferEncoding != null) {
      _result.chunkedTransferEncoding = chunkedTransferEncoding;
    }
    if (headers != null) {
      _result.headers.addAll(headers);
    }
    return _result;
  }
  factory MHttpHeaders.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MHttpHeaders.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MHttpHeaders clone() => MHttpHeaders()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MHttpHeaders copyWith(void Function(MHttpHeaders) updates) => super.copyWith((message) => updates(message as MHttpHeaders)) as MHttpHeaders; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MHttpHeaders create() => MHttpHeaders._();
  MHttpHeaders createEmptyInstance() => create();
  static $pb.PbList<MHttpHeaders> createRepeated() => $pb.PbList<MHttpHeaders>();
  @$core.pragma('dart2js:noInline')
  static MHttpHeaders getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MHttpHeaders>(create);
  static MHttpHeaders _defaultInstance;

  @$pb.TagNumber(1)
  $1.Timestamp get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($1.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $1.Timestamp ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Timestamp get expires => $_getN(1);
  @$pb.TagNumber(2)
  set expires($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpires() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpires() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureExpires() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Timestamp get ifModifiedSince => $_getN(2);
  @$pb.TagNumber(3)
  set ifModifiedSince($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIfModifiedSince() => $_has(2);
  @$pb.TagNumber(3)
  void clearIfModifiedSince() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureIfModifiedSince() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get host => $_getSZ(3);
  @$pb.TagNumber(4)
  set host($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHost() => $_has(3);
  @$pb.TagNumber(4)
  void clearHost() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get port => $_getIZ(4);
  @$pb.TagNumber(5)
  set port($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPort() => $_has(4);
  @$pb.TagNumber(5)
  void clearPort() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get contentType => $_getSZ(5);
  @$pb.TagNumber(6)
  set contentType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get contentLength => $_getIZ(6);
  @$pb.TagNumber(7)
  set contentLength($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContentLength() => $_has(6);
  @$pb.TagNumber(7)
  void clearContentLength() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get persistentConnection => $_getBF(7);
  @$pb.TagNumber(8)
  set persistentConnection($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPersistentConnection() => $_has(7);
  @$pb.TagNumber(8)
  void clearPersistentConnection() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get chunkedTransferEncoding => $_getBF(8);
  @$pb.TagNumber(9)
  set chunkedTransferEncoding($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasChunkedTransferEncoding() => $_has(8);
  @$pb.TagNumber(9)
  void clearChunkedTransferEncoding() => clearField(9);

  @$pb.TagNumber(10)
  $core.Map<$core.String, MHttpHeader> get headers => $_getMap(9);
}

class MCookie extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MCookie', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOM<$1.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expires', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxAge', $pb.PbFieldType.O3, protoName: 'maxAge')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'domain')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secure')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'httpOnly', protoName: 'httpOnly')
    ..hasRequiredFields = false
  ;

  MCookie._() : super();
  factory MCookie({
    $core.String name,
    $core.String value,
    $1.Timestamp expires,
    $core.int maxAge,
    $core.String domain,
    $core.String path,
    $core.bool secure,
    $core.bool httpOnly,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    if (expires != null) {
      _result.expires = expires;
    }
    if (maxAge != null) {
      _result.maxAge = maxAge;
    }
    if (domain != null) {
      _result.domain = domain;
    }
    if (path != null) {
      _result.path = path;
    }
    if (secure != null) {
      _result.secure = secure;
    }
    if (httpOnly != null) {
      _result.httpOnly = httpOnly;
    }
    return _result;
  }
  factory MCookie.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MCookie.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MCookie clone() => MCookie()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MCookie copyWith(void Function(MCookie) updates) => super.copyWith((message) => updates(message as MCookie)) as MCookie; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MCookie create() => MCookie._();
  MCookie createEmptyInstance() => create();
  static $pb.PbList<MCookie> createRepeated() => $pb.PbList<MCookie>();
  @$core.pragma('dart2js:noInline')
  static MCookie getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MCookie>(create);
  static MCookie _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get expires => $_getN(2);
  @$pb.TagNumber(3)
  set expires($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpires() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpires() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureExpires() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get maxAge => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxAge($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get domain => $_getSZ(4);
  @$pb.TagNumber(5)
  set domain($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDomain() => $_has(4);
  @$pb.TagNumber(5)
  void clearDomain() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get path => $_getSZ(5);
  @$pb.TagNumber(6)
  set path($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearPath() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get secure => $_getBF(6);
  @$pb.TagNumber(7)
  set secure($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSecure() => $_has(6);
  @$pb.TagNumber(7)
  void clearSecure() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get httpOnly => $_getBF(7);
  @$pb.TagNumber(8)
  set httpOnly($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHttpOnly() => $_has(7);
  @$pb.TagNumber(8)
  void clearHttpOnly() => clearField(8);
}

class MHttpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MHttpRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentLength', $pb.PbFieldType.O3, protoName: 'contentLength')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'method')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uri')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestedUri', protoName: 'requestedUri')
    ..aOM<MHttpHeaders>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', subBuilder: MHttpHeaders.create)
    ..pc<MCookie>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies', $pb.PbFieldType.PM, subBuilder: MCookie.create)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'persistentConnection', protoName: 'persistentConnection')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protocolVersion', protoName: 'protocolVersion')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteAddress', protoName: 'remoteAddress')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remotePort', $pb.PbFieldType.O3, protoName: 'remotePort')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'localPort', $pb.PbFieldType.O3, protoName: 'localPort')
    ..hasRequiredFields = false
  ;

  MHttpRequest._() : super();
  factory MHttpRequest({
    $core.int contentLength,
    $core.String method,
    $core.String uri,
    $core.String requestedUri,
    MHttpHeaders headers,
    $core.Iterable<MCookie> cookies,
    $core.bool persistentConnection,
    $core.String protocolVersion,
    $core.String remoteAddress,
    $core.int remotePort,
    $core.int localPort,
  }) {
    final _result = create();
    if (contentLength != null) {
      _result.contentLength = contentLength;
    }
    if (method != null) {
      _result.method = method;
    }
    if (uri != null) {
      _result.uri = uri;
    }
    if (requestedUri != null) {
      _result.requestedUri = requestedUri;
    }
    if (headers != null) {
      _result.headers = headers;
    }
    if (cookies != null) {
      _result.cookies.addAll(cookies);
    }
    if (persistentConnection != null) {
      _result.persistentConnection = persistentConnection;
    }
    if (protocolVersion != null) {
      _result.protocolVersion = protocolVersion;
    }
    if (remoteAddress != null) {
      _result.remoteAddress = remoteAddress;
    }
    if (remotePort != null) {
      _result.remotePort = remotePort;
    }
    if (localPort != null) {
      _result.localPort = localPort;
    }
    return _result;
  }
  factory MHttpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MHttpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MHttpRequest clone() => MHttpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MHttpRequest copyWith(void Function(MHttpRequest) updates) => super.copyWith((message) => updates(message as MHttpRequest)) as MHttpRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MHttpRequest create() => MHttpRequest._();
  MHttpRequest createEmptyInstance() => create();
  static $pb.PbList<MHttpRequest> createRepeated() => $pb.PbList<MHttpRequest>();
  @$core.pragma('dart2js:noInline')
  static MHttpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MHttpRequest>(create);
  static MHttpRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get contentLength => $_getIZ(0);
  @$pb.TagNumber(1)
  set contentLength($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContentLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentLength() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get method => $_getSZ(1);
  @$pb.TagNumber(2)
  set method($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMethod() => $_has(1);
  @$pb.TagNumber(2)
  void clearMethod() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uri => $_getSZ(2);
  @$pb.TagNumber(3)
  set uri($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearUri() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get requestedUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestedUri($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequestedUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestedUri() => clearField(4);

  @$pb.TagNumber(5)
  MHttpHeaders get headers => $_getN(4);
  @$pb.TagNumber(5)
  set headers(MHttpHeaders v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeaders() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeaders() => clearField(5);
  @$pb.TagNumber(5)
  MHttpHeaders ensureHeaders() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<MCookie> get cookies => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get persistentConnection => $_getBF(6);
  @$pb.TagNumber(7)
  set persistentConnection($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPersistentConnection() => $_has(6);
  @$pb.TagNumber(7)
  void clearPersistentConnection() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get protocolVersion => $_getSZ(7);
  @$pb.TagNumber(8)
  set protocolVersion($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasProtocolVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearProtocolVersion() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get remoteAddress => $_getSZ(8);
  @$pb.TagNumber(9)
  set remoteAddress($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRemoteAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearRemoteAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get remotePort => $_getIZ(9);
  @$pb.TagNumber(10)
  set remotePort($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRemotePort() => $_has(9);
  @$pb.TagNumber(10)
  void clearRemotePort() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get localPort => $_getIZ(10);
  @$pb.TagNumber(11)
  set localPort($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLocalPort() => $_has(10);
  @$pb.TagNumber(11)
  void clearLocalPort() => clearField(11);
}

class MHttpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MHttpResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentLength', $pb.PbFieldType.O3, protoName: 'contentLength')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reasonPhrase', protoName: 'reasonPhrase')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'persistentConnection', protoName: 'persistentConnection')
    ..aOM<$2.Duration>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deadline', subBuilder: $2.Duration.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bufferOutput', protoName: 'bufferOutput')
    ..aOM<MHttpHeaders>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', subBuilder: MHttpHeaders.create)
    ..pc<MCookie>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies', $pb.PbFieldType.PM, subBuilder: MCookie.create)
    ..hasRequiredFields = false
  ;

  MHttpResponse._() : super();
  factory MHttpResponse({
    $core.int contentLength,
    $core.int statusCode,
    $core.String reasonPhrase,
    $core.bool persistentConnection,
    $2.Duration deadline,
    $core.bool bufferOutput,
    MHttpHeaders headers,
    $core.Iterable<MCookie> cookies,
  }) {
    final _result = create();
    if (contentLength != null) {
      _result.contentLength = contentLength;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    if (reasonPhrase != null) {
      _result.reasonPhrase = reasonPhrase;
    }
    if (persistentConnection != null) {
      _result.persistentConnection = persistentConnection;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    if (bufferOutput != null) {
      _result.bufferOutput = bufferOutput;
    }
    if (headers != null) {
      _result.headers = headers;
    }
    if (cookies != null) {
      _result.cookies.addAll(cookies);
    }
    return _result;
  }
  factory MHttpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MHttpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MHttpResponse clone() => MHttpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MHttpResponse copyWith(void Function(MHttpResponse) updates) => super.copyWith((message) => updates(message as MHttpResponse)) as MHttpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MHttpResponse create() => MHttpResponse._();
  MHttpResponse createEmptyInstance() => create();
  static $pb.PbList<MHttpResponse> createRepeated() => $pb.PbList<MHttpResponse>();
  @$core.pragma('dart2js:noInline')
  static MHttpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MHttpResponse>(create);
  static MHttpResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get contentLength => $_getIZ(0);
  @$pb.TagNumber(1)
  set contentLength($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContentLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentLength() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reasonPhrase => $_getSZ(2);
  @$pb.TagNumber(3)
  set reasonPhrase($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReasonPhrase() => $_has(2);
  @$pb.TagNumber(3)
  void clearReasonPhrase() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get persistentConnection => $_getBF(3);
  @$pb.TagNumber(4)
  set persistentConnection($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPersistentConnection() => $_has(3);
  @$pb.TagNumber(4)
  void clearPersistentConnection() => clearField(4);

  @$pb.TagNumber(5)
  $2.Duration get deadline => $_getN(4);
  @$pb.TagNumber(5)
  set deadline($2.Duration v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeadline() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeadline() => clearField(5);
  @$pb.TagNumber(5)
  $2.Duration ensureDeadline() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get bufferOutput => $_getBF(5);
  @$pb.TagNumber(6)
  set bufferOutput($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBufferOutput() => $_has(5);
  @$pb.TagNumber(6)
  void clearBufferOutput() => clearField(6);

  @$pb.TagNumber(7)
  MHttpHeaders get headers => $_getN(6);
  @$pb.TagNumber(7)
  set headers(MHttpHeaders v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasHeaders() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeaders() => clearField(7);
  @$pb.TagNumber(7)
  MHttpHeaders ensureHeaders() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<MCookie> get cookies => $_getList(7);
}

