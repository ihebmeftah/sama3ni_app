import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kits_controller.dart';

class KitsView extends GetView<KitsController> {
  const KitsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KitsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KitsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
