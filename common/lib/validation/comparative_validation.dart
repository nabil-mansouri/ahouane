part of 'validation.dart';

class ComparativeValidation {
  static void lessThan<T>(String field, T value, T limit, Comparator<T> comparator) {
    if (!lt(comparator(value, limit))) {
      throw ValidationException(field, '$value', 'must be less than ' + limit.toString());
    }
  }

  static void lessThanOrEqual<T>(String field, T value, T limit, Comparator<T> comparator) {
    if (!lte(comparator(value, limit))) {
      throw ValidationException(field, '$value', 'must be less than or equal to ' + limit.toString());
    }
  }

  static void greaterThan<T>(String field, T value, T limit, Comparator<T> comparator) {
    if (!gt(comparator(value, limit))) {
      throw ValidationException(field, '$value', 'must be greater than ' + limit.toString());
    }
  }

  static void greaterThanOrEqual<T>(String field, T value, T limit, Comparator<T> comparator) {
    if (!gte(comparator(value, limit))) {
      throw ValidationException(field, '$value', 'must be greater than or equal to ' + limit.toString());
    }
  }

  static void range<T>(String field, T value, T lt, T lte, T gt, T gte, Comparator<T> comparator) {
    var ltx = first(lt, lte);
    var ltxInc = lte != null;

    var gtx = first(gt, gte);
    var gtxInc = gte != null;

    // Inverting the values of lt(e) and gt(e) is valid and creates an exclusive range.
    // {gte:30, lt: 40} => x must be in the range [30, 40)
    // {lt:30, gte:40} => x must be outside the range [30, 40)
    if (ComparativeValidation.lte(comparator(gtx, ltx))) {
      between(field, value, gtx, gtxInc, ltx, ltxInc, comparator);
    } else {
      outside(field, value, ltx, !ltxInc, gtx, !gtxInc, comparator);
    }
  }

  static void between<T>(String field, T value, T lower, bool lowerInclusive, T upper, bool upperInclusive, Comparator<T> comparator) {
    if (!between2(value, lower, lowerInclusive, upper, upperInclusive, comparator)) {
      throw ValidationException(field, '$value', 'must be in the range ${range2(lower, lowerInclusive, upper, upperInclusive)}');
    }
  }

  static void outside<T>(String field, T value, T lower, bool lowerInclusive, T upper, bool upperInclusive, Comparator<T> comparator) {
    if (between2(value, lower, lowerInclusive, upper, upperInclusive, comparator)) {
      throw ValidationException(field, '$value', 'must be outside the range ${range2(lower, lowerInclusive, upper, upperInclusive)}');
    }
  }

  static bool between2<T>(T value, T lower, bool lowerInclusive, T upper, bool upperInclusive, Comparator<T> comparator) {
    return (lowerInclusive ? gte(comparator(value, lower)) : gt(comparator(value, lower))) &&
        (upperInclusive ? lte(comparator(value, upper)) : lt(comparator(value, upper)));
  }

  static String range2<T>(T lower, bool lowerInclusive, T upper, bool upperInclusive) {
    return (lowerInclusive ? '[' : '(') + lower.toString() + ', ' + upper.toString() + (upperInclusive ? ']' : ')');
  }

  static bool lt(int comparatorResult) {
    return comparatorResult < 0;
  }

  static bool lte(int comparatorResult) {
    return comparatorResult <= 0;
  }

  static bool gt(int comparatorResult) {
    return comparatorResult > 0;
  }

  static bool gte(int comparatorResult) {
    return comparatorResult >= 0;
  }

  static T first<T>(T lhs, T rhs) {
    return lhs ?? rhs;
  }
}
