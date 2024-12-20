import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthentificationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void onLogin() {
    if (formKey.currentState!.validate()) {}
  }
}
