library ahouane.utils;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:optional/optional.dart';
import 'package:path/path.dart' as p;
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';
import 'package:universal_io/io.dart';
import 'package:convert/convert.dart';
import 'package:uuid/uuid.dart' as uid;
import 'package:intl/intl.dart' as intl;
import 'package:ahouane_common/generated/google/protobuf/duration.pb.dart' show Duration;
import 'package:ahouane_common/generated/google/protobuf/timestamp.pb.dart' show Timestamp;
part 'byte.dart';
part 'bytes.dart';
part 'date.dart';
part 'durations.dart';
part 'file.dart';
part 'math.dart';
part 'string.dart';
part 'timestamps.dart';

class StreamUtils {
  static Future<Optional<T>> sreamToOptional<T>(Stream<T> stream) async {
    final list = await stream.toList();
    return list.isEmpty ? Optional<T>.empty() : Optional<T>.ofNullable(list.first);
  }
}

class UriUtils {
  static String join(String part1, String part2) {
    return '${StringUtils.removeStartAndEnd(part1, '/')}/${StringUtils.removeStartAndEnd(part2, '/')}';
  }

  static String joinOrAbs(String base, String path) {
    if (base?.isNotEmpty == true && !path.contains('://')) {
      return join(base, path);
    }
    return path;
  }
}

class AHHexUtils {
  static Optional<int> stringToHex(String hexString) {
    if (hexString.startsWith('0x')) {
      hexString = hexString.substring(2);
    }
    try {
      final tmp = int.parse(hexString, radix: 16);
      return tmp.toOptional;
    } catch (e) {
      return Optional.empty();
    }
  }

  static String hexToString(int hex) {
    return hex.toRadixString(16);
  }
}
