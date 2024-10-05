part of 'utils.dart';

class FileUtils {
  static String getFileName(String path) {
    return p.basename(path);
  }

  static Future<File> createTmpFile(String prefix) async {
    final dir = Directory.systemTemp;
    final random = StringUtils.generateRandomAlphaNum(10);
    final filename = '$prefix-${DateUtils.formatNow(DateUtils.YYYYMMDDhhmmss)}-$random';
    final filePath = p.join(dir.absolute.path, filename);
    final _file = File(filePath);
    return _file.create();
  }

  static Future<File> createTmpFileInDirectory(Directory workspace, String prefix) {
    final random = StringUtils.generateRandomAlphaNum(10);
    final filename = '$prefix-${DateUtils.formatNow(DateUtils.YYYYMMDDhhmmss)}-$random';
    final filePath = p.join(workspace.absolute.path, filename);
    final file = File(filePath);
    return file.create();
  }
}
