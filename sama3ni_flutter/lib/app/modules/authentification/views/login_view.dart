import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appinput.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetPlatform.isWeb
                    ? MediaQuery.sizeOf(context).width * 0.25
                    : MediaQuery.sizeOf(context).width * 0.1),
            child: Form(
              key: controller.formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppInput(
                    isEmail: true,
                    name: "Email",
                    hint: "Enter your email",
                    ctr: controller.email,
                    isRequired: true,
                  ),
                  AppInput(
                    isPasssword: true,
                    name: "password",
                    hint: "Enter your password",
                    ctr: controller.password,
                    isRequired: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: controller.onLogin,
                      child: const Text("Login")),
                ],
              ),
            ),
          ),
        ));
  }
}
