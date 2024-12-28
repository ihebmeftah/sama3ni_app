import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../routes/app_pages.dart';
import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GetPlatform.isWeb
                  ? MediaQuery.sizeOf(context).width * 0.25
                  : MediaQuery.sizeOf(context).width * 0.1),
          child: Column(
            spacing: 40,
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
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          backgroundColor: Colors.blue.shade900,
                          foregroundColor: Colors.grey.shade300,
                          fixedSize: const Size(150, 40)),
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: const Text("Login")),
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          backgroundColor: Colors.red.shade900,
                          foregroundColor: Colors.grey.shade300,
                          fixedSize: const Size(150, 40)),
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: const Text("Create account")),
                ],
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(300, 40),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      foregroundColor: Colors.grey.shade300,
                      iconColor: Colors.grey.shade300),
                  onPressed: () => Get.toNamed(Routes.HOME),
                  icon: const Icon(Icons.earbuds),
                  label: const Text("Continue as guest")),
              const Row(
                spacing: 20,
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
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    size: 30,
                    FontAwesomeIcons.google,
                    color: HexColor("8193b2"),
                  ))
            ],
          ),
        ));
  }
}
