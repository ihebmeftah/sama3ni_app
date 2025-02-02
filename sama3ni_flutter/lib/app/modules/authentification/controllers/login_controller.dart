import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appsnackbar.dart';
import '../../../routes/app_pages.dart';
import 'authentification_controller.dart';

class LoginController extends GetxController {
  final authCtr = Get.find<AuthentificationController>();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void onLogin() async {
    if (formKey.currentState!.validate()) {
      final userInfo =
          await authCtr.authController.signIn(email.text, password.text);
      if (userInfo != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        AppSnackbar("Invalid email or password").error();
      }
    }
  }
}
