import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';
import 'package:sama3ni_flutter/main.dart';

class UploadController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  Category? category;
  final title = TextEditingController();
  final bpm = TextEditingController();
  final key = TextEditingController();
  final audio = TextEditingController();
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void uploadTrack() async {
    try {
      if (form.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        Track track = Track(
            title: title.text,
            genreId: category!.id!,
            audio: audio.text,
            artistId: sessionManager.signedInUser!.id!);
        await client.tracks.createTrack(
            track, ByteData.view(result!.files.single.bytes!.buffer));
        Get.offAllNamed("${Routes.ARTISTS}/${track.artistId}");
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  FilePickerResult? result;
  void pickAudio() async {
    result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result == null) {
      Get.snackbar("Error", "No file selected");
    } else {
      audio.text = result!.files.single.name;
    }
  }

  void selectCategoryy(Category? category) {
    this.category = category;
  }
}
