import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appinput.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
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
                    name: "Username",
                    hint: "Enter your username",
                    isRequired: true,
                    ctr: controller.username,
                  ),
                  AppInput(
                    name: "Email",
                    isEmail: true,
                    hint: "Enter your email",
                    ctr: controller.email,
                    isRequired: true,
                  ),
                  AppInput(
                    name: "Password",
                    isPasssword: true,
                    ctr: controller.password,
                    hint: "Enter your password",
                    isRequired: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: controller.onRegister,
                      child: const Text("Create Account")),
                ],
              ),
            ),
          ),
        ));
  }
}
