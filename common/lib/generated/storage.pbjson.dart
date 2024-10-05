///
//  Generated code. Do not modify.
//  source: storage.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use storageSharePayloadDescriptor instead')
const StorageSharePayload$json = const {
  '1': 'StorageSharePayload',
  '2': const [
    const {'1': 'toAdd', '3': 1, '4': 3, '5': 11, '6': '.StorageShareRow', '10': 'toAdd'},
    const {'1': 'toRemove', '3': 2, '4': 3, '5': 11, '6': '.StorageShareRow', '10': 'toRemove'},
    const {'1': 'path', '3': 3, '4': 1, '5': 11, '6': '.StoragePath', '10': 'path'},
  ],
};

/// Descriptor for `StorageSharePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageSharePayloadDescriptor = $convert.base64Decode('ChNTdG9yYWdlU2hhcmVQYXlsb2FkEiYKBXRvQWRkGAEgAygLMhAuU3RvcmFnZVNoYXJlUm93UgV0b0FkZBIsCgh0b1JlbW92ZRgCIAMoCzIQLlN0b3JhZ2VTaGFyZVJvd1IIdG9SZW1vdmUSIAoEcGF0aBgDIAEoCzIMLlN0b3JhZ2VQYXRoUgRwYXRo');
@$core.Deprecated('Use storageShareRowDescriptor instead')
const StorageShareRow$json = const {
  '1': 'StorageShareRow',
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

/// Descriptor for `StorageShareRow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageShareRowDescriptor = $convert.base64Decode('Cg9TdG9yYWdlU2hhcmVSb3cSFAoEdXNlchgBIAEoCUgAUgR1c2VyEhQKBHJvbGUYAiABKAlIAFIEcm9sZRIYCgZwdWJsaWMYAyABKAhIAFIGcHVibGljEiYKDWF1dGhlbnRpY2F0ZWQYBCABKAhIAFINYXV0aGVudGljYXRlZBISCgRyZWFkGAUgASgIUgRyZWFkEhQKBXdyaXRlGAYgASgIUgV3cml0ZRIWCgZtYW5hZ2UYByABKAhSBm1hbmFnZUINCgtzaGFyZV9vbmVvZg==');
@$core.Deprecated('Use storageEmptyDescriptor instead')
const StorageEmpty$json = const {
  '1': 'StorageEmpty',
};

/// Descriptor for `StorageEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageEmptyDescriptor = $convert.base64Decode('CgxTdG9yYWdlRW1wdHk=');
@$core.Deprecated('Use storagePathDescriptor instead')
const StoragePath$json = const {
  '1': 'StoragePath',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'bucketId', '3': 2, '4': 1, '5': 9, '10': 'bucketId'},
  ],
};

/// Descriptor for `StoragePath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storagePathDescriptor = $convert.base64Decode('CgtTdG9yYWdlUGF0aBISCgRwYXRoGAEgASgJUgRwYXRoEhoKCGJ1Y2tldElkGAIgASgJUghidWNrZXRJZA==');
@$core.Deprecated('Use storageCreatePayloadDescriptor instead')
const StorageCreatePayload$json = const {
  '1': 'StorageCreatePayload',
  '2': const [
    const {'1': 'meta', '3': 1, '4': 1, '5': 11, '6': '.StorageMeta', '9': 0, '10': 'meta'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 11, '6': '.StorageFile', '9': 0, '10': 'chunk'},
    const {'1': 'upsert', '3': 3, '4': 1, '5': 8, '10': 'upsert'},
  ],
  '8': const [
    const {'1': 'create_oneof'},
  ],
};

/// Descriptor for `StorageCreatePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageCreatePayloadDescriptor = $convert.base64Decode('ChRTdG9yYWdlQ3JlYXRlUGF5bG9hZBIiCgRtZXRhGAEgASgLMgwuU3RvcmFnZU1ldGFIAFIEbWV0YRIkCgVjaHVuaxgCIAEoCzIMLlN0b3JhZ2VGaWxlSABSBWNodW5rEhYKBnVwc2VydBgDIAEoCFIGdXBzZXJ0Qg4KDGNyZWF0ZV9vbmVvZg==');
@$core.Deprecated('Use storageMetaDescriptor instead')
const StorageMeta$json = const {
  '1': 'StorageMeta',
  '2': const [
    const {'1': 'id', '3': 5, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'path', '3': 1, '4': 1, '5': 11, '6': '.StoragePath', '10': 'path'},
    const {'1': 'size', '3': 2, '4': 1, '5': 5, '10': 'size'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'contentType', '3': 6, '4': 1, '5': 9, '10': 'contentType'},
    const {'1': 'rights', '3': 7, '4': 3, '5': 11, '6': '.StorageShareRow', '10': 'rights'},
    const {'1': 'custom', '3': 20, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'custom'},
  ],
};

/// Descriptor for `StorageMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageMetaDescriptor = $convert.base64Decode('CgtTdG9yYWdlTWV0YRIOCgJpZBgFIAEoCVICaWQSIAoEcGF0aBgBIAEoCzIMLlN0b3JhZ2VQYXRoUgRwYXRoEhIKBHNpemUYAiABKAVSBHNpemUSOAoJY3JlYXRlZEF0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjgKCXVwZGF0ZWRBdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIgCgtjb250ZW50VHlwZRgGIAEoCVILY29udGVudFR5cGUSKAoGcmlnaHRzGAcgAygLMhAuU3RvcmFnZVNoYXJlUm93UgZyaWdodHMSLAoGY3VzdG9tGBQgAygLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIGY3VzdG9t');
@$core.Deprecated('Use storageFileDescriptor instead')
const StorageFile$json = const {
  '1': 'StorageFile',
  '2': const [
    const {'1': 'buffer', '3': 2, '4': 1, '5': 12, '10': 'buffer'},
  ],
};

/// Descriptor for `StorageFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageFileDescriptor = $convert.base64Decode('CgtTdG9yYWdlRmlsZRIWCgZidWZmZXIYAiABKAxSBmJ1ZmZlcg==');
@$core.Deprecated('Use serverStorageConfigDescriptor instead')
const ServerStorageConfig$json = const {
  '1': 'ServerStorageConfig',
  '2': const [
    const {'1': 'directory', '3': 1, '4': 1, '5': 9, '10': 'directory'},
    const {'1': 'allowDotFiles', '3': 2, '4': 1, '5': 8, '10': 'allowDotFiles'},
    const {'1': 'allowExtentions', '3': 3, '4': 3, '5': 9, '10': 'allowExtentions'},
    const {'1': 'forbidExtentions', '3': 4, '4': 3, '5': 9, '10': 'forbidExtentions'},
    const {'1': 'serviceConfig', '3': 5, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
    const {'1': 'rightResource', '3': 6, '4': 1, '5': 9, '10': 'rightResource'},
    const {'1': 'maxPathDepth', '3': 7, '4': 1, '5': 5, '10': 'maxPathDepth'},
  ],
};

/// Descriptor for `ServerStorageConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStorageConfigDescriptor = $convert.base64Decode('ChNTZXJ2ZXJTdG9yYWdlQ29uZmlnEhwKCWRpcmVjdG9yeRgBIAEoCVIJZGlyZWN0b3J5EiQKDWFsbG93RG90RmlsZXMYAiABKAhSDWFsbG93RG90RmlsZXMSKAoPYWxsb3dFeHRlbnRpb25zGAMgAygJUg9hbGxvd0V4dGVudGlvbnMSKgoQZm9yYmlkRXh0ZW50aW9ucxgEIAMoCVIQZm9yYmlkRXh0ZW50aW9ucxI7Cg1zZXJ2aWNlQ29uZmlnGAUgASgLMhUuQ2hhbm5lbFNlcnZpY2VDb25maWdSDXNlcnZpY2VDb25maWcSJAoNcmlnaHRSZXNvdXJjZRgGIAEoCVINcmlnaHRSZXNvdXJjZRIiCgxtYXhQYXRoRGVwdGgYByABKAVSDG1heFBhdGhEZXB0aA==');
