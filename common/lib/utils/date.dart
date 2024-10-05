part of 'utils.dart';

class DateUtils {
  static final String YYYYMMDDhhmmss = 'yyyyMMddhhmmsss';
  static String formatNow(String format) {
    final dFormat = DateFormat(format);
    return dFormat.format(DateTime.now());
  }
}