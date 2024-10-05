///
//  Generated code. Do not modify.
//  source: introspection.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use introspectionObjectsDescriptor instead')
const IntrospectionObjects$json = const {
  '1': 'IntrospectionObjects',
  '2': const [
    const {'1': 'objects', '3': 1, '4': 3, '5': 11, '6': '.IntrospectionObjects.ObjectsEntry', '10': 'objects'},
  ],
  '3': const [IntrospectionObjects_ObjectsEntry$json],
};

@$core.Deprecated('Use introspectionObjectsDescriptor instead')
const IntrospectionObjects_ObjectsEntry$json = const {
  '1': 'ObjectsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.IntrospectionObject', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `IntrospectionObjects`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introspectionObjectsDescriptor = $convert.base64Decode('ChRJbnRyb3NwZWN0aW9uT2JqZWN0cxI8CgdvYmplY3RzGAEgAygLMiIuSW50cm9zcGVjdGlvbk9iamVjdHMuT2JqZWN0c0VudHJ5UgdvYmplY3RzGlAKDE9iamVjdHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIqCgV2YWx1ZRgCIAEoCzIULkludHJvc3BlY3Rpb25PYmplY3RSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use introspectionObjectDescriptor instead')
const IntrospectionObject$json = const {
  '1': 'IntrospectionObject',
  '2': const [
    const {'1': 'qualifiedName', '3': 1, '4': 1, '5': 9, '10': 'qualifiedName'},
    const {'1': 'fields', '3': 2, '4': 3, '5': 11, '6': '.IntrospectionField', '10': 'fields'},
    const {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
  ],
};

/// Descriptor for `IntrospectionObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introspectionObjectDescriptor = $convert.base64Decode('ChNJbnRyb3NwZWN0aW9uT2JqZWN0EiQKDXF1YWxpZmllZE5hbWUYASABKAlSDXF1YWxpZmllZE5hbWUSKwoGZmllbGRzGAIgAygLMhMuSW50cm9zcGVjdGlvbkZpZWxkUgZmaWVsZHMSIAoLZGlzcGxheU5hbWUYAyABKAlSC2Rpc3BsYXlOYW1l');
@$core.Deprecated('Use introspectionFieldDescriptor instead')
const IntrospectionField$json = const {
  '1': 'IntrospectionField',
  '2': const [
    const {'1': 'fieldName', '3': 1, '4': 1, '5': 9, '10': 'fieldName'},
    const {'1': 'fieldTypeName', '3': 2, '4': 1, '5': 9, '10': 'fieldTypeName'},
    const {'1': 'fieldTypeInt', '3': 3, '4': 1, '5': 5, '10': 'fieldTypeInt'},
    const {'1': 'isEnum', '3': 4, '4': 1, '5': 8, '10': 'isEnum'},
    const {'1': 'isMessage', '3': 5, '4': 1, '5': 8, '10': 'isMessage'},
    const {'1': 'isRepeated', '3': 6, '4': 1, '5': 8, '10': 'isRepeated'},
    const {'1': 'isMap', '3': 7, '4': 1, '5': 8, '10': 'isMap'},
    const {'1': 'enumValues', '3': 8, '4': 3, '5': 9, '10': 'enumValues'},
    const {'1': 'embedType', '3': 10, '4': 1, '5': 11, '6': '.IntrospectionObject', '10': 'embedType'},
    const {'1': 'tagNumber', '3': 11, '4': 1, '5': 5, '10': 'tagNumber'},
    const {'1': 'fieldKeyTypeInt', '3': 12, '4': 1, '5': 5, '10': 'fieldKeyTypeInt'},
    const {'1': 'validationRules', '3': 13, '4': 1, '5': 11, '6': '.validate.FieldRules', '10': 'validationRules'},
  ],
};

/// Descriptor for `IntrospectionField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introspectionFieldDescriptor = $convert.base64Decode('ChJJbnRyb3NwZWN0aW9uRmllbGQSHAoJZmllbGROYW1lGAEgASgJUglmaWVsZE5hbWUSJAoNZmllbGRUeXBlTmFtZRgCIAEoCVINZmllbGRUeXBlTmFtZRIiCgxmaWVsZFR5cGVJbnQYAyABKAVSDGZpZWxkVHlwZUludBIWCgZpc0VudW0YBCABKAhSBmlzRW51bRIcCglpc01lc3NhZ2UYBSABKAhSCWlzTWVzc2FnZRIeCgppc1JlcGVhdGVkGAYgASgIUgppc1JlcGVhdGVkEhQKBWlzTWFwGAcgASgIUgVpc01hcBIeCgplbnVtVmFsdWVzGAggAygJUgplbnVtVmFsdWVzEjIKCWVtYmVkVHlwZRgKIAEoCzIULkludHJvc3BlY3Rpb25PYmplY3RSCWVtYmVkVHlwZRIcCgl0YWdOdW1iZXIYCyABKAVSCXRhZ051bWJlchIoCg9maWVsZEtleVR5cGVJbnQYDCABKAVSD2ZpZWxkS2V5VHlwZUludBI+Cg92YWxpZGF0aW9uUnVsZXMYDSABKAsyFC52YWxpZGF0ZS5GaWVsZFJ1bGVzUg92YWxpZGF0aW9uUnVsZXM=');
