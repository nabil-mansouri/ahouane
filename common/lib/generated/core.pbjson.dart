///
//  Generated code. Do not modify.
//  source: core.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use clientApplicationConfigDescriptor instead')
const ClientApplicationConfig$json = const {
  '1': 'ClientApplicationConfig',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'secure', '3': 3, '4': 1, '5': 8, '10': 'secure'},
    const {'1': 'adminApiKey', '3': 4, '4': 1, '5': 9, '10': 'adminApiKey'},
  ],
};

/// Descriptor for `ClientApplicationConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientApplicationConfigDescriptor = $convert.base64Decode('ChdDbGllbnRBcHBsaWNhdGlvbkNvbmZpZxISCgRob3N0GAEgASgJUgRob3N0EhIKBHBvcnQYAiABKAVSBHBvcnQSFgoGc2VjdXJlGAMgASgIUgZzZWN1cmUSIAoLYWRtaW5BcGlLZXkYBCABKAlSC2FkbWluQXBpS2V5');
@$core.Deprecated('Use channelInterceptorConfigDescriptor instead')
const ChannelInterceptorConfig$json = const {
  '1': 'ChannelInterceptorConfig',
  '2': const [
    const {'1': 'priority', '3': 1, '4': 1, '5': 5, '10': 'priority'},
    const {'1': 'types', '3': 2, '4': 3, '5': 14, '6': '.InterceptorType', '10': 'types'},
  ],
};

/// Descriptor for `ChannelInterceptorConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelInterceptorConfigDescriptor = $convert.base64Decode('ChhDaGFubmVsSW50ZXJjZXB0b3JDb25maWcSGgoIcHJpb3JpdHkYASABKAVSCHByaW9yaXR5EiYKBXR5cGVzGAIgAygOMhAuSW50ZXJjZXB0b3JUeXBlUgV0eXBlcw==');
@$core.Deprecated('Use channelServiceConfigDescriptor instead')
const ChannelServiceConfig$json = const {
  '1': 'ChannelServiceConfig',
  '2': const [
    const {'1': 'priority', '3': 1, '4': 1, '5': 5, '10': 'priority'},
    const {'1': 'sequential', '3': 2, '4': 1, '5': 8, '10': 'sequential'},
  ],
};

/// Descriptor for `ChannelServiceConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelServiceConfigDescriptor = $convert.base64Decode('ChRDaGFubmVsU2VydmljZUNvbmZpZxIaCghwcmlvcml0eRgBIAEoBVIIcHJpb3JpdHkSHgoKc2VxdWVudGlhbBgCIAEoCFIKc2VxdWVudGlhbA==');
@$core.Deprecated('Use metricDescriptor instead')
const Metric$json = const {
  '1': 'Metric',
  '2': const [
    const {'1': 'when', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'when'},
    const {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.Metric.ValuesEntry', '10': 'values'},
    const {'1': 'dimensions', '3': 3, '4': 3, '5': 9, '10': 'dimensions'},
  ],
  '3': const [Metric_ValuesEntry$json],
};

@$core.Deprecated('Use metricDescriptor instead')
const Metric_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 2, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Metric`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metricDescriptor = $convert.base64Decode('CgZNZXRyaWMSLgoEd2hlbhgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHdoZW4SKwoGdmFsdWVzGAIgAygLMhMuTWV0cmljLlZhbHVlc0VudHJ5UgZ2YWx1ZXMSHgoKZGltZW5zaW9ucxgDIAMoCVIKZGltZW5zaW9ucxo5CgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoAlIFdmFsdWU6AjgB');
@$core.Deprecated('Use metricResponseDescriptor instead')
const MetricResponse$json = const {
  '1': 'MetricResponse',
};

/// Descriptor for `MetricResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metricResponseDescriptor = $convert.base64Decode('Cg5NZXRyaWNSZXNwb25zZQ==');
@$core.Deprecated('Use multiTenantConfigDescriptor instead')
const MultiTenantConfig$json = const {
  '1': 'MultiTenantConfig',
  '2': const [
    const {'1': 'all', '3': 1, '4': 3, '5': 11, '6': '.MultiTenantConfig.AllEntry', '10': 'all'},
  ],
  '3': const [MultiTenantConfig_AllEntry$json],
};

@$core.Deprecated('Use multiTenantConfigDescriptor instead')
const MultiTenantConfig_AllEntry$json = const {
  '1': 'AllEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.TenantConfig', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `MultiTenantConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiTenantConfigDescriptor = $convert.base64Decode('ChFNdWx0aVRlbmFudENvbmZpZxItCgNhbGwYASADKAsyGy5NdWx0aVRlbmFudENvbmZpZy5BbGxFbnRyeVIDYWxsGkUKCEFsbEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiMKBXZhbHVlGAIgASgLMg0uVGVuYW50Q29uZmlnUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use tenantConfigDescriptor instead')
const TenantConfig$json = const {
  '1': 'TenantConfig',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'vhost', '3': 2, '4': 1, '5': 9, '10': 'vhost'},
    const {'1': 'defaut', '3': 3, '4': 1, '5': 8, '10': 'defaut'},
  ],
};

/// Descriptor for `TenantConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tenantConfigDescriptor = $convert.base64Decode('CgxUZW5hbnRDb25maWcSDgoCaWQYASABKAlSAmlkEhQKBXZob3N0GAIgASgJUgV2aG9zdBIWCgZkZWZhdXQYAyABKAhSBmRlZmF1dA==');
