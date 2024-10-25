import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthentificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthentificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
