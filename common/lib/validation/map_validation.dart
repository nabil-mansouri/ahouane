part of 'validation.dart';

class MapValidation {
  static void min(String field, Map value, int expected) {
    if (math.min(value.length, expected) != expected) {
      throw ValidationException(field, '$value', 'value size must be at least $expected');
    }
  }

  static void max(String field, Map value, int expected) {
    if (math.max(value.length, expected) != expected) {
      throw ValidationException(field, '$value', 'value size must not exceed $expected');
    }
  }

  static void noSparse(String field, Map value) {
    throw ('$field no_sparse validation is not implemented for Java because protobuf maps cannot be sparse in Java');
  }

  static void validateParts<T>(List<T> vals, MapValidator<T> validator) {
    for (final val in vals) {
      validator(val);
    }
  }
}

typedef MapValidator<T> = void Function(T val);
