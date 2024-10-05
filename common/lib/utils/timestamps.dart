part of 'utils.dart';

class Timestamps {
  // Timestamp for "0001-01-01T00:00:00Z"
  static final num TIMESTAMP_SECONDS_MIN = -62135596800;

  // Timestamp for "9999-12-31T23:59:59Z"
  static final num TIMESTAMP_SECONDS_MAX = 253402300799;

  static final num NANOS_PER_SECOND = 1000000000;
  static final num NANOS_PER_MILLISECOND = 1000000;
  static final num NANOS_PER_MICROSECOND = 1000;
  static final num MILLIS_PER_SECOND = 1000;
  static final num MICROS_PER_SECOND = 1000000;

  /// A constant holding the minimum valid {@link Timestamp}, {@code 0001-01-01T00:00:00Z}. */
  static final Timestamp MIN_VALUE = Timestamp(seconds: Int64(TIMESTAMP_SECONDS_MIN), nanos: 0);

  /// A constant holding the maximum valid {@link Timestamp}, {@code 9999-12-31T23:59:59.999999999Z}.
  static final Timestamp MAX_VALUE = Timestamp(seconds: Int64(TIMESTAMP_SECONDS_MAX), nanos: 999999999);

  /// A constant holding the {@link Timestamp} of epoch time, {@code 1970-01-01T00:00:00.000000000Z}.
  static final Timestamp EPOCH = Timestamp(seconds: Int64(0), nanos: 0);

  static DateFormat createTimestampFormat() {
    final sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    return sdf;
  }

  Timestamps();

  /// Compares two timestamps. The value returned is identical to what would be returned by: {@code
  /// Timestamps.comparator().compare(x, y)}.
  ///
  /// @return the value {@code 0} if {@code x == y}; a value less than {@code 0} if {@code x < y};
  ///     and a value greater than {@code 0} if {@code x > y}
  static int compare(Timestamp x, Timestamp y) {
    return timestampComparator(x, y);
  }

  /// Returns true if the given {@link Timestamp} is valid. The {@code seconds} value must be in the
  /// range [-62,135,596,800, +253,402,300,799] (i.e., between 0001-01-01T00:00:00Z and
  /// 9999-12-31T23:59:59Z). The {@code nanos} value must be in the range [0, +999,999,999].
  ///
  /// <p><b>Note:</b> Negative second values with fractional seconds must still have non-negative
  /// nanos values that count forward in time.
  static bool isValid(Timestamp timestamp) {
    return isValidSecondsNanos(timestamp.seconds.toInt(), timestamp.nanos);
  }

  /// Returns true if the given number of seconds and nanos is a valid {@link Timestamp}. The {@code
  /// seconds} value must be in the range [-62,135,596,800, +253,402,300,799] (i.e., between
  /// 0001-01-01T00:00:00Z and 9999-12-31T23:59:59Z). The {@code nanos} value must be in the range
  /// [0, +999,999,999].
  ///
  /// <p><b>Note:</b> Negative second values with fractional seconds must still have non-negative
  /// nanos values that count forward in time.
  static bool isValidSecondsNanos(num seconds, int nanos) {
    if (seconds < TIMESTAMP_SECONDS_MIN || seconds > TIMESTAMP_SECONDS_MAX) {
      return false;
    }
    if (nanos < 0 || nanos >= NANOS_PER_SECOND) {
      return false;
    }
    return true;
  }

  /// Throws an {@link IllegalArgumentException} if the given {@link Timestamp} is not valid. */
  static Timestamp checkValid(Timestamp timestamp) {
    final seconds = timestamp.seconds.toInt();
    var nanos = timestamp.nanos;
    if (!isValidSecondsNanos(seconds, nanos)) {
      throw 'Timestamp is not valid. See proto definition for valid values.  Seconds ($seconds) must be in range [-62,135,596,800, +253,402,300,799]. Nanos ($nanos) must be in range [0, +999,999,999].';
    }
    return timestamp;
  }

  /// Convert Timestamp to RFC 3339 date string format. The output will always be Z-normalized and
  /// uses 3, 6 or 9 fractional digits as required to represent the exact value. Note that Timestamp
  /// can only represent time from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. See
  /// https://www.ietf.org/rfc/rfc3339.txt
  ///
  /// <p>Example of generated format: "1972-01-01T10:00:20.021Z"
  ///
  /// @return The string representation of the given timestamp.
  /// @throws IllegalArgumentException if the given timestamp is not in the valid range.
  static String timestampToString(Timestamp timestamp) {
    checkValid(timestamp);

    final seconds = timestamp.seconds.toInt();
    final nanos = timestamp.nanos;

    final result = StringBuffer();
    // Format the seconds part.
    final date = DateTime.fromMicrosecondsSinceEpoch(seconds * MILLIS_PER_SECOND);
    result.write(createTimestampFormat().format(date));
    // Format the nanos part.
    if (nanos != 0) {
      result.write('.');
      result.write(formatNanos(nanos));
    }
    result.write('Z');
    return result.toString();
  }

  /// Parse from RFC 3339 date string to Timestamp. This method accepts all outputs of {@link
  /// #toString(Timestamp)} and it also accepts any fractional digits (or none) and any offset as
  /// num as they fit into nano-seconds precision.
  ///
  /// <p>Example of accepted format: "1972-01-01T10:00:20.021-05:00"
  ///
  /// @return A Timestamp parsed from the string.
  /// @throws ParseException if parsing fails.
  static Timestamp parse(String value) {
    var dayOffset = value.indexOf('T');
    if (dayOffset == -1) {
      throw 'Failed to parse timestamp: invalid timestamp $value';
    }
    var timezoneOffsetPosition = value.indexOf('Z', dayOffset);
    if (timezoneOffsetPosition == -1) {
      timezoneOffsetPosition = value.indexOf('+', dayOffset);
    }
    if (timezoneOffsetPosition == -1) {
      timezoneOffsetPosition = value.indexOf('-', dayOffset);
    }
    if (timezoneOffsetPosition == -1) {
      throw ('Failed to parse timestamp: missing valid timezone offset.');
    }
    // Parse seconds and nanos.
    var timeValue = value.substring(0, timezoneOffsetPosition);
    var secondValue = timeValue;
    var nanoValue = '';
    var pointPosition = timeValue.indexOf('.');
    if (pointPosition != -1) {
      secondValue = timeValue.substring(0, pointPosition);
      nanoValue = timeValue.substring(pointPosition + 1);
    }
    final date = createTimestampFormat().parse(secondValue);
    num seconds = date.millisecondsSinceEpoch / MILLIS_PER_SECOND;
    var nanos = nanoValue.isEmpty ? 0 : parseNanos(nanoValue);
    // Parse timezone offsets.
    if (value[timezoneOffsetPosition] == 'Z') {
      if (value.length != timezoneOffsetPosition + 1) {
        throw ('Failed to parse timestamp: invalid trailing data "${value.substring(timezoneOffsetPosition)}"');
      }
    } else {
      var offsetValue = value.substring(timezoneOffsetPosition + 1);
      var offset = parseTimezoneOffset(offsetValue);
      if (value[timezoneOffsetPosition] == '+') {
        seconds -= offset;
      } else {
        seconds += offset;
      }
    }
    try {
      return normalizedTimestamp(seconds, nanos);
    } catch (e) {
      throw 'Failed to parse timestamp: timestamp is out of range.';
    }
  }

  /// Parses a string in RFC 3339 format into a {@link Timestamp}.
  ///
  /// <p>Identical to {@link #parse(String)}, but throws an {@link IllegalArgumentException} instead
  /// of a {@link ParseException} if parsing fails.
  ///
  /// @return a {@link Timestamp} parsed from the string
  /// @throws IllegalArgumentException if parsing fails
  static Timestamp parseUnchecked(String value) {
    try {
      return parse(value);
    } catch (e) {
      // While `java.time.format.DateTimeParseException` is a more accurate representation of the
      // failure, this library is currently not JDK8 ready because of Android dependencies.
      rethrow;
    }
  }

  /// Create a Timestamp from the number of seconds elapsed from the epoch. */
  static Timestamp fromSeconds(num seconds) {
    return normalizedTimestamp(seconds, 0);
  }

  /// Convert a Timestamp to the number of seconds elapsed from the epoch.
  ///
  /// <p>The result will be rounded down to the nearest second. E.g., if the timestamp represents
  /// "1969-12-31T23:59:59.999999999Z", it will be rounded to -1 second.
  static num toSeconds(Timestamp timestamp) {
    return checkValid(timestamp).seconds.toInt();
  }

  /// Create a Timestamp from the number of milliseconds elapsed from the epoch. */
  static Timestamp fromMillis(num milliseconds) {
    return normalizedTimestamp(milliseconds / MILLIS_PER_SECOND, (milliseconds % MILLIS_PER_SECOND * NANOS_PER_MILLISECOND));
  }

  /// Create a Timestamp from a java.util.Date. If the java.util.Date is a java.sql.Timestamp,
  /// full nanonsecond precision is retained.
  ///
  /// @throws IllegalArgumentException if the year is before 1 CE or after 9999 CE
  static Timestamp fromDate(DateTime date) {
    return fromMillis(date.millisecondsSinceEpoch);
  }

  /// Convert a Timestamp to the number of milliseconds elapsed from the epoch.
  ///
  /// <p>The result will be rounded down to the nearest millisecond. E.g., if the timestamp
  /// represents "1969-12-31T23:59:59.999999999Z", it will be rounded to -1 millisecond.
  static num toMillis(Timestamp timestamp) {
    checkValid(timestamp);
    return IntMath.checkedAdd(
        IntMath.checkedMultiply(timestamp.seconds.toInt(), MILLIS_PER_SECOND), timestamp.nanos / NANOS_PER_MILLISECOND);
  }

  /// Create a Timestamp from the number of microseconds elapsed from the epoch. */
  static Timestamp fromMicros(num microseconds) {
    return normalizedTimestamp(microseconds / MICROS_PER_SECOND, (microseconds % MICROS_PER_SECOND * NANOS_PER_MICROSECOND));
  }

  /// Convert a Timestamp to the number of microseconds elapsed from the epoch.
  ///
  /// <p>The result will be rounded down to the nearest microsecond. E.g., if the timestamp
  /// represents "1969-12-31T23:59:59.999999999Z", it will be rounded to -1 microsecond.
  static num toMicros(Timestamp timestamp) {
    checkValid(timestamp);
    return IntMath.checkedAdd(
        IntMath.checkedMultiply(timestamp.seconds.toInt(), MICROS_PER_SECOND), timestamp.nanos / NANOS_PER_MICROSECOND);
  }

  /// Create a Timestamp from the number of nanoseconds elapsed from the epoch. */
  static Timestamp fromNanos(num nanoseconds) {
    return normalizedTimestamp(nanoseconds / NANOS_PER_SECOND, (nanoseconds % NANOS_PER_SECOND));
  }

  /// Convert a Timestamp to the number of nanoseconds elapsed from the epoch. */
  static num toNanos(Timestamp timestamp) {
    checkValid(timestamp);
    return IntMath.checkedAdd(IntMath.checkedMultiply(timestamp.seconds.toInt(), NANOS_PER_SECOND), timestamp.nanos);
  }

  /// Calculate the difference between two timestamps. */
  static Duration between(Timestamp from, Timestamp to) {
    checkValid(from);
    checkValid(to);
    return Durations.normalizedDuration(
        IntMath.checkedSubtract(to.seconds.toInt(), from.seconds.toInt()), IntMath.checkedSubtract(to.nanos, from.nanos));
  }

  /// Add a duration to a timestamp. */
  static Timestamp add(Timestamp start, Duration length) {
    checkValid(start);
    Durations.checkValid(length);
    return normalizedTimestamp(
        IntMath.checkedAdd(start.seconds.toInt(), length.seconds.toInt()), IntMath.checkedAdd(start.nanos, length.nanos));
  }

  /// Subtract a duration from a timestamp. */
  static Timestamp subtract(Timestamp start, Duration length) {
    checkValid(start);
    Durations.checkValid(length);
    return normalizedTimestamp(
        IntMath.checkedSubtract(start.seconds.toInt(), length.seconds.toInt()), IntMath.checkedSubtract(start.nanos, length.nanos));
  }

  static Timestamp normalizedTimestamp(num seconds, int nanos) {
    if (nanos <= -NANOS_PER_SECOND || nanos >= NANOS_PER_SECOND) {
      seconds = IntMath.checkedAdd(seconds, nanos / NANOS_PER_SECOND);
      nanos = (nanos % NANOS_PER_SECOND);
    }
    if (nanos < 0) {
      nanos = (nanos + NANOS_PER_SECOND); // no overflow since nanos is negative (and we're adding)
      seconds = IntMath.checkedSubtract(seconds, 1);
    }
    final timestamp = Timestamp(seconds: Int64(seconds), nanos: nanos);
    return checkValid(timestamp);
  }

  static num parseTimezoneOffset(String value) {
    var pos = value.indexOf(':');
    if (pos == -1) {
      throw ('Invalid offset value: $value');
    }
    var hours = value.substring(0, pos);
    var minutes = value.substring(pos + 1);
    return (int.parse(hours) * 60 + int.parse(minutes)) * 60;
  }

  static int parseNanos(String value) {
    var result = 0;
    for (var i = 0; i < 9; ++i) {
      result = result * 10;
      if (i < value.length) {
        if (value[i].codeUnitAt(0) < '0'.codeUnitAt(0) || value[i].codeUnitAt(0) > '9'.codeUnitAt(0)) {
          throw ('Invalid nanoseconds.');
        }
        result += value[i].codeUnitAt(0) - '0'.codeUnitAt(0);
      }
    }
    return result;
  }

  /// Format the nano part of a timestamp or a duration. */
  static String formatNanos(int nanos) {
    // Determine whether to use 3, 6, or 9 digits for the nano part.
    if (nanos % NANOS_PER_MILLISECOND == 0) {
      return sprintf('%1\$03d', nanos / NANOS_PER_MILLISECOND);
    } else if (nanos % NANOS_PER_MICROSECOND == 0) {
      return sprintf('%1\$06d', nanos / NANOS_PER_MICROSECOND);
    } else {
      return sprintf('%1\$09d', nanos);
    }
  }
}

int timestampComparator(Timestamp t1, Timestamp t2) {
  Timestamps.checkValid(t1);
  Timestamps.checkValid(t2);
  final secDiff = t1.seconds.compareTo(t2.seconds);
  return (secDiff != 0) ? secDiff : t1.nanos.compareTo(t2.nanos);
}
