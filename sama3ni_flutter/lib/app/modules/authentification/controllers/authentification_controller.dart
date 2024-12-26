import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class AuthentificationController extends GetxController {
  final authController = EmailAuthController(client.modules.auth);

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  final rformKey = GlobalKey<FormState>();
  final remail = TextEditingController();
  final rusername = TextEditingController();

  final rpassword = TextEditingController();
  void onLogin() async {
    if (formKey.currentState!.validate()) {
      final userInfo = await authController.signIn(email.text, password.text);
      if (userInfo != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Invalid email or password");
      }
    }
  }

  final validationformKey = GlobalKey<FormState>();
  final validationCode = TextEditingController();
  void onRegister() async {
    if (rformKey.currentState!.validate()) {
      final sendValidationCode = await authController.createAccountRequest(
          rusername.text, remail.text, rpassword.text);
      if (sendValidationCode) {
        Get.defaultDialog(
          barrierDismissible: false,
          onConfirm: () async {
            if (validationformKey.currentState!.validate()) {
              final userInfo = await authController.validateAccount(
                  remail.text, validationCode.text);
              if (userInfo != null) {
                Get.back();
                Get.offAllNamed(Routes.HOME);
              }
            }
          },
          middleText: "Please check your email for the verification code.",
          title: "Verification Code",
          content: Form(
              key: validationformKey,
              child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the verification code';
                    }
                    return null;
                  },
                  controller: validationCode)),
        );
      }
    }
  }
}
