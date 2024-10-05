///
//  Generated code. Do not modify.
//  source: microservice.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use interceptorTypeDescriptor instead')
const InterceptorType$json = const {
  '1': 'InterceptorType',
  '2': const [
    const {'1': 'Empty', '2': 0},
    const {'1': 'Before', '2': 1},
    const {'1': 'After', '2': 2},
    const {'1': 'Error', '2': 3},
  ],
};

/// Descriptor for `InterceptorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List interceptorTypeDescriptor = $convert.base64Decode('Cg9JbnRlcmNlcHRvclR5cGUSCQoFRW1wdHkQABIKCgZCZWZvcmUQARIJCgVBZnRlchACEgkKBUVycm9yEAM=');
@$core.Deprecated('Use messageSessionDescriptor instead')
const MessageSession$json = const {
  '1': 'MessageSession',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'createdAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'expireAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expireAt'},
    const {'1': 'custom', '3': 7, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'custom'},
    const {'1': 'dirty', '3': 8, '4': 1, '5': 8, '10': 'dirty'},
    const {'1': 'lang', '3': 9, '4': 1, '5': 9, '10': 'lang'},
    const {'1': 'scopes', '3': 10, '4': 3, '5': 9, '10': 'scopes'},
    const {'1': 'roles', '3': 11, '4': 3, '5': 9, '10': 'roles'},
  ],
};

/// Descriptor for `MessageSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSessionDescriptor = $convert.base64Decode('Cg5NZXNzYWdlU2Vzc2lvbhIOCgJpZBgBIAEoCVICaWQSFgoGdXNlcklkGAIgASgJUgZ1c2VySWQSIAoLZGlzcGxheU5hbWUYAyABKAlSC2Rpc3BsYXlOYW1lEjgKCWNyZWF0ZWRBdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI4Cgl1cGRhdGVkQXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSNgoIZXhwaXJlQXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghleHBpcmVBdBIsCgZjdXN0b20YByADKAsyFC5nb29nbGUucHJvdG9idWYuQW55UgZjdXN0b20SFAoFZGlydHkYCCABKAhSBWRpcnR5EhIKBGxhbmcYCSABKAlSBGxhbmcSFgoGc2NvcGVzGAogAygJUgZzY29wZXMSFAoFcm9sZXMYCyADKAlSBXJvbGVz');
@$core.Deprecated('Use messageHeaderDescriptor instead')
const MessageHeader$json = const {
  '1': 'MessageHeader',
  '2': const [
    const {'1': 'correlationId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'correlationId'},
    const {'1': 'route', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'route'},
    const {'1': 'session', '3': 3, '4': 1, '5': 11, '6': '.MessageSession', '10': 'session'},
    const {'1': 'contentType', '3': 4, '4': 1, '5': 9, '10': 'contentType'},
    const {'1': 'attributes', '3': 5, '4': 3, '5': 11, '6': '.MessageHeader.AttributesEntry', '10': 'attributes'},
    const {'1': 'authorization', '3': 7, '4': 1, '5': 9, '10': 'authorization'},
    const {'1': 'custom', '3': 10, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'custom'},
  ],
  '3': const [MessageHeader_AttributesEntry$json],
  '8': const [
    const {'1': 'routeoneof'},
  ],
};

@$core.Deprecated('Use messageHeaderDescriptor instead')
const MessageHeader_AttributesEntry$json = const {
  '1': 'AttributesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `MessageHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageHeaderDescriptor = $convert.base64Decode('Cg1NZXNzYWdlSGVhZGVyEiYKDWNvcnJlbGF0aW9uSWQYASABKAlIAFINY29ycmVsYXRpb25JZBIWCgVyb3V0ZRgCIAEoCUgAUgVyb3V0ZRIpCgdzZXNzaW9uGAMgASgLMg8uTWVzc2FnZVNlc3Npb25SB3Nlc3Npb24SIAoLY29udGVudFR5cGUYBCABKAlSC2NvbnRlbnRUeXBlEj4KCmF0dHJpYnV0ZXMYBSADKAsyHi5NZXNzYWdlSGVhZGVyLkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxIkCg1hdXRob3JpemF0aW9uGAcgASgJUg1hdXRob3JpemF0aW9uEiwKBmN1c3RvbRgKIAMoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSBmN1c3RvbRo9Cg9BdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUIMCgpyb3V0ZW9uZW9m');
@$core.Deprecated('Use messageBodyDescriptor instead')
const MessageBody$json = const {
  '1': 'MessageBody',
  '2': const [
    const {'1': 'buffer', '3': 10, '4': 1, '5': 12, '9': 0, '10': 'buffer'},
    const {'1': 'object', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Any', '9': 0, '10': 'object'},
  ],
  '8': const [
    const {'1': 'oneof_body'},
  ],
};

/// Descriptor for `MessageBody`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBodyDescriptor = $convert.base64Decode('CgtNZXNzYWdlQm9keRIYCgZidWZmZXIYCiABKAxIAFIGYnVmZmVyEi4KBm9iamVjdBgLIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlIAFIGb2JqZWN0QgwKCm9uZW9mX2JvZHk=');
@$core.Deprecated('Use messageTrailerDescriptor instead')
const MessageTrailer$json = const {
  '1': 'MessageTrailer',
  '2': const [
    const {'1': 'groupLength', '3': 2, '4': 1, '5': 5, '10': 'groupLength'},
  ],
};

/// Descriptor for `MessageTrailer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageTrailerDescriptor = $convert.base64Decode('Cg5NZXNzYWdlVHJhaWxlchIgCgtncm91cExlbmd0aBgCIAEoBVILZ3JvdXBMZW5ndGg=');
@$core.Deprecated('Use messageErrorDescriptor instead')
const MessageError$json = const {
  '1': 'MessageError',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'details', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'details'},
  ],
};

/// Descriptor for `MessageError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageErrorDescriptor = $convert.base64Decode('CgxNZXNzYWdlRXJyb3ISEgoEY29kZRgBIAEoCVIEY29kZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SLgoHZGV0YWlscxgDIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSB2RldGFpbHM=');
@$core.Deprecated('Use messagePartDescriptor instead')
const MessagePart$json = const {
  '1': 'MessagePart',
  '2': const [
    const {'1': 'groupId', '3': 2, '4': 1, '5': 9, '10': 'groupId'},
    const {'1': 'numInGroup', '3': 3, '4': 1, '5': 5, '10': 'numInGroup'},
    const {'1': 'header', '3': 10, '4': 1, '5': 11, '6': '.MessageHeader', '9': 0, '10': 'header'},
    const {'1': 'body', '3': 11, '4': 1, '5': 11, '6': '.MessageBody', '9': 0, '10': 'body'},
    const {'1': 'error', '3': 12, '4': 1, '5': 11, '6': '.MessageError', '9': 0, '10': 'error'},
    const {'1': 'trailer', '3': 13, '4': 1, '5': 11, '6': '.MessageTrailer', '9': 0, '10': 'trailer'},
  ],
  '8': const [
    const {'1': 'oneof_part'},
  ],
};

/// Descriptor for `MessagePart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagePartDescriptor = $convert.base64Decode('CgtNZXNzYWdlUGFydBIYCgdncm91cElkGAIgASgJUgdncm91cElkEh4KCm51bUluR3JvdXAYAyABKAVSCm51bUluR3JvdXASKAoGaGVhZGVyGAogASgLMg4uTWVzc2FnZUhlYWRlckgAUgZoZWFkZXISIgoEYm9keRgLIAEoCzIMLk1lc3NhZ2VCb2R5SABSBGJvZHkSJQoFZXJyb3IYDCABKAsyDS5NZXNzYWdlRXJyb3JIAFIFZXJyb3ISKwoHdHJhaWxlchgNIAEoCzIPLk1lc3NhZ2VUcmFpbGVySABSB3RyYWlsZXJCDAoKb25lb2ZfcGFydA==');
