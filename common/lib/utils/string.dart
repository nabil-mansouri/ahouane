part of 'utils.dart';

class StringUtils {
  static final ALPHA_NUM =
      '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static final Random _random = Random.secure();

  static String formatNumber(final num number, final String pattern) {
    final f = intl.NumberFormat(pattern);
    return f.format(number);
  }

  static String uuidV6({final bool disableRandom = false}) {
    //https://github.com/mikemix/php-uuid-v6/blob/master/src/Uuid.php
    //https://github.com/kurttheviking/uuid-with-v6-js/blob/master/index.js
    final raw = uid.Uuid().v1();
    final timeHigh = raw.substring(15, 18);
    final timeMid = raw.substring(9, 13);
    final timeLow1 = raw.substring(0, 5);
    final timeLow2 = raw.substring(5, 8);
    final prefix = '$timeHigh$timeMid${timeLow1}6$timeLow2';
    final prefixFormatted =
        '${prefix.substr(0, 8)}-${prefix.substr(8, 4)}-${prefix.substr(12)}';
    if (disableRandom) {
      final rest = raw.substr(18);
      return '$prefixFormatted$rest';
    }
    final random = ByteUtils.toHex(ByteUtils.randomBytes(8));
    return '$prefixFormatted-${random.substring(0, 4)}-${random.substring(4)}';
  }

  static String cryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }

  static String fromUtf8(Uint8List str) {
    return utf8.decode(str);
  }

  static Uint8List toUtf8(String str) {
    return utf8.encode(str);
  }

  static String fromBase64(String str) {
    return utf8.decode(base64Decode(str));
  }

  static String toBase64(final String str) {
    final bytes = utf8.encode(str);
    return base64.encode(bytes);
  }

  static String randomString(int length) {
    var rand = Random();
    var codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return String.fromCharCodes(codeUnits);
  }

  static bool startsAndEndsWith(
      final String str, final String start, final String end) {
    return str?.startsWith(start) == true && str?.endsWith(end) == true;
  }

  static String removeStartAndEnd(final String str, final String remove,
      [final String removeEnd]) {
    return StringUtils.removeStart(
        StringUtils.removeEnd(str, removeEnd ?? remove), remove);
  }

  static String removeStart(final String str, final String remove) {
    if (isEmpty(str) || isEmpty(remove)) {
      return str;
    }
    if (str.startsWith(remove)) {
      return str.substring(remove.length);
    }
    return str;
  }

  static String substringBefore(final String str, final String separator) {
    if (isEmpty(str) || separator == null) {
      return str;
    }
    if (separator.isEmpty) {
      return '';
    }
    final pos = str.indexOf(separator);
    if (pos == -1) {
      return str;
    }
    return str.substring(0, pos);
  }

  static String substringAfterLast(final String str, final String separator) {
    if (isEmpty(str)) {
      return str;
    }
    final pos = str.lastIndexOf(separator);
    if (pos == -1 || pos == str.length - 1) {
      return '';
    }
    return str.substring(pos + 1);
  }

  static String substringAfter(final String str, final String separator) {
    if (isEmpty(str)) {
      return str;
    }
    final pos = str.indexOf(separator);
    if (pos == -1) {
      return '';
    }
    return str.substring(pos + 1);
  }

  static String removeEnd(final String str, final String remove) {
    if (isEmpty(str) || isEmpty(remove)) {
      return str;
    }
    if (str.endsWith(remove)) {
      return str.substring(0, str.length - remove.length);
    }
    return str;
  }

  static bool isEmpty(final String cs) {
    return cs == null || cs.isEmpty;
  }

  static String generateRandomFromList(int minSize, int maxSize, String list) {
    final diff = maxSize - minSize;
    final buffer = StringBuffer();
    final rand = Random();
    final count = rand.nextInt(diff + 1) + minSize;
    for (var i = 0; i < count; i++) {
      buffer.write(list[rand.nextInt(list.length)]);
    }
    return buffer.toString();
  }

  static String generateRandomAlphaNum(int minSize, [int maxSize]) {
    maxSize = maxSize ?? minSize;
    return generateRandomFromList(minSize, maxSize, ALPHA_NUM);
  }
}

extension StringExt on String {
  //https://tc39.es/ecma262/#sec-string.prototype.substr
  String substr(final int start, [final int length]) {
    //1. Let O be ? RequireObjectCoercible(this value).
    //2. Let S be ? ToString(O).
    final s = this;
    //3. Let size be the length of S.
    final size = s.length;
    //4. Let intStart be ? ToIntegerOrInfinity(start).
    var intStart = start;
    if (intStart.isInfinite || intStart.isNaN) {
      //5. If intStart is -∞, set intStart to 0.
      intStart = 0;
    } else if (intStart < 0) {
      //6. Else if intStart < 0, set intStart to max(size + intStart, 0).
      intStart = max(size + intStart, 0);
    }
    //7. If length is undefined, let intLength be size; otherwise let intLength be ? ToIntegerOrInfinity(length).
    var intLength = length;
    if (length == null || intLength.isInfinite || intLength.isNaN) {
      intLength = size;
    }
    //8. If intStart is +∞, intLength ≤ 0, or intLength is +∞, return the empty String.
    if (intStart.isInfinite && intLength <= 0 || intLength.isInfinite) {
      return '';
    }
    //9. Let intEnd be min(intStart + intLength, size).
    final intEnd = min(intStart + intLength, size);
    //10. If intStart ≥ intEnd, return the empty String.
    if (intStart >= intEnd) {
      return '';
    }
    //11. Return the substring of S from intStart to intEnd.
    return s.substring(intStart, intEnd);
  }
}
