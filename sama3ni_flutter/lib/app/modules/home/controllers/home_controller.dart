import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final navItems = [
    "Browse",
    "How it works",
    "About",
    "Contact",
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    update([currentIndex]);
    currentIndex = index;
    update([index]);
  }

  final category = [
    "Hiphop",
    "Rock",
    "Jazz",
    "Pop",
    "Classical",
    "Rap",
    "Rnb",
    "Country",
    "Blues",
    "Electronic"
  ].obs;

  List<({String title, String value, String icon})> stats = [
    (title: "Tracks", value: "400", icon: "assets/images/songs.png"),
    (title: "Albums", value: "100", icon: "assets/images/album.png"),
    (title: "Beats", value: "999", icon: "assets/images/drums.png"),
    (title: "Sounds kit", value: "100", icon: "assets/images/sounds.png"),
  ];
  final carsouelController = CarouselController();
  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {});
    super.onInit();
  }
}
