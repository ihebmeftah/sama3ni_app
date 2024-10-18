import 'dart:io';

abstract class FileUpload {
  FileUpload._(); // Save the uploaded file to a local directory
  static Future<String> uploadFile(String fileName, List<int> fileBytes) async {
    final filePath = 'uploads/$fileName';

    // Create the 'uploads' directory if it doesn't exist
    final dir = Directory('uploads');
    if (!dir.existsSync()) {
      dir.createSync();
    }

    // Save the file to the 'uploads' directory
    final file = File(filePath);
    await file.writeAsBytes(fileBytes);
    return "${Directory.current.path}/$filePath";
  }

  // Optionally, you can retrieve the uploaded file by its filename
  Future<List<int>> downloadFile(String fileName) async {
    final filePath = 'uploads/$fileName';
    final file = File(filePath);

    if (!file.existsSync()) {
      throw Exception('File not found');
    }

    return await file.readAsBytes();
  }
}
