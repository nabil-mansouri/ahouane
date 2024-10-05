part of 'http.dart';

class Range {
  final int begin;
  final int end;
  Range(this.begin, this.end);
  bool get hasStart => begin != null;
  factory Range.fromString(String value) {
    value = value.toLowerCase().trim();
    try {
      value = StringUtils.removeStart(value, 'bytes=');
      if (value.startsWith('-')) {
        value = StringUtils.removeStart(value, '-');
        return Range(null, int.parse(value));
      } else {
        final split = value.split('-');
        if (split.length != 2) {
          throw RangeNotSatisfiableException('Cannot parse range: $value');
        }
        return Range(int.parse(split[0]), int.parse(split[1]));
      }
    } catch (e) {
      if (e is RangeNotSatisfiableException) rethrow;
      throw RangeNotSatisfiableException('Cannot parse range: $value');
    }
  }
  static List<Range> parseAll(List<String> values) {
    final ranges = <Range>[];
    for (final value in values) {
      ranges.add(Range.fromString(value));
    }
    return ranges;
  }

  String toResponseString(int totalLen) {
    final valid = getValidRange(totalLen);
    return 'bytes ${valid.begin}-${valid.end}/$totalLen';
  }

  bool isValid(int totalLen) {
    return 0 <= begin && begin <= end && end <= totalLen;
  }

  Range getValidRange(int totalLen) {
    if (hasStart) {
      return this;
    } else {
      final start = totalLen - this.end;
      final end = totalLen;
      return Range(start, end);
    }
  }
}
