part of 'validation.dart';

class RepeatedValidation {
  static void minItems<T>(String field, List<T> values, int expected) {
    if (values.length < expected) {
      throw ValidationException(field, '$values', 'must have at least $expected  items');
    }
  }

  static void maxItems<T>(String field, List<T> values, int expected) {
    if (values.length > expected) {
      throw ValidationException(field, '$values', 'must have at most $expected items');
    }
  }

  static bool isUnique<T>(List<T> values) {
    try {
      unique('', values);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void unique<T>(String field, List<T> values) {
    final seen = <T>{};
    for (final value in values) {
      // Abort at the first sign of a duplicate
      if (!seen.add(value)) {
        throw ValidationException(field, '$values', 'must have all unique values');
      }
    }
  }

  static void forEach<T>(List<T> values, ValidationConsumer<T> consumer) {
    for (final value in values) {
      consumer(value);
    }
  }
}

typedef ValidationConsumer<T> = void Function(T value);
