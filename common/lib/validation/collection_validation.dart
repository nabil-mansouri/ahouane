part of 'validation.dart';

class CollectiveValidation {
  static void inList<T>(String field, T value, List<T> set) {
    for (var i in set) {
      if (value == (i)) {
        return;
      }
    }

    throw ValidationException(field, '$value', 'must be in $set');
  }

  static void notIn<T>(String field, T value, List<T> set) {
    for (var i in set) {
      if (value == (i)) {
        throw ValidationException(field, '$value', 'must not be in $set');
      }
    }
  }
}
