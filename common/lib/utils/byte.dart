part of 'utils.dart';

class ByteUtils {
  static final Random _random = Random.secure();
  static const num SPACE_KB = 1024;
  static const num SPACE_MB = 1024 * SPACE_KB;
  static const num SPACE_GB = 1024 * SPACE_MB;
  static const num SPACE_TB = 1024 * SPACE_GB;
  static String toHex(final List<int> bytes) {
    return hex.encode(bytes);
  }

  static List<int> randomBytes(final int length) {
    return List<int>.generate(length, (i) => _random.nextInt(256));
  }

  static int toBytes(final String value) {
    final valueSafe = (value ?? '').trim().toUpperCase();
    if (valueSafe.endsWith('TB')) {
      return int.parse(valueSafe.replaceAll('TB', '')) * SPACE_TB;
    } else if (valueSafe.endsWith('GB')) {
      return int.parse(valueSafe.replaceAll('GB', '')) * SPACE_GB;
    } else if (valueSafe.endsWith('MB')) {
      return int.parse(valueSafe.replaceAll('MB', '')) * SPACE_MB;
    } else if (valueSafe.endsWith('KB')) {
      return int.parse(valueSafe.replaceAll('KB', '')) * SPACE_KB;
    } else if (valueSafe.endsWith('B')) {
      return int.parse(valueSafe.replaceAll('B', ''));
    } else {
      return int.parse(valueSafe);
    }
  }
}
