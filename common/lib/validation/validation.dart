import 'dart:convert';
import 'dart:core';
import 'dart:math' as math;
import 'package:ahouane_common/core/core.dart';
import 'package:ahouane_common/generated/google/protobuf/duration.pb.dart';
import 'package:ahouane_common/generated/google/protobuf/timestamp.pb.dart';
import 'package:ahouane_common/generated/validate.pb.dart';
import 'package:ahouane_common/utils/utils.dart';
import 'package:meta/meta.dart';
part 'bytes_validation.dart';
part 'collection_validation.dart';
part 'comparative_validation.dart';
part 'domain_validation.dart';
part 'email_validation.dart';
part 'enum_validation.dart';
part 'map_validation.dart';
part 'inet_validation.dart';
part 'repeated_validation.dart';
part 'regex_validation.dart';
part 'string_validation.dart';
part 'timestamp_validation.dart';
part 'validation_ext.dart';
part 'validation_keys.dart';

class ValidationException implements Exception {
  final String field;
  final String value;
  final String message;
  ValidationException(this.field, this.value, this.message);
}

class RequiredValidation {
  static void required(String field, GeneratedMessage value) {
    if (value == null) {
      throw ValidationException(field, 'null', 'is required');
    }
  }
}

extension ValidationResultValidation on ValidationResult {
  bool hasErrors() {
    return errors.isNotEmpty && fieldErrors.entries.where((e) => e.value.hasErrors()).isNotEmpty;
  }

  void add(final String error) {
    errors.add(error);
  }

  void mergeErrors(final ValidationResult other) {
    errors.addAll(other.errors);
  }

  void mergeField(final String field, final ValidationResult other) {
    if (!fieldErrors.containsKey(field)) {
      fieldErrors[field] = ValidationResult();
    }
    fieldErrors[field].errors.addAll(other.errors);
  }
}
