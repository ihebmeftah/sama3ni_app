import 'dart:developer';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class HomeController extends GetxController {
  final topArtists = <Artist>[].obs;
  final topCategories = <Category>[].obs;
  final topTracks = <Track>[].obs;
  @override
  void onInit() {
    getTopArtists();
    getTopCategories();
    getTopsTracks();
    super.onInit();
  }

  void getTopArtists() async {
    try {
      topArtists.value = await client.artists.getTopArtists();
    } catch (e) {
      log(e.toString());
    }
  }

  void getTopsTracks() async {
    try {
      topTracks.value = await client.tracks.getTopsTracks();
    } catch (e) {
      log(e.toString());
    }
  }

  void getTopCategories() async {
    try {
      topCategories.value = await client.categories.getTopCategories();
    } catch (e) {
      log(e.toString());
    }
  }
}
