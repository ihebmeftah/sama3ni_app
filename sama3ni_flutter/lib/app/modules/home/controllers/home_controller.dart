import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final category = [
    "Hiphop",
    "Jazz",
    "Rap",
    "Rnb",
    "Country",
  ].obs;

  List<({String title, String value, String icon})> stats = [
    (title: "Tracks", value: "400", icon: "assets/images/songs.png"),
    (title: "Albums", value: "100", icon: "assets/images/album.png"),
    (title: "Beats", value: "999", icon: "assets/images/drums.png"),
    (title: "Sounds kit", value: "100", icon: "assets/images/sounds.png"),
  ];
  final carsouelController = CarouselController();
}
