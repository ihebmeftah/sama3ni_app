import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/app/components/appsnackbar.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';
import 'package:sama3ni_flutter/main.dart';
import 'package:textfield_tags/textfield_tags.dart';

class UploadController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  Category? category;
  TrackType? trackType;
  Keys? key;
  final title = TextEditingController();
  final bpm = TextEditingController();
  final price = TextEditingController();
  final tags = TextfieldTagsController<String>();
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void uploadTrack() async {
    try {
      if (trackPhoto == null) {
        AppSnackbar("Please upload a cover photo").alert();
      } else {
        if (trackAudio != null) {
          if (form.currentState!.validate()) {
            change(null, status: RxStatus.loading());
            Track track = Track(
              title: title.text,
              audioUrl: title.text,
              type: trackType!,
              genreId: category!.id!,
              audioByte: ByteData.view(trackAudio!.files.single.bytes!.buffer),
              photoByte: ByteData.view(trackPhoto!.files.single.bytes!.buffer),
              tags: tags.getTags!,
              bpm: bpm.text.isEmpty ? null : int.parse(bpm.text),
              key: key,
              price: price.text.isEmpty ? null : double.parse(price.text),
            );
            track = await client.tracks.createTrack(track);
            AppSnackbar("Track uploaded successfully").sucess();
            Get.offAllNamed(
                "${Routes.ARTISTS}/${sessionManager.signedInUser!.id}",
                arguments: 1);
          }
        } else {
          AppSnackbar("Please upload the audio file").alert();
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  FilePickerResult? trackAudio;
  void pickAudio() async {
    trackAudio = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (trackAudio == null) {
      AppSnackbar("No file selected").alert();
    }
    update(["audio"]);
  }

  FilePickerResult? trackPhoto;
  void pickPhoto() async {
    trackPhoto = await FilePicker.platform
        .pickFiles(type: FileType.image, allowCompression: false);
    if (trackPhoto == null) {
      AppSnackbar("No file selected").alert();
    }
    update(["photo"]);
  }

  void selectCategoryy(Category? category) {
    this.category = category;
  }

  void selectKey(Keys? k) {
    key = k;
  }

  void selectTrackType(TrackType? k) {
    trackType = k;
  }
}
