///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tokenConfigDescriptor instead')
const TokenConfig$json = const {
  '1': 'TokenConfig',
  '2': const [
    const {'1': 'ressource', '3': 1, '4': 1, '5': 9, '10': 'ressource'},
    const {'1': 'tokenLength', '3': 2, '4': 1, '5': 5, '10': 'tokenLength'},
  ],
};

/// Descriptor for `TokenConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenConfigDescriptor = $convert.base64Decode('CgtUb2tlbkNvbmZpZxIcCglyZXNzb3VyY2UYASABKAlSCXJlc3NvdXJjZRIgCgt0b2tlbkxlbmd0aBgCIAEoBVILdG9rZW5MZW5ndGg=');
@$core.Deprecated('Use tokenEmptyDescriptor instead')
const TokenEmpty$json = const {
  '1': 'TokenEmpty',
};

/// Descriptor for `TokenEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenEmptyDescriptor = $convert.base64Decode('CgpUb2tlbkVtcHR5');
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'tokenType', '3': 2, '4': 1, '5': 9, '10': 'tokenType'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'expireAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expireAt'},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode('CgVUb2tlbhIUCgV2YWx1ZRgBIAEoCVIFdmFsdWUSHAoJdG9rZW5UeXBlGAIgASgJUgl0b2tlblR5cGUSOAoJY3JlYXRlZEF0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjYKCGV4cGlyZUF0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIZXhwaXJlQXQ=');
@$core.Deprecated('Use tokenPayloadDescriptor instead')
const TokenPayload$json = const {
  '1': 'TokenPayload',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'tokenType', '3': 2, '4': 1, '5': 9, '10': 'tokenType'},
  ],
};

/// Descriptor for `TokenPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenPayloadDescriptor = $convert.base64Decode('CgxUb2tlblBheWxvYWQSFAoFdmFsdWUYASABKAlSBXZhbHVlEhwKCXRva2VuVHlwZRgCIAEoCVIJdG9rZW5UeXBl');
@$core.Deprecated('Use createTokenPayloadDescriptor instead')
const CreateTokenPayload$json = const {
  '1': 'CreateTokenPayload',
  '2': const [
    const {'1': 'tokenType', '3': 2, '4': 1, '5': 9, '10': 'tokenType'},
    const {'1': 'expireAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expireAt'},
  ],
};

/// Descriptor for `CreateTokenPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTokenPayloadDescriptor = $convert.base64Decode('ChJDcmVhdGVUb2tlblBheWxvYWQSHAoJdG9rZW5UeXBlGAIgASgJUgl0b2tlblR5cGUSNgoIZXhwaXJlQXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghleHBpcmVBdA==');
@$core.Deprecated('Use tokenValidationDescriptor instead')
const TokenValidation$json = const {
  '1': 'TokenValidation',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `TokenValidation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenValidationDescriptor = $convert.base64Decode('Cg9Ub2tlblZhbGlkYXRpb24SGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
