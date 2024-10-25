import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/beats_controller.dart';

class BeatsView extends GetView<BeatsController> {
  const BeatsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeatsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BeatsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
