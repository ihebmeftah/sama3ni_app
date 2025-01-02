import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/authentification/controllers/authentification_controller.dart';

import '../../../components/appsnackbar.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final authCtr = Get.find<AuthentificationController>();
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();

  final password = TextEditingController();

  void onRegister() async {
    if (formKey.currentState!.validate()) {
      final sendValidationCode = await authCtr.authController
          .createAccountRequest(username.text, email.text, password.text);
      if (sendValidationCode) {
        Get.toNamed(Routes.VERIFCATION, parameters: {'email': email.text});
      } else {
        AppSnackbar("Email already exists or password is weak").error();
      }
    }
  }
}
