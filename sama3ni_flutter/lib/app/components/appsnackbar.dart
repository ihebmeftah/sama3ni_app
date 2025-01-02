import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  String message;
  AppSnackbar(this.message);

  Future<SnackbarController> alert() async {
    await Get.closeCurrentSnackbar();
    return Get.snackbar(
      "Alert",
      message,
      mainButton: TextButton(
          onPressed: () async => await Get.closeCurrentSnackbar(),
          child: const Icon(
            Icons.close,
            color: Colors.red,
          )),
      icon: const Icon(Icons.warning),
      padding: const EdgeInsets.symmetric(vertical: 10),
      colorText: Colors.white,
      backgroundColor: Colors.blueAccent,
      margin: GetPlatform.isMobile
          ? null
          : EdgeInsets.only(right: Get.width * 0.75, left: Get.height * 0.02),
    );
  }

  Future<SnackbarController> sucess() async {
    await Get.closeCurrentSnackbar();
    return Get.snackbar(
      "Success",
      message,
      mainButton: TextButton(
          onPressed: () async => await Get.closeCurrentSnackbar(),
          child: const Icon(
            Icons.close,
            color: Colors.red,
          )),
      icon: const Icon(Icons.done_all),
      padding: const EdgeInsets.symmetric(vertical: 10),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: GetPlatform.isMobile
          ? null
          : EdgeInsets.only(right: Get.width * 0.75, left: Get.height * 0.02),
    );
  }

  Future<SnackbarController> error() async {
    await Get.closeCurrentSnackbar();
    return Get.snackbar(
      "Error",
      message,
      mainButton: TextButton(
          onPressed: () async => await Get.closeCurrentSnackbar(),
          child: const Icon(
            Icons.close,
            color: Colors.red,
          )),
      icon: const Icon(Icons.error),
      padding: const EdgeInsets.symmetric(vertical: 10),
      colorText: Colors.white,
      backgroundColor: Colors.red,
      margin: GetPlatform.isMobile
          ? null
          : EdgeInsets.only(right: Get.width * 0.75, left: Get.height * 0.02),
    );
  }
}
