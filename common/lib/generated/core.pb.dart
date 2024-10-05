///
//  Generated code. Do not modify.
//  source: core.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

import 'microservice.pbenum.dart' as $2;

class ClientApplicationConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientApplicationConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'host')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secure')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adminApiKey', protoName: 'adminApiKey')
    ..hasRequiredFields = false
  ;

  ClientApplicationConfig._() : super();
  factory ClientApplicationConfig({
    $core.String host,
    $core.int port,
    $core.bool secure,
    $core.String adminApiKey,
  }) {
    final _result = create();
    if (host != null) {
      _result.host = host;
    }
    if (port != null) {
      _result.port = port;
    }
    if (secure != null) {
      _result.secure = secure;
    }
    if (adminApiKey != null) {
      _result.adminApiKey = adminApiKey;
    }
    return _result;
  }
  factory ClientApplicationConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientApplicationConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientApplicationConfig clone() => ClientApplicationConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientApplicationConfig copyWith(void Function(ClientApplicationConfig) updates) => super.copyWith((message) => updates(message as ClientApplicationConfig)) as ClientApplicationConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientApplicationConfig create() => ClientApplicationConfig._();
  ClientApplicationConfig createEmptyInstance() => create();
  static $pb.PbList<ClientApplicationConfig> createRepeated() => $pb.PbList<ClientApplicationConfig>();
  @$core.pragma('dart2js:noInline')
  static ClientApplicationConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientApplicationConfig>(create);
  static ClientApplicationConfig _defaultInstance;

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
  $core.bool get secure => $_getBF(2);
  @$pb.TagNumber(3)
  set secure($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecure() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecure() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get adminApiKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set adminApiKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAdminApiKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearAdminApiKey() => clearField(4);
}

class ChannelInterceptorConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChannelInterceptorConfig', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'priority', $pb.PbFieldType.O3)
    ..pc<$2.InterceptorType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'types', $pb.PbFieldType.PE, valueOf: $2.InterceptorType.valueOf, enumValues: $2.InterceptorType.values, defaultEnumValue: $2.InterceptorType.Empty)
    ..hasRequiredFields = false
  ;

  ChannelInterceptorConfig._() : super();
  factory ChannelInterceptorConfig({
    $core.int priority,
    $core.Iterable<$2.InterceptorType> types,
  }) {
    final _result = create();
    if (priority != null) {
      _result.priority = priority;
    }
    if (types != null) {
      _result.types.addAll(types);
    }
    return _result;
  }
  factory ChannelInterceptorConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelInterceptorConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelInterceptorConfig clone() => ChannelInterceptorConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelInterceptorConfig copyWith(void Function(ChannelInterceptorConfig) updates) => super.copyWith((message) => updates(message as ChannelInterceptorConfig)) as ChannelInterceptorConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelInterceptorConfig create() => ChannelInterceptorConfig._();
  ChannelInterceptorConfig createEmptyInstance() => create();
  static $pb.PbList<ChannelInterceptorConfig> createRepeated() => $pb.PbList<ChannelInterceptorConfig>();
  @$core.pragma('dart2js:noInline')
  static ChannelInterceptorConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelInterceptorConfig>(create);
  static ChannelInterceptorConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get priority => $_getIZ(0);
  @$pb.TagNumber(1)
  set priority($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPriority() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriority() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$2.InterceptorType> get types => $_getList(1);
}

class ChannelServiceConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChannelServiceConfig', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sequential')
    ..hasRequiredFields = false
  ;

  ChannelServiceConfig._() : super();
  factory ChannelServiceConfig({
    $core.int priority,
    $core.bool sequential,
  }) {
    final _result = create();
    if (priority != null) {
      _result.priority = priority;
    }
    if (sequential != null) {
      _result.sequential = sequential;
    }
    return _result;
  }
  factory ChannelServiceConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelServiceConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelServiceConfig clone() => ChannelServiceConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelServiceConfig copyWith(void Function(ChannelServiceConfig) updates) => super.copyWith((message) => updates(message as ChannelServiceConfig)) as ChannelServiceConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelServiceConfig create() => ChannelServiceConfig._();
  ChannelServiceConfig createEmptyInstance() => create();
  static $pb.PbList<ChannelServiceConfig> createRepeated() => $pb.PbList<ChannelServiceConfig>();
  @$core.pragma('dart2js:noInline')
  static ChannelServiceConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelServiceConfig>(create);
  static ChannelServiceConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get priority => $_getIZ(0);
  @$pb.TagNumber(1)
  set priority($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPriority() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriority() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get sequential => $_getBF(1);
  @$pb.TagNumber(2)
  set sequential($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSequential() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequential() => clearField(2);
}

class Metric extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Metric', createEmptyInstance: create)
    ..aOM<$1.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'when', subBuilder: $1.Timestamp.create)
    ..m<$core.String, $core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', entryClassName: 'Metric.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OF)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dimensions')
    ..hasRequiredFields = false
  ;

  Metric._() : super();
  factory Metric({
    $1.Timestamp when,
    $core.Map<$core.String, $core.double> values,
    $core.Iterable<$core.String> dimensions,
  }) {
    final _result = create();
    if (when != null) {
      _result.when = when;
    }
    if (values != null) {
      _result.values.addAll(values);
    }
    if (dimensions != null) {
      _result.dimensions.addAll(dimensions);
    }
    return _result;
  }
  factory Metric.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metric.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Metric clone() => Metric()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Metric copyWith(void Function(Metric) updates) => super.copyWith((message) => updates(message as Metric)) as Metric; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Metric create() => Metric._();
  Metric createEmptyInstance() => create();
  static $pb.PbList<Metric> createRepeated() => $pb.PbList<Metric>();
  @$core.pragma('dart2js:noInline')
  static Metric getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metric>(create);
  static Metric _defaultInstance;

  @$pb.TagNumber(1)
  $1.Timestamp get when => $_getN(0);
  @$pb.TagNumber(1)
  set when($1.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhen() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhen() => clearField(1);
  @$pb.TagNumber(1)
  $1.Timestamp ensureWhen() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.double> get values => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get dimensions => $_getList(2);
}

class MetricResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MetricResponse', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MetricResponse._() : super();
  factory MetricResponse() => create();
  factory MetricResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetricResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetricResponse clone() => MetricResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetricResponse copyWith(void Function(MetricResponse) updates) => super.copyWith((message) => updates(message as MetricResponse)) as MetricResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MetricResponse create() => MetricResponse._();
  MetricResponse createEmptyInstance() => create();
  static $pb.PbList<MetricResponse> createRepeated() => $pb.PbList<MetricResponse>();
  @$core.pragma('dart2js:noInline')
  static MetricResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricResponse>(create);
  static MetricResponse _defaultInstance;
}

class MultiTenantConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MultiTenantConfig', createEmptyInstance: create)
    ..m<$core.String, TenantConfig>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'all', entryClassName: 'MultiTenantConfig.AllEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: TenantConfig.create)
    ..hasRequiredFields = false
  ;

  MultiTenantConfig._() : super();
  factory MultiTenantConfig({
    $core.Map<$core.String, TenantConfig> all,
  }) {
    final _result = create();
    if (all != null) {
      _result.all.addAll(all);
    }
    return _result;
  }
  factory MultiTenantConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MultiTenantConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MultiTenantConfig clone() => MultiTenantConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MultiTenantConfig copyWith(void Function(MultiTenantConfig) updates) => super.copyWith((message) => updates(message as MultiTenantConfig)) as MultiTenantConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MultiTenantConfig create() => MultiTenantConfig._();
  MultiTenantConfig createEmptyInstance() => create();
  static $pb.PbList<MultiTenantConfig> createRepeated() => $pb.PbList<MultiTenantConfig>();
  @$core.pragma('dart2js:noInline')
  static MultiTenantConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MultiTenantConfig>(create);
  static MultiTenantConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, TenantConfig> get all => $_getMap(0);
}

class TenantConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TenantConfig', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vhost')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaut')
    ..hasRequiredFields = false
  ;

  TenantConfig._() : super();
  factory TenantConfig({
    $core.String id,
    $core.String vhost,
    $core.bool defaut,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (vhost != null) {
      _result.vhost = vhost;
    }
    if (defaut != null) {
      _result.defaut = defaut;
    }
    return _result;
  }
  factory TenantConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TenantConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TenantConfig clone() => TenantConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TenantConfig copyWith(void Function(TenantConfig) updates) => super.copyWith((message) => updates(message as TenantConfig)) as TenantConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TenantConfig create() => TenantConfig._();
  TenantConfig createEmptyInstance() => create();
  static $pb.PbList<TenantConfig> createRepeated() => $pb.PbList<TenantConfig>();
  @$core.pragma('dart2js:noInline')
  static TenantConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TenantConfig>(create);
  static TenantConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get vhost => $_getSZ(1);
  @$pb.TagNumber(2)
  set vhost($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVhost() => $_has(1);
  @$pb.TagNumber(2)
  void clearVhost() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get defaut => $_getBF(2);
  @$pb.TagNumber(3)
  set defaut($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDefaut() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaut() => clearField(3);
}

