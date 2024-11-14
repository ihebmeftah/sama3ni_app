import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tracks_controller.dart';

class TracksView extends GetView<TracksController> {
  const TracksView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  appBar: AppBar(),
      body: Center(
        child: Text(
          'TracksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
