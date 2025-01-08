import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class TrackDetailsController extends GetxController with StateMixin {
  final int id = int.parse(Get.parameters["id"]!);
  late Track track;
  final comments = <Comments>[].obs;
  final TextEditingController commentController = TextEditingController();
  @override
  void onInit() {
    getTrackById();
    super.onInit();
  }

  Future<void> getTrackById() async {
    try {
      track = await client.tracks.getTrackById(id);
      await getComments();
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> getComments() async {
    try {
      comments.value = await client.commets.getCommetsByTrack(id);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> addComment() async {
    try {
      if (commentController.text.isNotEmpty) {
        final c =
            await client.commets.addComment(track.id!, commentController.text);
        comments.insert(0, c);
        commentController.clear();
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> removeComment(int index) async {
    try {
      await client.commets.removeComment(comments[index]);
      comments.removeAt(index);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
