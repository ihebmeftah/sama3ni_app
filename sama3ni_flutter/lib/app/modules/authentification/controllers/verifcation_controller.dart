import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/appsnackbar.dart';
import '../../../routes/app_pages.dart';
import 'authentification_controller.dart';

class VerifcationController extends GetxController {
  final authCtr = Get.find<AuthentificationController>();

  final validationformKey = GlobalKey<FormState>();
  final validationCode = TextEditingController();
  void onVerifi() async {
    if (validationformKey.currentState!.validate()) {
      final userInfo = await authCtr.authController.validateAccount(
        Get.parameters['email'] as String,
        validationCode.text,
      );
      if (userInfo != null) {
        Get.back();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        AppSnackbar("Invalid verification code").error();

      }
    }
  }
}
