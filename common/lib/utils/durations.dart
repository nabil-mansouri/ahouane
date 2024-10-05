part of 'utils.dart';

class Durations {
  static final num DURATION_SECONDS_MIN = -315576000000;
  static final num DURATION_SECONDS_MAX = 315576000000;

  static final num SECONDS_PER_MINUTE = 60;
  static final num SECONDS_PER_HOUR = SECONDS_PER_MINUTE * 60;
  static final num SECONDS_PER_DAY = SECONDS_PER_HOUR * 24;

  /// A constant holding the minimum valid {@link Duration}, approximately {@code -10,000} years. */
  static final Duration MIN_VALUE = Duration(seconds: Int64(DURATION_SECONDS_MIN), nanos: -999999999);

  /// A constant holding the maximum valid {@link Duration}, approximately {@code +10,000} years. */
  static final Duration MAX_VALUE = Duration(seconds: Int64(DURATION_SECONDS_MAX), nanos: 999999999);

  /// A constant holding the duration of zero. */
  static final Duration ZERO = Duration(seconds: Int64(0), nanos: 0);

  Durations();

  /// Compares two durations. The value returned is identical to what would be returned by: {@code
  /// Durations.comparator().compare(x, y)}.
  ///
  /// @return the value {@code 0} if {@code x == y}; a value less than {@code 0} if {@code x < y};
  ///     and a value greater than {@code 0} if {@code x > y}
  static int compare(Duration x, Duration y) {
    return durationComparator(x, y);
  }

  /// Returns true if the given {@link Duration} is valid. The {@code seconds} value must be in the
  /// range [-315,576,000,000, +315,576,000,000]. The {@code nanos} value must be in the range
  /// [-999,999,999, +999,999,999].
  ///
  /// <p><b>Note:</b> Durations less than one second are represented with a 0 {@code seconds} field
  /// and a positive or negative {@code nanos} field. For durations of one second or more, a non-zero
  /// value for the {@code nanos} field must be of the same sign as the {@code seconds} field.
  static bool isValid(Duration duration) {
    return isValidSecNanos(duration.seconds.toInt(), duration.nanos);
  }

  /// Returns true if the given number of seconds and nanos is a valid {@link Duration}. The {@code
  /// seconds} value must be in the range [-315,576,000,000, +315,576,000,000]. The {@code nanos}
  /// value must be in the range [-999,999,999, +999,999,999].
  ///
  /// <p><b>Note:</b> Durations less than one second are represented with a 0 {@code seconds} field
  /// and a positive or negative {@code nanos} field. For durations of one second or more, a non-zero
  /// value for the {@code nanos} field must be of the same sign as the {@code seconds} field.
  static bool isValidSecNanos(num seconds, int nanos) {
    if (seconds < DURATION_SECONDS_MIN || seconds > DURATION_SECONDS_MAX) {
      return false;
    }
    if (nanos < -999999999 || nanos >= Timestamps.NANOS_PER_SECOND) {
      return false;
    }
    if (seconds < 0 || nanos < 0) {
      if (seconds > 0 || nanos > 0) {
        return false;
      }
    }
    return true;
  }

  /// Returns whether the given {@link Duration} is negative or not. */
  static bool isNegative(Duration duration) {
    checkValid(duration);
    return (duration.seconds == 0) ? duration.nanos < 0 : duration.seconds < 0;
  }

  /// Returns whether the given {@link Duration} is positive or not. */
  static bool isPositive(Duration duration) {
    checkValid(duration);
    return !isNegative(duration) && duration != (ZERO);
  }

  /// Ensures that the given {@link Duration} is not negative.
  ///
  /// @throws IllegalArgumentException if {@code duration} is negative or invalid
  /// @throws NullPointerException if {@code duration} is {@code null}
//CanIgnoreReturnValue
  static Duration checkNotNegative(Duration duration) {
    checkArgument(!isNegative(duration), 'duration (%s) must not be negative', durationToString(duration));
    return duration;
  }

  /// Ensures that the given {@link Duration} is positive.
  ///
  /// @throws IllegalArgumentException if {@code duration} is negative, {@code ZERO}, or invalid
  /// @throws NullPointerException if {@code duration} is {@code null}
//CanIgnoreReturnValue
  static Duration checkPositive(Duration duration) {
    checkArgument(isPositive(duration), 'duration (%s) must be positive', durationToString(duration));
    return duration;
  }

  /// Throws an {@link IllegalArgumentException} if the given {@link Duration} is not valid. */
//CanIgnoreReturnValue
  static Duration checkValid(Duration duration) {
    final seconds = duration.seconds.toInt();
    final nanos = duration.nanos;
    if (!isValidSecNanos(seconds, nanos)) {
      throw 'Duration is not valid. See proto definition for valid values.  Seconds ($seconds) must be in range [-315,576,000,000, +315,576,000,000]. Nanos ($nanos) must be in range [-999,999,999, +999,999,999].  Nanos must have the same sign as seconds';
    }
    return duration;
  }

  /// Convert Duration to string format. The string format will contains 3, 6, or 9 fractional digits
  /// depending on the precision required to represent the exact Duration value. For example: "1s",
  /// "1.010s", "1.000000100s", "-3.100s" The range that can be represented by Duration is from
  /// -315,576,000,000 to +315,576,000,000 inclusive (in seconds).
  ///
  /// @return The string representation of the given duration.
  /// @throws IllegalArgumentException if the given duration is not in the valid range.
  static String durationToString(Duration duration) {
    checkValid(duration);

    var seconds = duration.seconds.toInt();
    var nanos = duration.nanos;

    final result = StringBuffer();
    if (seconds < 0 || nanos < 0) {
      result.write('-');
      seconds = -seconds;
      nanos = -nanos;
    }
    result.write(seconds);
    if (nanos != 0) {
      result.write('.');
      result.write(Timestamps.formatNanos(nanos));
    }
    result.write('s');
    return result.toString();
  }

  /// Parse from a string to produce a duration.
  ///
  /// @return A Duration parsed from the string.
  /// @throws ParseException if parsing fails.
  static Duration parse(String value) {
    // Must ended with "s".
    if (value.isEmpty || value[value.length - 1] != 's') {
      throw 'Invalid duration string: $value';
    }
    var negative = false;
    if (value[0] == '-') {
      negative = true;
      value = value.substring(1);
    }
    var secondValue = value.substring(0, value.length - 1);
    var nanoValue = '';
    var pointPosition = secondValue.indexOf('.');
    if (pointPosition != -1) {
      nanoValue = secondValue.substring(pointPosition + 1);
      secondValue = secondValue.substring(0, pointPosition);
    }
    num seconds = int.parse(secondValue);
    var nanos = nanoValue.isEmpty ? 0 : Timestamps.parseNanos(nanoValue);
    if (seconds < 0) {
      throw ('Invalid duration string: $value');
    }
    if (negative) {
      seconds = -seconds;
      nanos = -nanos;
    }
    try {
      return normalizedDuration(seconds, nanos);
    } catch (e) {
      throw ('Duration value is out of range.');
    }
  }

  /// Parses a string in RFC 3339 format into a {@link Duration}.
  ///
  /// <p>Identical to {@link #parse(String)}, but throws an {@link IllegalArgumentException} instead
  /// of a {@link ParseException} if parsing fails.
  ///
  /// @return a {@link Duration} parsed from the string
  /// @throws IllegalArgumentException if parsing fails
  static Duration parseUnchecked(String value) {
    try {
      return parse(value);
    } catch (e) {
      // While `java.time.format.DateTimeParseException` is a more accurate representation of the
      // failure, this library is currently not JDK8 ready because of Android dependencies.
      rethrow;
    }
  }

  // Static factories

  /// Create a Duration from the number of days. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromDays(num days) {
    return Duration(seconds: Int64(IntMath.checkedMultiply(days, SECONDS_PER_DAY)), nanos: 0);
  }

  /// Create a Duration from the number of hours. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromHours(num hours) {
    return Duration(seconds: Int64(IntMath.checkedMultiply(hours, SECONDS_PER_HOUR)), nanos: 0);
  }

  /// Create a Duration from the number of minutes. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromMinutes(num minutes) {
    return Duration(seconds: Int64(IntMath.checkedMultiply(minutes, SECONDS_PER_MINUTE)), nanos: 0);
  }

  /// Create a Duration from the number of seconds. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromSeconds(num seconds) {
    return normalizedDuration(seconds, 0);
  }

  /// Create a Duration from the number of milliseconds. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromMillis(num milliseconds) {
    return normalizedDuration(
        milliseconds / Timestamps.MILLIS_PER_SECOND, (milliseconds % Timestamps.MILLIS_PER_SECOND * Timestamps.NANOS_PER_MILLISECOND));
  }

  /// Create a Duration from the number of microseconds. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromMicros(num microseconds) {
    return normalizedDuration(
        microseconds / Timestamps.MICROS_PER_SECOND, (microseconds % Timestamps.MICROS_PER_SECOND * Timestamps.NANOS_PER_MICROSECOND));
  }

  /// Create a Duration from the number of nanoseconds. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static Duration fromNanos(num nanoseconds) {
    return normalizedDuration(nanoseconds / Timestamps.NANOS_PER_SECOND, (nanoseconds % Timestamps.NANOS_PER_SECOND));
  }

  // Conversion APIs

  /// Convert a Duration to the number of days. The result will be rounded towards 0 to the nearest
  /// day.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toDays(Duration duration) {
    return checkValid(duration).seconds.toInt() / SECONDS_PER_DAY;
  }

  /// Convert a Duration to the number of hours. The result will be rounded towards 0 to the nearest
  /// hour.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toHours(Duration duration) {
    return checkValid(duration).seconds.toInt() / SECONDS_PER_HOUR;
  }

  /// Convert a Duration to the number of minutes. The result will be rounded towards 0 to the
  /// nearest minute.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toMinutes(Duration duration) {
    return checkValid(duration).seconds.toInt() / SECONDS_PER_MINUTE;
  }

  /// Convert a Duration to the number of seconds. The result will be rounded towards 0 to the
  /// nearest second. E.g., if the duration represents -1 nanosecond, it will be rounded to 0.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toSeconds(Duration duration) {
    return checkValid(duration).seconds.toInt();
  }

  /// Returns the number of seconds of the given duration as a {@code double}. This method should be
  /// used to accommodate APIs that <b>only</b> accept durations as {@code double} values.
  ///
  /// <p>This conversion may lose precision.
  ///
  /// <p>If you need the number of seconds in this duration as a {@code long} (not a {@code double}),
  /// simply use {@code duration.seconds} or {@link #toSeconds} (which includes validation).

  static double toSecondsAsDouble(Duration duration) {
    checkValid(duration);
    return duration.seconds.toInt() + duration.nanos / 1e9;
  }

  /// Convert a Duration to the number of milliseconds. The result will be rounded towards 0 to the
  /// nearest millisecond. E.g., if the duration represents -1 nanosecond, it will be rounded to 0.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toMillis(Duration duration) {
    checkValid(duration);
    return IntMath.checkedAdd(
        IntMath.checkedMultiply(duration.seconds.toInt(), Timestamps.MILLIS_PER_SECOND), duration.nanos / Timestamps.NANOS_PER_MILLISECOND);
  }

  /// Convert a Duration to the number of microseconds. The result will be rounded towards 0 to the
  /// nearest microseconds. E.g., if the duration represents -1 nanosecond, it will be rounded to 0.
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toMicros(Duration duration) {
    checkValid(duration);
    return IntMath.checkedAdd(
        IntMath.checkedMultiply(duration.seconds.toInt(), Timestamps.MICROS_PER_SECOND), duration.nanos / Timestamps.NANOS_PER_MICROSECOND);
  }

  /// Convert a Duration to the number of nanoseconds. */
//SuppressWarnings("GoodTime") // this is a legacy conversion API
  static num toNanos(Duration duration) {
    checkValid(duration);
    return IntMath.checkedAdd(IntMath.checkedMultiply(duration.seconds.toInt(), Timestamps.NANOS_PER_SECOND), duration.nanos);
  }

  // Math operations

  /// Add two durations. */
  static Duration add(Duration d1, Duration d2) {
    checkValid(d1);
    checkValid(d2);
    return normalizedDuration(IntMath.checkedAdd(d1.seconds.toInt(), d2.seconds.toInt()), IntMath.checkedAdd(d1.nanos, d2.nanos));
  }

  /// Subtract a duration from another. */
  static Duration subtract(Duration d1, Duration d2) {
    checkValid(d1);
    checkValid(d2);
    return normalizedDuration(IntMath.checkedSubtract(d1.seconds.toInt(), d2.seconds.toInt()), IntMath.checkedSubtract(d1.nanos, d2.nanos));
  }

  static Duration normalizedDuration(num seconds, int nanos) {
    if (nanos <= -Timestamps.NANOS_PER_SECOND || nanos >= Timestamps.NANOS_PER_SECOND) {
      seconds = IntMath.checkedAdd(seconds, nanos / Timestamps.NANOS_PER_SECOND);
      nanos %= Timestamps.NANOS_PER_SECOND;
    }
    if (seconds > 0 && nanos < 0) {
      nanos += Timestamps.NANOS_PER_SECOND; // no overflow since nanos is negative (and we're adding)
      seconds--; // no overflow since seconds is positive (and we're decrementing)
    }
    if (seconds < 0 && nanos > 0) {
      nanos -= Timestamps.NANOS_PER_SECOND; // no overflow since nanos is positive (and we're subtracting)
      seconds++; // no overflow since seconds is negative (and we're incrementing)
    }
    final duration = Duration(seconds: Int64(seconds), nanos: nanos);
    return checkValid(duration);
  }
}

int durationComparator(Duration d1, Duration d2) {
  Durations.checkValid(d1);
  Durations.checkValid(d2);
  final secDiff = d1.seconds.compareTo(d2.seconds);
  return (secDiff != 0) ? secDiff : d1.nanos.compareTo(d2.nanos);
}

void checkArgument(bool expression, String errorMessageTemplate, String errorMessageArgs) {
  if (!expression) {
    throw errorMessageTemplate + ' ' + errorMessageArgs;
  }
}
