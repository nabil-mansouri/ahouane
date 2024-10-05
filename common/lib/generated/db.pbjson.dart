///
//  Generated code. Do not modify.
//  source: db.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryFilterComparatorDescriptor instead')
const QueryFilterComparator$json = const {
  '1': 'QueryFilterComparator',
  '2': const [
    const {'1': 'eq', '2': 0},
    const {'1': 'neq', '2': 1},
    const {'1': 'lt', '2': 2},
    const {'1': 'lte', '2': 3},
    const {'1': 'gt', '2': 4},
    const {'1': 'gte', '2': 5},
    const {'1': 'in', '2': 6},
    const {'1': 'nin', '2': 7},
    const {'1': 'contains', '2': 8},
    const {'1': 'startsWith', '2': 9},
    const {'1': 'endsWith', '2': 10},
    const {'1': 'exists', '2': 11},
  ],
};

/// Descriptor for `QueryFilterComparator`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List queryFilterComparatorDescriptor = $convert.base64Decode('ChVRdWVyeUZpbHRlckNvbXBhcmF0b3ISBgoCZXEQABIHCgNuZXEQARIGCgJsdBACEgcKA2x0ZRADEgYKAmd0EAQSBwoDZ3RlEAUSBgoCaW4QBhIHCgNuaW4QBxIMCghjb250YWlucxAIEg4KCnN0YXJ0c1dpdGgQCRIMCghlbmRzV2l0aBAKEgoKBmV4aXN0cxAL');
@$core.Deprecated('Use mongoDBConfigDescriptor instead')
const MongoDBConfig$json = const {
  '1': 'MongoDBConfig',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'db', '3': 3, '4': 1, '5': 9, '10': 'db'},
    const {'1': 'serviceConfig', '3': 4, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
    const {'1': 'username', '3': 5, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'publicResources', '3': 7, '4': 3, '5': 9, '10': 'publicResources'},
    const {'1': 'protectedResources', '3': 8, '4': 3, '5': 9, '10': 'protectedResources'},
    const {'1': 'privateResources', '3': 9, '4': 3, '5': 9, '10': 'privateResources'},
    const {'1': 'collectionPrefix', '3': 10, '4': 1, '5': 9, '10': 'collectionPrefix'},
  ],
};

/// Descriptor for `MongoDBConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mongoDBConfigDescriptor = $convert.base64Decode('Cg1Nb25nb0RCQ29uZmlnEhIKBGhvc3QYASABKAlSBGhvc3QSEgoEcG9ydBgCIAEoBVIEcG9ydBIOCgJkYhgDIAEoCVICZGISOwoNc2VydmljZUNvbmZpZxgEIAEoCzIVLkNoYW5uZWxTZXJ2aWNlQ29uZmlnUg1zZXJ2aWNlQ29uZmlnEhoKCHVzZXJuYW1lGAUgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcmQSKAoPcHVibGljUmVzb3VyY2VzGAcgAygJUg9wdWJsaWNSZXNvdXJjZXMSLgoScHJvdGVjdGVkUmVzb3VyY2VzGAggAygJUhJwcm90ZWN0ZWRSZXNvdXJjZXMSKgoQcHJpdmF0ZVJlc291cmNlcxgJIAMoCVIQcHJpdmF0ZVJlc291cmNlcxIqChBjb2xsZWN0aW9uUHJlZml4GAogASgJUhBjb2xsZWN0aW9uUHJlZml4');
@$core.Deprecated('Use dBSharePayloadDescriptor instead')
const DBSharePayload$json = const {
  '1': 'DBSharePayload',
  '2': const [
    const {'1': 'toAdd', '3': 1, '4': 3, '5': 11, '6': '.DBShareRow', '10': 'toAdd'},
    const {'1': 'toRemove', '3': 2, '4': 3, '5': 11, '6': '.DBShareRow', '10': 'toRemove'},
    const {'1': 'query', '3': 3, '4': 1, '5': 11, '6': '.Query', '10': 'query'},
  ],
};

/// Descriptor for `DBSharePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBSharePayloadDescriptor = $convert.base64Decode('Cg5EQlNoYXJlUGF5bG9hZBIhCgV0b0FkZBgBIAMoCzILLkRCU2hhcmVSb3dSBXRvQWRkEicKCHRvUmVtb3ZlGAIgAygLMgsuREJTaGFyZVJvd1IIdG9SZW1vdmUSHAoFcXVlcnkYAyABKAsyBi5RdWVyeVIFcXVlcnk=');
@$core.Deprecated('Use dBShareRowDescriptor instead')
const DBShareRow$json = const {
  '1': 'DBShareRow',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'user'},
    const {'1': 'role', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'role'},
    const {'1': 'public', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'public'},
    const {'1': 'authenticated', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'authenticated'},
    const {'1': 'read', '3': 5, '4': 1, '5': 8, '10': 'read'},
    const {'1': 'write', '3': 6, '4': 1, '5': 8, '10': 'write'},
    const {'1': 'manage', '3': 7, '4': 1, '5': 8, '10': 'manage'},
  ],
  '8': const [
    const {'1': 'share_oneof'},
  ],
};

/// Descriptor for `DBShareRow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBShareRowDescriptor = $convert.base64Decode('CgpEQlNoYXJlUm93EhQKBHVzZXIYASABKAlIAFIEdXNlchIUCgRyb2xlGAIgASgJSABSBHJvbGUSGAoGcHVibGljGAMgASgISABSBnB1YmxpYxImCg1hdXRoZW50aWNhdGVkGAQgASgISABSDWF1dGhlbnRpY2F0ZWQSEgoEcmVhZBgFIAEoCFIEcmVhZBIUCgV3cml0ZRgGIAEoCFIFd3JpdGUSFgoGbWFuYWdlGAcgASgIUgZtYW5hZ2VCDQoLc2hhcmVfb25lb2Y=');
@$core.Deprecated('Use countResultDescriptor instead')
const CountResult$json = const {
  '1': 'CountResult',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `CountResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countResultDescriptor = $convert.base64Decode('CgtDb3VudFJlc3VsdBIUCgVjb3VudBgBIAEoBVIFY291bnQ=');
@$core.Deprecated('Use fetchOneResponseDescriptor instead')
const FetchOneResponse$json = const {
  '1': 'FetchOneResponse',
  '2': const [
    const {'1': 'object', '3': 1, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'object'},
  ],
};

/// Descriptor for `FetchOneResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchOneResponseDescriptor = $convert.base64Decode('ChBGZXRjaE9uZVJlc3BvbnNlEigKBm9iamVjdBgBIAEoCzIQLkpzb25PYmplY3RWYWx1ZVIGb2JqZWN0');
@$core.Deprecated('Use createIndexPayloadDescriptor instead')
const CreateIndexPayload$json = const {
  '1': 'CreateIndexPayload',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'resource', '3': 2, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'unique', '3': 3, '4': 1, '5': 8, '10': 'unique'},
    const {'1': 'fields', '3': 4, '4': 3, '5': 11, '6': '.QuerySort', '10': 'fields'},
    const {'1': 'others', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'others'},
    const {'1': 'expireAfterSeconds', '3': 7, '4': 1, '5': 5, '10': 'expireAfterSeconds'},
  ],
};

/// Descriptor for `CreateIndexPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIndexPayloadDescriptor = $convert.base64Decode('ChJDcmVhdGVJbmRleFBheWxvYWQSEgoEbmFtZRgBIAEoCVIEbmFtZRIaCghyZXNvdXJjZRgCIAEoCVIIcmVzb3VyY2USFgoGdW5pcXVlGAMgASgIUgZ1bmlxdWUSIgoGZmllbGRzGAQgAygLMgouUXVlcnlTb3J0UgZmaWVsZHMSLAoGb3RoZXJzGAYgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIGb3RoZXJzEi4KEmV4cGlyZUFmdGVyU2Vjb25kcxgHIAEoBVISZXhwaXJlQWZ0ZXJTZWNvbmRz');
@$core.Deprecated('Use createIndexResultDescriptor instead')
const CreateIndexResult$json = const {
  '1': 'CreateIndexResult',
  '2': const [
    const {'1': 'nbIndex', '3': 1, '4': 1, '5': 5, '10': 'nbIndex'},
  ],
};

/// Descriptor for `CreateIndexResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIndexResultDescriptor = $convert.base64Decode('ChFDcmVhdGVJbmRleFJlc3VsdBIYCgduYkluZGV4GAEgASgFUgduYkluZGV4');
@$core.Deprecated('Use fetchPayloadDescriptor instead')
const FetchPayload$json = const {
  '1': 'FetchPayload',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 11, '6': '.Query', '10': 'query'},
  ],
};

/// Descriptor for `FetchPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPayloadDescriptor = $convert.base64Decode('CgxGZXRjaFBheWxvYWQSHAoFcXVlcnkYASABKAsyBi5RdWVyeVIFcXVlcnk=');
@$core.Deprecated('Use createPayloadDescriptor instead')
const CreatePayload$json = const {
  '1': 'CreatePayload',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'value'},
    const {'1': 'share', '3': 3, '4': 1, '5': 11, '6': '.DBSharePayload', '10': 'share'},
  ],
};

/// Descriptor for `CreatePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPayloadDescriptor = $convert.base64Decode('Cg1DcmVhdGVQYXlsb2FkEhoKCHJlc291cmNlGAEgASgJUghyZXNvdXJjZRImCgV2YWx1ZRgCIAEoCzIQLkpzb25PYmplY3RWYWx1ZVIFdmFsdWUSJQoFc2hhcmUYAyABKAsyDy5EQlNoYXJlUGF5bG9hZFIFc2hhcmU=');
@$core.Deprecated('Use createResultDescriptor instead')
const CreateResult$json = const {
  '1': 'CreateResult',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `CreateResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createResultDescriptor = $convert.base64Decode('CgxDcmVhdGVSZXN1bHQSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use patchPayloadDescriptor instead')
const PatchPayload$json = const {
  '1': 'PatchPayload',
  '2': const [
    const {'1': 'upsert', '3': 1, '4': 1, '5': 8, '10': 'upsert'},
    const {'1': 'query', '3': 2, '4': 1, '5': 11, '6': '.Query', '10': 'query'},
    const {'1': 'operation', '3': 4, '4': 3, '5': 11, '6': '.DBPatchOperation', '10': 'operation'},
    const {'1': 'multiple', '3': 5, '4': 1, '5': 8, '10': 'multiple'},
  ],
};

/// Descriptor for `PatchPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patchPayloadDescriptor = $convert.base64Decode('CgxQYXRjaFBheWxvYWQSFgoGdXBzZXJ0GAEgASgIUgZ1cHNlcnQSHAoFcXVlcnkYAiABKAsyBi5RdWVyeVIFcXVlcnkSLwoJb3BlcmF0aW9uGAQgAygLMhEuREJQYXRjaE9wZXJhdGlvblIJb3BlcmF0aW9uEhoKCG11bHRpcGxlGAUgASgIUghtdWx0aXBsZQ==');
@$core.Deprecated('Use patchResultDescriptor instead')
const PatchResult$json = const {
  '1': 'PatchResult',
  '2': const [
    const {'1': 'nbModified', '3': 1, '4': 1, '5': 5, '10': 'nbModified'},
  ],
};

/// Descriptor for `PatchResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patchResultDescriptor = $convert.base64Decode('CgtQYXRjaFJlc3VsdBIeCgpuYk1vZGlmaWVkGAEgASgFUgpuYk1vZGlmaWVk');
@$core.Deprecated('Use updatePayloadDescriptor instead')
const UpdatePayload$json = const {
  '1': 'UpdatePayload',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 11, '6': '.Query', '10': 'query'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'value'},
    const {'1': 'upsert', '3': 3, '4': 1, '5': 8, '10': 'upsert'},
    const {'1': 'share', '3': 4, '4': 1, '5': 11, '6': '.DBSharePayload', '10': 'share'},
    const {'1': 'multiple', '3': 5, '4': 1, '5': 8, '10': 'multiple'},
  ],
};

/// Descriptor for `UpdatePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePayloadDescriptor = $convert.base64Decode('Cg1VcGRhdGVQYXlsb2FkEhwKBXF1ZXJ5GAEgASgLMgYuUXVlcnlSBXF1ZXJ5EiYKBXZhbHVlGAIgASgLMhAuSnNvbk9iamVjdFZhbHVlUgV2YWx1ZRIWCgZ1cHNlcnQYAyABKAhSBnVwc2VydBIlCgVzaGFyZRgEIAEoCzIPLkRCU2hhcmVQYXlsb2FkUgVzaGFyZRIaCghtdWx0aXBsZRgFIAEoCFIIbXVsdGlwbGU=');
@$core.Deprecated('Use updateResultDescriptor instead')
const UpdateResult$json = const {
  '1': 'UpdateResult',
  '2': const [
    const {'1': 'nbModified', '3': 1, '4': 1, '5': 5, '10': 'nbModified'},
  ],
};

/// Descriptor for `UpdateResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateResultDescriptor = $convert.base64Decode('CgxVcGRhdGVSZXN1bHQSHgoKbmJNb2RpZmllZBgBIAEoBVIKbmJNb2RpZmllZA==');
@$core.Deprecated('Use deletePayloadDescriptor instead')
const DeletePayload$json = const {
  '1': 'DeletePayload',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 11, '6': '.Query', '10': 'query'},
    const {'1': 'multiple', '3': 2, '4': 1, '5': 8, '10': 'multiple'},
  ],
};

/// Descriptor for `DeletePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePayloadDescriptor = $convert.base64Decode('Cg1EZWxldGVQYXlsb2FkEhwKBXF1ZXJ5GAEgASgLMgYuUXVlcnlSBXF1ZXJ5EhoKCG11bHRpcGxlGAIgASgIUghtdWx0aXBsZQ==');
@$core.Deprecated('Use deleteResultDescriptor instead')
const DeleteResult$json = const {
  '1': 'DeleteResult',
  '2': const [
    const {'1': 'nbDeleted', '3': 1, '4': 1, '5': 5, '10': 'nbDeleted'},
  ],
};

/// Descriptor for `DeleteResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResultDescriptor = $convert.base64Decode('CgxEZWxldGVSZXN1bHQSHAoJbmJEZWxldGVkGAEgASgFUgluYkRlbGV0ZWQ=');
@$core.Deprecated('Use unknownStringValueDescriptor instead')
const UnknownStringValue$json = const {
  '1': 'UnknownStringValue',
  '2': const [
    const {'1': 'representation', '3': 1, '4': 1, '5': 9, '10': 'representation'},
  ],
};

/// Descriptor for `UnknownStringValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unknownStringValueDescriptor = $convert.base64Decode('ChJVbmtub3duU3RyaW5nVmFsdWUSJgoOcmVwcmVzZW50YXRpb24YASABKAlSDnJlcHJlc2VudGF0aW9u');
@$core.Deprecated('Use dBValueDescriptor instead')
const DBValue$json = const {
  '1': 'DBValue',
  '2': const [
    const {'1': 'regexValue', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'regexValue'},
    const {'1': 'objectId', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'objectId'},
    const {'1': 'dateValue', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'dateValue'},
    const {'1': 'bufferValue', '3': 4, '4': 1, '5': 12, '9': 0, '10': 'bufferValue'},
    const {'1': 'unknown', '3': 5, '4': 1, '5': 11, '6': '.UnknownStringValue', '9': 0, '10': 'unknown'},
  ],
  '8': const [
    const {'1': 'dbvalue_oneof'},
  ],
};

/// Descriptor for `DBValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBValueDescriptor = $convert.base64Decode('CgdEQlZhbHVlEiAKCnJlZ2V4VmFsdWUYASABKAlIAFIKcmVnZXhWYWx1ZRIcCghvYmplY3RJZBgCIAEoCUgAUghvYmplY3RJZBI6CglkYXRlVmFsdWUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSCWRhdGVWYWx1ZRIiCgtidWZmZXJWYWx1ZRgEIAEoDEgAUgtidWZmZXJWYWx1ZRIvCgd1bmtub3duGAUgASgLMhMuVW5rbm93blN0cmluZ1ZhbHVlSABSB3Vua25vd25CDwoNZGJ2YWx1ZV9vbmVvZg==');
@$core.Deprecated('Use dBLinkOperationDescriptor instead')
const DBLinkOperation$json = const {
  '1': 'DBLinkOperation',
  '2': const [
    const {'1': 'foreignId', '3': 3, '4': 3, '5': 9, '10': 'foreignId'},
    const {'1': 'foreignField', '3': 4, '4': 1, '5': 11, '6': '.DBForeignField', '10': 'foreignField'},
    const {'1': 'link', '3': 5, '4': 1, '5': 8, '10': 'link'},
  ],
};

/// Descriptor for `DBLinkOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBLinkOperationDescriptor = $convert.base64Decode('Cg9EQkxpbmtPcGVyYXRpb24SHAoJZm9yZWlnbklkGAMgAygJUglmb3JlaWduSWQSMwoMZm9yZWlnbkZpZWxkGAQgASgLMg8uREJGb3JlaWduRmllbGRSDGZvcmVpZ25GaWVsZBISCgRsaW5rGAUgASgIUgRsaW5r');
@$core.Deprecated('Use dBPatchListOperationDescriptor instead')
const DBPatchListOperation$json = const {
  '1': 'DBPatchListOperation',
  '2': const [
    const {'1': 'add', '3': 1, '4': 1, '5': 8, '10': 'add'},
    const {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.JsonObjectValue', '10': 'values'},
    const {'1': 'fieldName', '3': 3, '4': 1, '5': 9, '10': 'fieldName'},
  ],
};

/// Descriptor for `DBPatchListOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBPatchListOperationDescriptor = $convert.base64Decode('ChREQlBhdGNoTGlzdE9wZXJhdGlvbhIQCgNhZGQYASABKAhSA2FkZBIoCgZ2YWx1ZXMYAiADKAsyEC5Kc29uT2JqZWN0VmFsdWVSBnZhbHVlcxIcCglmaWVsZE5hbWUYAyABKAlSCWZpZWxkTmFtZQ==');
@$core.Deprecated('Use dBPatchUpdateOperationDescriptor instead')
const DBPatchUpdateOperation$json = const {
  '1': 'DBPatchUpdateOperation',
  '2': const [
    const {'1': 'data', '3': 3, '4': 3, '5': 11, '6': '.DBPatchUpdateOperation.DataEntry', '10': 'data'},
  ],
  '3': const [DBPatchUpdateOperation_DataEntry$json],
};

@$core.Deprecated('Use dBPatchUpdateOperationDescriptor instead')
const DBPatchUpdateOperation_DataEntry$json = const {
  '1': 'DataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.JsonValue', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `DBPatchUpdateOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBPatchUpdateOperationDescriptor = $convert.base64Decode('ChZEQlBhdGNoVXBkYXRlT3BlcmF0aW9uEjUKBGRhdGEYAyADKAsyIS5EQlBhdGNoVXBkYXRlT3BlcmF0aW9uLkRhdGFFbnRyeVIEZGF0YRpDCglEYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSIAoFdmFsdWUYAiABKAsyCi5Kc29uVmFsdWVSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use dBPatchOperationDescriptor instead')
const DBPatchOperation$json = const {
  '1': 'DBPatchOperation',
  '2': const [
    const {'1': 'link', '3': 1, '4': 1, '5': 11, '6': '.DBLinkOperation', '9': 0, '10': 'link'},
    const {'1': 'listOpe', '3': 2, '4': 1, '5': 11, '6': '.DBPatchListOperation', '9': 0, '10': 'listOpe'},
    const {'1': 'updateOp', '3': 3, '4': 1, '5': 11, '6': '.DBPatchUpdateOperation', '9': 0, '10': 'updateOp'},
  ],
  '8': const [
    const {'1': 'pathope_oneof'},
  ],
};

/// Descriptor for `DBPatchOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBPatchOperationDescriptor = $convert.base64Decode('ChBEQlBhdGNoT3BlcmF0aW9uEiYKBGxpbmsYASABKAsyEC5EQkxpbmtPcGVyYXRpb25IAFIEbGluaxIxCgdsaXN0T3BlGAIgASgLMhUuREJQYXRjaExpc3RPcGVyYXRpb25IAFIHbGlzdE9wZRI1Cgh1cGRhdGVPcBgDIAEoCzIXLkRCUGF0Y2hVcGRhdGVPcGVyYXRpb25IAFIIdXBkYXRlT3BCDwoNcGF0aG9wZV9vbmVvZg==');
@$core.Deprecated('Use queryDescriptor instead')
const Query$json = const {
  '1': 'Query',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'projections', '3': 2, '4': 3, '5': 11, '6': '.QueryProjection', '10': 'projections'},
    const {'1': 'filters', '3': 3, '4': 3, '5': 11, '6': '.QueryFilter', '10': 'filters'},
    const {'1': 'sorts', '3': 4, '4': 3, '5': 11, '6': '.QuerySort', '10': 'sorts'},
    const {'1': 'joins', '3': 5, '4': 3, '5': 11, '6': '.QueryJoin', '10': 'joins'},
    const {'1': 'skip', '3': 6, '4': 1, '5': 5, '10': 'skip'},
    const {'1': 'limit', '3': 7, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `Query`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDescriptor = $convert.base64Decode('CgVRdWVyeRIaCghyZXNvdXJjZRgBIAEoCVIIcmVzb3VyY2USMgoLcHJvamVjdGlvbnMYAiADKAsyEC5RdWVyeVByb2plY3Rpb25SC3Byb2plY3Rpb25zEiYKB2ZpbHRlcnMYAyADKAsyDC5RdWVyeUZpbHRlclIHZmlsdGVycxIgCgVzb3J0cxgEIAMoCzIKLlF1ZXJ5U29ydFIFc29ydHMSIAoFam9pbnMYBSADKAsyCi5RdWVyeUpvaW5SBWpvaW5zEhIKBHNraXAYBiABKAVSBHNraXASFAoFbGltaXQYByABKAVSBWxpbWl0');
@$core.Deprecated('Use queryJoinDescriptor instead')
const QueryJoin$json = const {
  '1': 'QueryJoin',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'comparators', '3': 2, '4': 3, '5': 11, '6': '.QueryJoinCompare', '10': 'comparators'},
  ],
};

/// Descriptor for `QueryJoin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryJoinDescriptor = $convert.base64Decode('CglRdWVyeUpvaW4SGgoIcmVzb3VyY2UYASABKAlSCHJlc291cmNlEjMKC2NvbXBhcmF0b3JzGAIgAygLMhEuUXVlcnlKb2luQ29tcGFyZVILY29tcGFyYXRvcnM=');
@$core.Deprecated('Use queryJoinCompareDescriptor instead')
const QueryJoinCompare$json = const {
  '1': 'QueryJoinCompare',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'foreignResource', '3': 2, '4': 1, '5': 9, '10': 'foreignResource'},
    const {'1': 'foreignField', '3': 3, '4': 1, '5': 9, '10': 'foreignField'},
    const {'1': 'comparator', '3': 4, '4': 1, '5': 14, '6': '.QueryFilterComparator', '10': 'comparator'},
  ],
};

/// Descriptor for `QueryJoinCompare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryJoinCompareDescriptor = $convert.base64Decode('ChBRdWVyeUpvaW5Db21wYXJlEhwKCWZpZWxkTmFtZRgBIAEoCVIJZmllbGROYW1lEigKD2ZvcmVpZ25SZXNvdXJjZRgCIAEoCVIPZm9yZWlnblJlc291cmNlEiIKDGZvcmVpZ25GaWVsZBgDIAEoCVIMZm9yZWlnbkZpZWxkEjYKCmNvbXBhcmF0b3IYBCABKA4yFi5RdWVyeUZpbHRlckNvbXBhcmF0b3JSCmNvbXBhcmF0b3I=');
@$core.Deprecated('Use queryProjectionDescriptor instead')
const QueryProjection$json = const {
  '1': 'QueryProjection',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'alias', '3': 2, '4': 1, '5': 9, '10': 'alias'},
  ],
};

/// Descriptor for `QueryProjection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryProjectionDescriptor = $convert.base64Decode('Cg9RdWVyeVByb2plY3Rpb24SHAoJZmllbGROYW1lGAEgASgJUglmaWVsZE5hbWUSFAoFYWxpYXMYAiABKAlSBWFsaWFz');
@$core.Deprecated('Use querySortDescriptor instead')
const QuerySort$json = const {
  '1': 'QuerySort',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'descending', '3': 2, '4': 1, '5': 8, '10': 'descending'},
    const {'1': 'foreignField', '3': 3, '4': 1, '5': 11, '6': '.DBForeignField', '10': 'foreignField'},
  ],
};

/// Descriptor for `QuerySort`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySortDescriptor = $convert.base64Decode('CglRdWVyeVNvcnQSHAoJZmllbGROYW1lGAEgASgJUglmaWVsZE5hbWUSHgoKZGVzY2VuZGluZxgCIAEoCFIKZGVzY2VuZGluZxIzCgxmb3JlaWduRmllbGQYAyABKAsyDy5EQkZvcmVpZ25GaWVsZFIMZm9yZWlnbkZpZWxk');
@$core.Deprecated('Use queryFilterDescriptor instead')
const QueryFilter$json = const {
  '1': 'QueryFilter',
  '2': const [
    const {'1': 'compare', '3': 1, '4': 1, '5': 11, '6': '.QueryFilterCompare', '9': 0, '10': 'compare'},
    const {'1': 'logical', '3': 2, '4': 1, '5': 11, '6': '.QueryFilterLogical', '9': 0, '10': 'logical'},
    const {'1': 'any', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '9': 0, '10': 'any'},
    const {'1': 'link', '3': 4, '4': 1, '5': 11, '6': '.QueryFilterLink', '9': 0, '10': 'link'},
    const {'1': 'subQuery', '3': 5, '4': 1, '5': 11, '6': '.SubQueryFilterMatch', '9': 0, '10': 'subQuery'},
  ],
  '8': const [
    const {'1': 'filter_oneof'},
  ],
};

/// Descriptor for `QueryFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFilterDescriptor = $convert.base64Decode('CgtRdWVyeUZpbHRlchIvCgdjb21wYXJlGAEgASgLMhMuUXVlcnlGaWx0ZXJDb21wYXJlSABSB2NvbXBhcmUSLwoHbG9naWNhbBgCIAEoCzITLlF1ZXJ5RmlsdGVyTG9naWNhbEgAUgdsb2dpY2FsEigKA2FueRgDIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlIAFIDYW55EiYKBGxpbmsYBCABKAsyEC5RdWVyeUZpbHRlckxpbmtIAFIEbGluaxIyCghzdWJRdWVyeRgFIAEoCzIULlN1YlF1ZXJ5RmlsdGVyTWF0Y2hIAFIIc3ViUXVlcnlCDgoMZmlsdGVyX29uZW9m');
@$core.Deprecated('Use subQueryFilterMatchDescriptor instead')
const SubQueryFilterMatch$json = const {
  '1': 'SubQueryFilterMatch',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'filter', '3': 2, '4': 3, '5': 11, '6': '.QueryFilter', '10': 'filter'},
  ],
};

/// Descriptor for `SubQueryFilterMatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subQueryFilterMatchDescriptor = $convert.base64Decode('ChNTdWJRdWVyeUZpbHRlck1hdGNoEhwKCWZpZWxkTmFtZRgBIAEoCVIJZmllbGROYW1lEiQKBmZpbHRlchgCIAMoCzIMLlF1ZXJ5RmlsdGVyUgZmaWx0ZXI=');
@$core.Deprecated('Use queryFilterLinkDescriptor instead')
const QueryFilterLink$json = const {
  '1': 'QueryFilterLink',
  '2': const [
    const {'1': 'foreignField', '3': 1, '4': 1, '5': 11, '6': '.DBForeignField', '10': 'foreignField'},
    const {'1': 'foreignId', '3': 2, '4': 1, '5': 9, '10': 'foreignId'},
    const {'1': 'link', '3': 3, '4': 1, '5': 8, '10': 'link'},
  ],
};

/// Descriptor for `QueryFilterLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFilterLinkDescriptor = $convert.base64Decode('Cg9RdWVyeUZpbHRlckxpbmsSMwoMZm9yZWlnbkZpZWxkGAEgASgLMg8uREJGb3JlaWduRmllbGRSDGZvcmVpZ25GaWVsZBIcCglmb3JlaWduSWQYAiABKAlSCWZvcmVpZ25JZBISCgRsaW5rGAMgASgIUgRsaW5r');
@$core.Deprecated('Use queryFilterCompareDescriptor instead')
const QueryFilterCompare$json = const {
  '1': 'QueryFilterCompare',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.JsonValue', '10': 'value'},
    const {'1': 'comparator', '3': 3, '4': 1, '5': 14, '6': '.QueryFilterComparator', '10': 'comparator'},
    const {'1': 'isid', '3': 4, '4': 1, '5': 8, '10': 'isid'},
  ],
};

/// Descriptor for `QueryFilterCompare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFilterCompareDescriptor = $convert.base64Decode('ChJRdWVyeUZpbHRlckNvbXBhcmUSHAoJZmllbGROYW1lGAEgASgJUglmaWVsZE5hbWUSIAoFdmFsdWUYAiABKAsyCi5Kc29uVmFsdWVSBXZhbHVlEjYKCmNvbXBhcmF0b3IYAyABKA4yFi5RdWVyeUZpbHRlckNvbXBhcmF0b3JSCmNvbXBhcmF0b3ISEgoEaXNpZBgEIAEoCFIEaXNpZA==');
@$core.Deprecated('Use queryFilterLogicalDescriptor instead')
const QueryFilterLogical$json = const {
  '1': 'QueryFilterLogical',
  '2': const [
    const {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.QueryFilter', '10': 'groups'},
    const {'1': 'operation', '3': 2, '4': 1, '5': 14, '6': '.QueryFilterLogical.Operator', '10': 'operation'},
  ],
  '4': const [QueryFilterLogical_Operator$json],
};

@$core.Deprecated('Use queryFilterLogicalDescriptor instead')
const QueryFilterLogical_Operator$json = const {
  '1': 'Operator',
  '2': const [
    const {'1': 'not', '2': 0},
    const {'1': 'and', '2': 1},
    const {'1': 'nand', '2': 2},
    const {'1': 'or', '2': 3},
    const {'1': 'nor', '2': 4},
  ],
};

/// Descriptor for `QueryFilterLogical`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFilterLogicalDescriptor = $convert.base64Decode('ChJRdWVyeUZpbHRlckxvZ2ljYWwSJAoGZ3JvdXBzGAEgAygLMgwuUXVlcnlGaWx0ZXJSBmdyb3VwcxI6CglvcGVyYXRpb24YAiABKA4yHC5RdWVyeUZpbHRlckxvZ2ljYWwuT3BlcmF0b3JSCW9wZXJhdGlvbiI3CghPcGVyYXRvchIHCgNub3QQABIHCgNhbmQQARIICgRuYW5kEAISBgoCb3IQAxIHCgNub3IQBA==');
@$core.Deprecated('Use dBForeignFieldDescriptor instead')
const DBForeignField$json = const {
  '1': 'DBForeignField',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'fieldName', '3': 2, '4': 1, '5': 9, '10': 'fieldName'},
  ],
};

/// Descriptor for `DBForeignField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBForeignFieldDescriptor = $convert.base64Decode('Cg5EQkZvcmVpZ25GaWVsZBIaCghyZXNvdXJjZRgBIAEoCVIIcmVzb3VyY2USHAoJZmllbGROYW1lGAIgASgJUglmaWVsZE5hbWU=');
