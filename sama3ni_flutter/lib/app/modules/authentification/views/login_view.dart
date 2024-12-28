import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

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
                  TextFormField(
                    controller: controller.email,
                    validator: (value) => value!.isEmpty ? "Enter email" : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: HexColor("8193b2"),
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                  TextFormField(
                    controller: controller.password,
                    validator: (value) =>
                        value!.isEmpty ? "Enter password" : null,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: HexColor("8193b2"),
                      ),
                      hintText: "Enter your password",
                    ),
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
