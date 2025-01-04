import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class ArtistsProfileController extends GetxController with StateMixin {
  final String id = Get.parameters["id"]!;
  bool isMe =
      Get.parameters["id"]! == sessionManager.signedInUser?.id.toString();
  late Artist artist;
  final tracks = <Track>[].obs;
  @override
  void onInit() async {
    await getArtistById();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getArtistById() async {
    try {
      artist = await client.artists.getArtistById(int.parse(id));
      tracks.value = await client.tracks.getTracksByArtist(int.parse(id));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updateCoverPhoto() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);
    if (result != null) {
      artist = await client.artists.updateCoverPhoto(
        ByteData.view(result.files.single.bytes!.buffer),
        result.files.single.name,
      );
      change(null, status: RxStatus.success());
    }
  }
}
