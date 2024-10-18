import 'dart:io';

import 'package:serverpod/serverpod.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class ExampleEndpoint extends Endpoint {
  Future<String> uploadFile(
      Session session, String fileName, List<int> fileBytes) async {
    final filePath = 'uploads/$fileName';

    // Create the 'uploads' directory if it doesn't exist
    final dir = Directory('uploads');
    if (!dir.existsSync()) {
      dir.createSync();
    }

    // Save the file to the 'uploads' directory
    final file = File(filePath);
    await file.writeAsBytes(fileBytes);

    session.log('File uploaded: $fileName');
    return "${Directory.current.path}/$filePath";
  }
}
