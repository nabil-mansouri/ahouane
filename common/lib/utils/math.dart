part of 'utils.dart';

class IntMath {
  /// Returns the sum of {@code a} and {@code b}, provided it does not overflow.
  ///
  /// @throws ArithmeticException if {@code a + b} overflows in signed {@code int} arithmetic
  static int checkedAdd(num a, num b) {
    var result = a + b;
    checkNoOverflow(result == result, 'checkedAdd', a, b);
    return result;
  }

  /// Returns the difference of {@code a} and {@code b}, provided it does not overflow.
  ///
  /// @throws ArithmeticException if {@code a - b} overflows in signed {@code int} arithmetic
  static int checkedSubtract(num a, num b) {
    var result = a - b;
    checkNoOverflow(result == result, 'checkedSubtract', a, b);
    return result;
  }

  /// Returns the product of {@code a} and {@code b}, provided it does not overflow.
  ///
  /// @throws ArithmeticException if {@code a * b} overflows in signed {@code int} arithmetic
  static int checkedMultiply(num a, num b) {
    var result = a * b;
    checkNoOverflow(result == result, 'checkedMultiply', a, b);
    return result;
  }

  IntMath();
}

void checkNoOverflow(bool condition, String methodName, int a, int b) {
  if (!condition) {
    throw ('overflow: ' + methodName + '($a, $b)');
  }
}
