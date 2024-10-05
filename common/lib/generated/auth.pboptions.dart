///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;
import 'package:ahouane_common/generated/validate.pb.dart';
import 'auth.pb.dart';
export 'auth.pb.dart';

extension VerifyMailPayloadValiation on VerifyMailPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension ResetPasswordPayloadValiation on ResetPasswordPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension SendResetPasswordPayloadValiation on SendResetPasswordPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension SendMailVerificationPayloadValiation on SendMailVerificationPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension AuthEmptyValiation on AuthEmpty {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension CreateUserByEmailPayloadValiation on CreateUserByEmailPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {
      'email': FieldRules(
        string: StringRules(
          email: true,
        ),
        message: MessageRules(
          required: true,
        ),
      ),
      'password': FieldRules(
        message: MessageRules(
          required: true,
        ),
      )
    };
  }
}

extension LoginInByEmailPayloadValiation on LoginInByEmailPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension UserValiation on User {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension UserDetailsValiation on UserDetails {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension UserAddressValiation on UserAddress {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension ServerAuthConfigValiation on ServerAuthConfig {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension UpdateUserPayloadValiation on UpdateUserPayload {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}

extension CreateUserResponseValiation on CreateUserResponse {
  $core.Map<$core.String, FieldRules> $getValidationRules() {
    return {};
  }
}
