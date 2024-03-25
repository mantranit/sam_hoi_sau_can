import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../constant.dart';

class FontSizeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/fontSize.txt');
  }

  Future<double> readFromFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return double.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return defaultFontSize;
    }
  }

  Future<File> writeToFile(double fontSize) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$fontSize');
  }
}
