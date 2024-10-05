///
//  Generated code. Do not modify.
//  source: email.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emailConfigDescriptor instead')
const EmailConfig$json = const {
  '1': 'EmailConfig',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'login', '3': 3, '4': 1, '5': 9, '10': 'login'},
    const {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'secure', '3': 5, '4': 1, '5': 8, '10': 'secure'},
    const {'1': 'fromName', '3': 6, '4': 1, '5': 9, '10': 'fromName'},
    const {'1': 'fromAddress', '3': 7, '4': 1, '5': 9, '10': 'fromAddress'},
    const {'1': 'serviceConfig', '3': 8, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
    const {'1': 'enableLog', '3': 9, '4': 1, '5': 8, '10': 'enableLog'},
    const {'1': 'clientDomain', '3': 10, '4': 1, '5': 9, '10': 'clientDomain'},
  ],
};

/// Descriptor for `EmailConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailConfigDescriptor = $convert.base64Decode('CgtFbWFpbENvbmZpZxISCgRob3N0GAEgASgJUgRob3N0EhIKBHBvcnQYAiABKAVSBHBvcnQSFAoFbG9naW4YAyABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAQgASgJUghwYXNzd29yZBIWCgZzZWN1cmUYBSABKAhSBnNlY3VyZRIaCghmcm9tTmFtZRgGIAEoCVIIZnJvbU5hbWUSIAoLZnJvbUFkZHJlc3MYByABKAlSC2Zyb21BZGRyZXNzEjsKDXNlcnZpY2VDb25maWcYCCABKAsyFS5DaGFubmVsU2VydmljZUNvbmZpZ1INc2VydmljZUNvbmZpZxIcCgllbmFibGVMb2cYCSABKAhSCWVuYWJsZUxvZxIiCgxjbGllbnREb21haW4YCiABKAlSDGNsaWVudERvbWFpbg==');
@$core.Deprecated('Use emailStatusDescriptor instead')
const EmailStatus$json = const {
  '1': 'EmailStatus',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'details', '3': 2, '4': 1, '5': 9, '10': 'details'},
  ],
};

/// Descriptor for `EmailStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailStatusDescriptor = $convert.base64Decode('CgtFbWFpbFN0YXR1cxIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB2RldGFpbHMYAiABKAlSB2RldGFpbHM=');
@$core.Deprecated('Use emailPayloadDescriptor instead')
const EmailPayload$json = const {
  '1': 'EmailPayload',
  '2': const [
    const {'1': 'to', '3': 1, '4': 3, '5': 11, '6': '.EmailAddress', '10': 'to'},
    const {'1': 'cc', '3': 2, '4': 3, '5': 11, '6': '.EmailAddress', '10': 'cc'},
    const {'1': 'cci', '3': 3, '4': 3, '5': 11, '6': '.EmailAddress', '10': 'cci'},
    const {'1': 'from', '3': 4, '4': 1, '5': 11, '6': '.EmailAddress', '10': 'from'},
    const {'1': 'rawSubject', '3': 5, '4': 1, '5': 9, '10': 'rawSubject'},
    const {'1': 'rawText', '3': 6, '4': 1, '5': 9, '10': 'rawText'},
    const {'1': 'rawHtml', '3': 7, '4': 1, '5': 9, '10': 'rawHtml'},
    const {'1': 'attachments', '3': 8, '4': 3, '5': 11, '6': '.EmailAttachment', '10': 'attachments'},
    const {'1': 'dynamic', '3': 9, '4': 1, '5': 8, '10': 'dynamic'},
    const {'1': 'variables', '3': 10, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'variables'},
    const {'1': 'i18Subject', '3': 11, '4': 1, '5': 9, '10': 'i18Subject'},
    const {'1': 'i18Text', '3': 12, '4': 1, '5': 9, '10': 'i18Text'},
    const {'1': 'i18Html', '3': 13, '4': 1, '5': 9, '10': 'i18Html'},
  ],
};

/// Descriptor for `EmailPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailPayloadDescriptor = $convert.base64Decode('CgxFbWFpbFBheWxvYWQSHQoCdG8YASADKAsyDS5FbWFpbEFkZHJlc3NSAnRvEh0KAmNjGAIgAygLMg0uRW1haWxBZGRyZXNzUgJjYxIfCgNjY2kYAyADKAsyDS5FbWFpbEFkZHJlc3NSA2NjaRIhCgRmcm9tGAQgASgLMg0uRW1haWxBZGRyZXNzUgRmcm9tEh4KCnJhd1N1YmplY3QYBSABKAlSCnJhd1N1YmplY3QSGAoHcmF3VGV4dBgGIAEoCVIHcmF3VGV4dBIYCgdyYXdIdG1sGAcgASgJUgdyYXdIdG1sEjIKC2F0dGFjaG1lbnRzGAggAygLMhAuRW1haWxBdHRhY2htZW50UgthdHRhY2htZW50cxIYCgdkeW5hbWljGAkgASgIUgdkeW5hbWljEi4KCXZhcmlhYmxlcxgKIAEoCzIQLkpzb25PYmplY3RWYWx1ZVIJdmFyaWFibGVzEh4KCmkxOFN1YmplY3QYCyABKAlSCmkxOFN1YmplY3QSGAoHaTE4VGV4dBgMIAEoCVIHaTE4VGV4dBIYCgdpMThIdG1sGA0gASgJUgdpMThIdG1s');
@$core.Deprecated('Use emailAddressDescriptor instead')
const EmailAddress$json = const {
  '1': 'EmailAddress',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `EmailAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailAddressDescriptor = $convert.base64Decode('CgxFbWFpbEFkZHJlc3MSEgoEbmFtZRgBIAEoCVIEbmFtZRIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use emailAttachmentDescriptor instead')
const EmailAttachment$json = const {
  '1': 'EmailAttachment',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'contentType', '3': 2, '4': 1, '5': 9, '10': 'contentType'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `EmailAttachment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailAttachmentDescriptor = $convert.base64Decode('Cg9FbWFpbEF0dGFjaG1lbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtjb250ZW50VHlwZRgCIAEoCVILY29udGVudFR5cGUSEgoEZGF0YRgDIAEoDFIEZGF0YQ==');
