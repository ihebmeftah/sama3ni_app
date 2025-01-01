import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/artists/controllers/artists_profile_controller.dart';
import 'package:sama3ni_flutter/main.dart';

class ProfileController extends GetxController {
  static final _artistProfileCtr = Get.find<ArtistsProfileController>();

  final formProfile = GlobalKey<FormState>();
  final username = TextEditingController(
          text: _artistProfileCtr.artist.userInfo!.userName),
      address = TextEditingController(text: _artistProfileCtr.artist.address),
      bio = TextEditingController(text: _artistProfileCtr.artist.bio),
      ig = TextEditingController(text: _artistProfileCtr.artist.iglink),
      youtube =
          TextEditingController(text: _artistProfileCtr.artist.youtubelink),
      soundcloud =
          TextEditingController(text: _artistProfileCtr.artist.soundcloudlink);
  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);
    if (result != null) {
      await sessionManager
          .uploadUserImage(ByteData.view(result.files.single.bytes!.buffer));
      sessionManager.addListener(() {
        update();
        log("done from profile controller");
      });
    }
  }

  void updateProfile() async {
    try {
      if (formProfile.currentState!.validate()) {
        await client.artists.updateLoggedArtist(
            displayName: username.text,
            address: address.text,
            bio: bio.text,
            ig: ig.text,
            ytb: youtube.text,
            sc: soundcloud.text);
        Get.back();
        _artistProfileCtr.getArtistById();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
