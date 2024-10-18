import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class TestController extends GetxController with StateMixin {
  var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
  File? file; // for mobiles
  PlatformFile? platformFile; // for web
  final textController = TextEditingController();
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if (kIsWeb && GetPlatform.isWeb) {
        platformFile = result.files.first;
      } else {
        file = File(result.files.single.path!);
      }
      update(['file']);
    }
  }

  final tasks = <Tasks>[].obs;
  void createTask() async {
    try {
      final photo = await client.example.uploadFile(
        kIsWeb && GetPlatform.isWeb
            ? platformFile!.name
            : file!.path.split("/").last,
        kIsWeb && GetPlatform.isWeb
            ? platformFile!.bytes!
            : file!.readAsBytesSync(),
      );
      final task = Tasks(
        name: textController.text,
        photo: photo,
      );
      await client.task.createTask(task);
      await getTasks();
      platformFile = null;
      textController.clear();
    } catch (e) {
      change(null, status: RxStatus.error());
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getTasks();
    super.onInit();
  }

  Future<void> getTasks() async {
    try {
      change(null, status: RxStatus.loading());
      tasks.value = await client.task.getTasks();
      change(null, status: RxStatus.success());
    } catch (e) {
      log(e.toString());
    }
  }
}
