import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Welcome to Sama3ni! 👋, Let’s begin the adventure...',
                        speed: const Duration(milliseconds: 80),
                        textStyle: TextStyle(
                          color: HexColor("8193b2"),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) => value!.isEmpty ? "Enter email" : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: HexColor("8193b2"),
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                  const SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: controller.onLogin,
                      child: const Text("Login")),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: const Text("I don't have an account")),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        endIndent: 20,
                      )),
                      Text(
                        "Or continue with Google",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                          child: Divider(
                        indent: 20,
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        size: 30,
                        FontAwesomeIcons.google,
                        color: HexColor("8193b2"),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
