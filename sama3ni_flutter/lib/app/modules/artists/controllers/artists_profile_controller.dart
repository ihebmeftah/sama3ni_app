import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class ArtistsProfileController extends GetxController with StateMixin {
  final String id = Get.parameters["id"]!;
  bool isMe = Get.parameters["id"]! == "me";
  late Artist artist;
  final tracks = <Track>[].obs;
  @override
  void onInit() {
    getArtistById();
    super.onInit();
  }

  Future<void> getArtistById() async {
    try {
      if (!isMe) {
        artist = await client.artists.getArtistById(int.parse(id));
        tracks.value = await client.tracks.getTracksByArtist(int.parse(id));
      } else {
        artist = await client.artists.getLoggedArtist();
        tracks.value = await client.tracks.getMyTracks();
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
      artist = await client.artists.updateCoverPhoto(
        ByteData.view(result.files.single.bytes!.buffer),
        result.files.single.name,
      );
      change(null, status: RxStatus.success());
    }
  }
}
