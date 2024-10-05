part of 'validation.dart';

class TimestampValidation {
  TimestampValidation();

  static bool isWithin(Timestamp value, Duration duration, Timestamp when) {
    try {
      within('', value, duration, when);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void within(String field, Timestamp value, Duration duration, Timestamp when) {
    final between = Timestamps.between(when, value);
    if (Durations.toNanos(between).abs().compareTo(Durations.toNanos(duration).abs()) == 1) {
      throw ValidationException(
          field, '$value', 'value must be within ' + Durations.durationToString(duration) + ' of ' + Timestamps.timestampToString(when));
    }
  }

  /// Converts {@code seconds} and {@code nanos} to a protobuf {@code Timestamp}.
  static Timestamp toTimestamp(num seconds, int nanos) {
    return Timestamp(seconds: Int64(seconds), nanos: nanos);
  }

  /// Converts {@code seconds} and {@code nanos} to a protobuf {@code Duration}.
  static Duration toDuration(num seconds, num nanos) {
    return Duration(seconds: Int64(seconds), nanos: nanos);
  }

  static Timestamp currentTimestamp() {
    return Timestamps.fromMillis(DateTime.now().millisecondsSinceEpoch);
  }
}
