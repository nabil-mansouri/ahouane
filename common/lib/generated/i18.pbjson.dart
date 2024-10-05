///
//  Generated code. Do not modify.
//  source: i18.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use i18ConfigDescriptor instead')
const I18Config$json = const {
  '1': 'I18Config',
  '2': const [
    const {'1': 'baseDirectory', '3': 1, '4': 1, '5': 9, '10': 'baseDirectory'},
    const {'1': 'defaultLang', '3': 2, '4': 1, '5': 9, '10': 'defaultLang'},
    const {'1': 'serviceConfig', '3': 8, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
  ],
};

/// Descriptor for `I18Config`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List i18ConfigDescriptor = $convert.base64Decode('CglJMThDb25maWcSJAoNYmFzZURpcmVjdG9yeRgBIAEoCVINYmFzZURpcmVjdG9yeRIgCgtkZWZhdWx0TGFuZxgCIAEoCVILZGVmYXVsdExhbmcSOwoNc2VydmljZUNvbmZpZxgIIAEoCzIVLkNoYW5uZWxTZXJ2aWNlQ29uZmlnUg1zZXJ2aWNlQ29uZmln');
@$core.Deprecated('Use i18KeysPayloadDescriptor instead')
const I18KeysPayload$json = const {
  '1': 'I18KeysPayload',
  '2': const [
    const {'1': 'forceLang', '3': 1, '4': 1, '5': 9, '10': 'forceLang'},
  ],
};

/// Descriptor for `I18KeysPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List i18KeysPayloadDescriptor = $convert.base64Decode('Cg5JMThLZXlzUGF5bG9hZBIcCglmb3JjZUxhbmcYASABKAlSCWZvcmNlTGFuZw==');
@$core.Deprecated('Use i18ValuesDescriptor instead')
const I18Values$json = const {
  '1': 'I18Values',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.I18Values.ValuesEntry', '10': 'values'},
    const {'1': 'lang', '3': 2, '4': 1, '5': 9, '10': 'lang'},
  ],
  '3': const [I18Values_ValuesEntry$json],
};

@$core.Deprecated('Use i18ValuesDescriptor instead')
const I18Values_ValuesEntry$json = const {
  '1': 'ValuesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `I18Values`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List i18ValuesDescriptor = $convert.base64Decode('CglJMThWYWx1ZXMSLgoGdmFsdWVzGAEgAygLMhYuSTE4VmFsdWVzLlZhbHVlc0VudHJ5UgZ2YWx1ZXMSEgoEbGFuZxgCIAEoCVIEbGFuZxo5CgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use i18KeyDescriptor instead')
const I18Key$json = const {
  '1': 'I18Key',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'variables', '3': 2, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'variables'},
    const {'1': 'forceLang', '3': 3, '4': 1, '5': 9, '10': 'forceLang'},
  ],
};

/// Descriptor for `I18Key`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List i18KeyDescriptor = $convert.base64Decode('CgZJMThLZXkSEAoDa2V5GAEgASgJUgNrZXkSLgoJdmFyaWFibGVzGAIgASgLMhAuSnNvbk9iamVjdFZhbHVlUgl2YXJpYWJsZXMSHAoJZm9yY2VMYW5nGAMgASgJUglmb3JjZUxhbmc=');
@$core.Deprecated('Use i18ValueDescriptor instead')
const I18Value$json = const {
  '1': 'I18Value',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'lang', '3': 2, '4': 1, '5': 9, '10': 'lang'},
  ],
};

/// Descriptor for `I18Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List i18ValueDescriptor = $convert.base64Decode('CghJMThWYWx1ZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWUSEgoEbGFuZxgCIAEoCVIEbGFuZw==');
