import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class ArtistsProfileController extends GetxController with StateMixin {
  final String id = Get.parameters["id"]!;
  bool isMe = Get.parameters["id"]! == "me";
  late Artist artist;
  @override
  void onInit() {
    getArtistById();
    super.onInit();
  }

  Future<void> getArtistById() async {
    try {
      if (!isMe) {
        artist = await client.artists.getArtistById(int.parse(id));
      } else {
        artist = await client.artists.getLoggedArtist();
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updateCoverPhoto() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      artist = await client.artists.updateCoverPhoto(result.files.single.name,
          ByteData.view(result.files.single.bytes!.buffer));
      change(null, status: RxStatus.success());
    }
  }
}
