///
//  Generated code. Do not modify.
//  source: scope.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use serverScopeConfigDescriptor instead')
const ServerScopeConfig$json = const {
  '1': 'ServerScopeConfig',
  '2': const [
    const {'1': 'defaultRoleIds', '3': 1, '4': 3, '5': 9, '10': 'defaultRoleIds'},
    const {'1': 'initRoles', '3': 2, '4': 3, '5': 11, '6': '.Role', '10': 'initRoles'},
    const {'1': 'roleResource', '3': 4, '4': 1, '5': 9, '10': 'roleResource'},
    const {'1': 'userResource', '3': 5, '4': 1, '5': 9, '10': 'userResource'},
    const {'1': 'scopeResource', '3': 6, '4': 1, '5': 9, '10': 'scopeResource'},
    const {'1': 'serviceConfig', '3': 7, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
    const {'1': 'intercept', '3': 8, '4': 1, '5': 9, '10': 'intercept'},
    const {'1': 'publicScopes', '3': 9, '4': 3, '5': 9, '10': 'publicScopes'},
  ],
};

/// Descriptor for `ServerScopeConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverScopeConfigDescriptor = $convert.base64Decode('ChFTZXJ2ZXJTY29wZUNvbmZpZxImCg5kZWZhdWx0Um9sZUlkcxgBIAMoCVIOZGVmYXVsdFJvbGVJZHMSIwoJaW5pdFJvbGVzGAIgAygLMgUuUm9sZVIJaW5pdFJvbGVzEiIKDHJvbGVSZXNvdXJjZRgEIAEoCVIMcm9sZVJlc291cmNlEiIKDHVzZXJSZXNvdXJjZRgFIAEoCVIMdXNlclJlc291cmNlEiQKDXNjb3BlUmVzb3VyY2UYBiABKAlSDXNjb3BlUmVzb3VyY2USOwoNc2VydmljZUNvbmZpZxgHIAEoCzIVLkNoYW5uZWxTZXJ2aWNlQ29uZmlnUg1zZXJ2aWNlQ29uZmlnEhwKCWludGVyY2VwdBgIIAEoCVIJaW50ZXJjZXB0EiIKDHB1YmxpY1Njb3BlcxgJIAMoCVIMcHVibGljU2NvcGVz');
@$core.Deprecated('Use roleListDescriptor instead')
const RoleList$json = const {
  '1': 'RoleList',
  '2': const [
    const {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.Role', '10': 'roles'},
  ],
};

/// Descriptor for `RoleList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleListDescriptor = $convert.base64Decode('CghSb2xlTGlzdBIbCgVyb2xlcxgBIAMoCzIFLlJvbGVSBXJvbGVz');
@$core.Deprecated('Use roleDescriptor instead')
const Role$json = const {
  '1': 'Role',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'scopes', '3': 3, '4': 3, '5': 9, '10': 'scopes'},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode('CgRSb2xlEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhYKBnNjb3BlcxgDIAMoCVIGc2NvcGVz');
@$core.Deprecated('Use scopeDescriptor instead')
const Scope$json = const {
  '1': 'Scope',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Scope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scopeDescriptor = $convert.base64Decode('CgVTY29wZRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use scopesPayloadDescriptor instead')
const ScopesPayload$json = const {
  '1': 'ScopesPayload',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ScopesPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scopesPayloadDescriptor = $convert.base64Decode('Cg1TY29wZXNQYXlsb2FkEhYKBnVzZXJJZBgBIAEoCVIGdXNlcklk');
@$core.Deprecated('Use attachScopePayloadDescriptor instead')
const AttachScopePayload$json = const {
  '1': 'AttachScopePayload',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 9, '10': 'roleId'},
    const {'1': 'scopeId', '3': 2, '4': 1, '5': 9, '10': 'scopeId'},
  ],
};

/// Descriptor for `AttachScopePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attachScopePayloadDescriptor = $convert.base64Decode('ChJBdHRhY2hTY29wZVBheWxvYWQSFgoGcm9sZUlkGAEgASgJUgZyb2xlSWQSGAoHc2NvcGVJZBgCIAEoCVIHc2NvcGVJZA==');
@$core.Deprecated('Use attachRolePayloadDescriptor instead')
const AttachRolePayload$json = const {
  '1': 'AttachRolePayload',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'roleId', '3': 2, '4': 1, '5': 9, '10': 'roleId'},
  ],
};

/// Descriptor for `AttachRolePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attachRolePayloadDescriptor = $convert.base64Decode('ChFBdHRhY2hSb2xlUGF5bG9hZBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIWCgZyb2xlSWQYAiABKAlSBnJvbGVJZA==');
@$core.Deprecated('Use scopeEmptyDescriptor instead')
const ScopeEmpty$json = const {
  '1': 'ScopeEmpty',
};

/// Descriptor for `ScopeEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scopeEmptyDescriptor = $convert.base64Decode('CgpTY29wZUVtcHR5');
