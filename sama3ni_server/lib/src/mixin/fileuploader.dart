import 'dart:io';
import 'dart:typed_data';

import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:serverpod/serverpod.dart';

mixin Fileuploader {
  Future<String?> uploadLocaly(
      Session session, ByteData f, String fileName) async {
    final filePath = 'uploads/$fileName';

    final dir = Directory('uploads');
    if (!dir.existsSync()) {
      dir.createSync();
    }
    session.log("// Create the 'uploads' directory if it doesn't exist");
    final file = File(filePath);
    await file.writeAsBytes(f.buffer.asUint8List());
    session.log(" Save the file to the 'uploads' directory ");

    final url = "${Directory.current.path}/$filePath";
    session.log('File uploaded: $url');
    return url;
  }

  Future<Uri?> uploadByteData(
      Session session, ByteData file, String fileName) async {
    var uploadDesc = await session.storage
        .createDirectFileUploadDescription(storageId: 'public', path: fileName);
    if (uploadDesc != null) {
      session.log("upload Desc $uploadDesc");
      final uploader = FileUploader(uploadDesc);
      await uploader.uploadByteData(file);
      bool success = await session.storage
          .verifyDirectFileUpload(storageId: 'public', path: fileName);
      session.log("verify Direct FileUpload $success");
      final x = await session.storage
          .getPublicUrl(storageId: 'public', path: fileName);
      session.log("PUBLIC URL ${x!}");
      return x;
    }
    return null;
  }

  Future<String?> uploadStream(Session session, Stream<List<int>> stream,
      int length, String fileName) async {
    var uploadDesc = await session.storage
        .createDirectFileUploadDescription(storageId: 'public', path: fileName);
    if (uploadDesc != null) {
      session.log("upload Desc $uploadDesc");
      final uploader = FileUploader(uploadDesc);
      final streamup = await uploader.upload(stream, length);
      session.log(" stream $streamup");
      bool success = await session.storage
          .verifyDirectFileUpload(storageId: 'public', path: fileName);
      session.log("verify Direct FileUpload $success");
      final x = await session.storage
          .getPublicUrl(storageId: 'public', path: fileName);
      session.log("PUBLIC URL ${x!}");
    }
    return null;
  }
}

/*

  Future<String?> getUploadDescription(
      Session session, String fileName, List<int> fileBytes) async {
    final filePath = 'uploads/$fileName';

    final dir = Directory('uploads');
    if (!dir.existsSync()) {
      dir.createSync();
    }
    session.log("// Create the 'uploads' directory if it doesn't exist");
    final file = File(filePath);
    await file.writeAsBytes(fileBytes);
    session.log(" Save the file to the 'uploads' directory ");

    final url = "${Directory.current.path}/$filePath";
    session.log('File uploaded: $url');

    var uploadDesc = await session.storage
        .createDirectFileUploadDescription(storageId: 'public', path: url);
    if (uploadDesc != null) {
      var uploader = FileUploader(uploadDesc);
      await uploader
          .uploadByteData(ByteData.view(file.readAsBytesSync().buffer));
      bool success = await session.storage
          .verifyDirectFileUpload(storageId: 'public', path: url);
      session.log(uploadDesc.toString());
      session.log(success.toString());
      session.log(url);
      final publicUrl =
          await session.storage.getPublicUrl(storageId: 'public', path: url);
      session.log(publicUrl!.toString());
    }
    return null;
  }
 */
