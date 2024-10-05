///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verifyMailPayloadDescriptor instead')
const VerifyMailPayload$json = const {
  '1': 'VerifyMailPayload',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `VerifyMailPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyMailPayloadDescriptor = $convert.base64Decode('ChFWZXJpZnlNYWlsUGF5bG9hZBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSFAoFdG9rZW4YAiABKAlSBXRva2Vu');
@$core.Deprecated('Use resetPasswordPayloadDescriptor instead')
const ResetPasswordPayload$json = const {
  '1': 'ResetPasswordPayload',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResetPasswordPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordPayloadDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUGF5bG9hZBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSFAoFdG9rZW4YAiABKAlSBXRva2VuEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use sendResetPasswordPayloadDescriptor instead')
const SendResetPasswordPayload$json = const {
  '1': 'SendResetPasswordPayload',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `SendResetPasswordPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendResetPasswordPayloadDescriptor = $convert.base64Decode('ChhTZW5kUmVzZXRQYXNzd29yZFBheWxvYWQSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use sendMailVerificationPayloadDescriptor instead')
const SendMailVerificationPayload$json = const {
  '1': 'SendMailVerificationPayload',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `SendMailVerificationPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMailVerificationPayloadDescriptor = $convert.base64Decode('ChtTZW5kTWFpbFZlcmlmaWNhdGlvblBheWxvYWQSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use authEmptyDescriptor instead')
const AuthEmpty$json = const {
  '1': 'AuthEmpty',
};

/// Descriptor for `AuthEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authEmptyDescriptor = $convert.base64Decode('CglBdXRoRW1wdHk=');
@$core.Deprecated('Use createUserByEmailPayloadDescriptor instead')
const CreateUserByEmailPayload$json = const {
  '1': 'CreateUserByEmailPayload',
  '2': const [
    const {
      '1': 'email',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {
        '1000': const {
          '14': const {'12': true},
          '17': const {'2': true},
        },
      },
      '10': 'email',
    },
    const {
      '1': 'password',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {
        '1000': const {
          '17': const {'2': true},
        },
      },
      '10': 'password',
    },
  ],
};

/// Descriptor for `CreateUserByEmailPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserByEmailPayloadDescriptor = $convert.base64Decode('ChhDcmVhdGVVc2VyQnlFbWFpbFBheWxvYWQSIgoFZW1haWwYASABKAlCDMI+CXICYAGKAQIQAVIFZW1haWwSJAoIcGFzc3dvcmQYAiABKAlCCMI+BYoBAhABUghwYXNzd29yZA==');
@$core.Deprecated('Use loginInByEmailPayloadDescriptor instead')
const LoginInByEmailPayload$json = const {
  '1': 'LoginInByEmailPayload',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginInByEmailPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginInByEmailPayloadDescriptor = $convert.base64Decode('ChVMb2dpbkluQnlFbWFpbFBheWxvYWQSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'displayName', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'verifiedEmail', '3': 5, '4': 1, '5': 8, '10': 'verifiedEmail'},
    const {'1': 'verifiedPhone', '3': 6, '4': 1, '5': 8, '10': 'verifiedPhone'},
    const {'1': 'createdAt', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'details', '3': 9, '4': 1, '5': 11, '6': '.UserDetails', '10': 'details'},
    const {'1': 'address', '3': 10, '4': 1, '5': 11, '6': '.UserAddress', '10': 'address'},
    const {'1': 'custom', '3': 11, '4': 1, '5': 11, '6': '.JsonObjectValue', '10': 'custom'},
    const {'1': 'password', '3': 12, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'blocked', '3': 13, '4': 1, '5': 8, '10': 'blocked'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSFAoFcGhvbmUYAyABKAlSBXBob25lEiAKC2Rpc3BsYXlOYW1lGAQgASgJUgtkaXNwbGF5TmFtZRIkCg12ZXJpZmllZEVtYWlsGAUgASgIUg12ZXJpZmllZEVtYWlsEiQKDXZlcmlmaWVkUGhvbmUYBiABKAhSDXZlcmlmaWVkUGhvbmUSOAoJY3JlYXRlZEF0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjgKCXVwZGF0ZWRBdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBImCgdkZXRhaWxzGAkgASgLMgwuVXNlckRldGFpbHNSB2RldGFpbHMSJgoHYWRkcmVzcxgKIAEoCzIMLlVzZXJBZGRyZXNzUgdhZGRyZXNzEigKBmN1c3RvbRgLIAEoCzIQLkpzb25PYmplY3RWYWx1ZVIGY3VzdG9tEhoKCHBhc3N3b3JkGAwgASgJUghwYXNzd29yZBIYCgdibG9ja2VkGA0gASgIUgdibG9ja2Vk');
@$core.Deprecated('Use userDetailsDescriptor instead')
const UserDetails$json = const {
  '1': 'UserDetails',
  '2': const [
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'birthDate', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
  ],
};

/// Descriptor for `UserDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDetailsDescriptor = $convert.base64Decode('CgtVc2VyRGV0YWlscxIUCgV0aXRsZRgEIAEoCVIFdGl0bGUSHAoJZmlyc3ROYW1lGAEgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYAiABKAlSCGxhc3ROYW1lEjgKCWJpcnRoRGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWJpcnRoRGF0ZQ==');
@$core.Deprecated('Use userAddressDescriptor instead')
const UserAddress$json = const {
  '1': 'UserAddress',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 5, '10': 'number'},
    const {'1': 'street', '3': 2, '4': 1, '5': 9, '10': 'street'},
    const {'1': 'street2', '3': 3, '4': 1, '5': 9, '10': 'street2'},
    const {'1': 'informations', '3': 4, '4': 1, '5': 9, '10': 'informations'},
    const {'1': 'city', '3': 5, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'zip', '3': 6, '4': 1, '5': 9, '10': 'zip'},
    const {'1': 'country', '3': 7, '4': 1, '5': 9, '10': 'country'},
  ],
};

/// Descriptor for `UserAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAddressDescriptor = $convert.base64Decode('CgtVc2VyQWRkcmVzcxIWCgZudW1iZXIYASABKAVSBm51bWJlchIWCgZzdHJlZXQYAiABKAlSBnN0cmVldBIYCgdzdHJlZXQyGAMgASgJUgdzdHJlZXQyEiIKDGluZm9ybWF0aW9ucxgEIAEoCVIMaW5mb3JtYXRpb25zEhIKBGNpdHkYBSABKAlSBGNpdHkSEAoDemlwGAYgASgJUgN6aXASGAoHY291bnRyeRgHIAEoCVIHY291bnRyeQ==');
@$core.Deprecated('Use serverAuthConfigDescriptor instead')
const ServerAuthConfig$json = const {
  '1': 'ServerAuthConfig',
  '2': const [
    const {'1': 'userResource', '3': 1, '4': 1, '5': 9, '10': 'userResource'},
    const {'1': 'sessionDurationMinutes', '3': 2, '4': 1, '5': 5, '10': 'sessionDurationMinutes'},
    const {'1': 'tokenDurationMinutes', '3': 3, '4': 1, '5': 5, '10': 'tokenDurationMinutes'},
    const {'1': 'serviceConfig', '3': 4, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
    const {'1': 'verifyEmailSubject', '3': 5, '4': 1, '5': 9, '10': 'verifyEmailSubject'},
    const {'1': 'verifyEmailTemplate', '3': 6, '4': 1, '5': 9, '10': 'verifyEmailTemplate'},
    const {'1': 'resetPwdSubject', '3': 7, '4': 1, '5': 9, '10': 'resetPwdSubject'},
    const {'1': 'resetPwdTemplate', '3': 8, '4': 1, '5': 9, '10': 'resetPwdTemplate'},
    const {'1': 'adminApiKey', '3': 9, '4': 1, '5': 9, '10': 'adminApiKey'},
  ],
};

/// Descriptor for `ServerAuthConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverAuthConfigDescriptor = $convert.base64Decode('ChBTZXJ2ZXJBdXRoQ29uZmlnEiIKDHVzZXJSZXNvdXJjZRgBIAEoCVIMdXNlclJlc291cmNlEjYKFnNlc3Npb25EdXJhdGlvbk1pbnV0ZXMYAiABKAVSFnNlc3Npb25EdXJhdGlvbk1pbnV0ZXMSMgoUdG9rZW5EdXJhdGlvbk1pbnV0ZXMYAyABKAVSFHRva2VuRHVyYXRpb25NaW51dGVzEjsKDXNlcnZpY2VDb25maWcYBCABKAsyFS5DaGFubmVsU2VydmljZUNvbmZpZ1INc2VydmljZUNvbmZpZxIuChJ2ZXJpZnlFbWFpbFN1YmplY3QYBSABKAlSEnZlcmlmeUVtYWlsU3ViamVjdBIwChN2ZXJpZnlFbWFpbFRlbXBsYXRlGAYgASgJUhN2ZXJpZnlFbWFpbFRlbXBsYXRlEigKD3Jlc2V0UHdkU3ViamVjdBgHIAEoCVIPcmVzZXRQd2RTdWJqZWN0EioKEHJlc2V0UHdkVGVtcGxhdGUYCCABKAlSEHJlc2V0UHdkVGVtcGxhdGUSIAoLYWRtaW5BcGlLZXkYCSABKAlSC2FkbWluQXBpS2V5');
@$core.Deprecated('Use updateUserPayloadDescriptor instead')
const UpdateUserPayload$json = const {
  '1': 'UpdateUserPayload',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
    const {'1': 'newPassword', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `UpdateUserPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserPayloadDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUGF5bG9hZBIZCgR1c2VyGAEgASgLMgUuVXNlclIEdXNlchIgCgtuZXdQYXNzd29yZBgCIAEoCVILbmV3UGFzc3dvcmQ=');
@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = const {
  '1': 'CreateUserResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
    const {'1': 'roles', '3': 2, '4': 3, '5': 9, '10': 'roles'},
    const {'1': 'scopes', '3': 3, '4': 3, '5': 9, '10': 'scopes'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVVc2VyUmVzcG9uc2USGQoEdXNlchgBIAEoCzIFLlVzZXJSBHVzZXISFAoFcm9sZXMYAiADKAlSBXJvbGVzEhYKBnNjb3BlcxgDIAMoCVIGc2NvcGVz');
