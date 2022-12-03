import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtil {
  static String getUniqueFile(String folderName, final String? fileName) {
    int num = 1;

    String destFileName =
        fileName ?? '${DateTime.now().millisecondsSinceEpoch}';

    String extension = path.extension(destFileName);
    String baseName = path.basenameWithoutExtension(destFileName);

    File file = File(folderName + path.separator + destFileName);
    while (file.existsSync()) {
      destFileName = '$baseName (${num++})$extension';
      file = File(folderName + path.separator + destFileName);
    }
    return destFileName;
  }

  /*static Future<File> createUniqueFile(
      String folderName, final String? name) async {
    File uniqueFile = FileUtil.getUniqueFile(folderName, name);
    if (!uniqueFile.existsSync()) {
      await uniqueFile.create();
    }
    return uniqueFile;
  }*/
}