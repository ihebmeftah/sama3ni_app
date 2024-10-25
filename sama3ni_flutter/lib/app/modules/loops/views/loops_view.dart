import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loops_controller.dart';

class LoopsView extends GetView<LoopsController> {
  const LoopsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoopsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoopsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
