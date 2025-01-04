import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/main.dart';

import '../../categories/controllers/categories_controller.dart';

class TracksController extends GetxController with StateMixin {
  final tracks = <Track>[].obs;
  final minBpm = TextEditingController(), maxBpm = TextEditingController();
  final minPrice = TextEditingController(), maxPrice = TextEditingController();
  bool onlyFree = false;
  void onChangeBpm(String value) {
    update(["onChangeBpm"]);
  }

  @override
  void onInit() {
    if (Get.parameters["genre"] != null) {
      Category category = Get.find<CategoriesController>()
          .categories
          .firstWhere(
              (element) => element.id.toString() == Get.parameters["genre"]);
      selectedCategory.add(category);
    }
    fetchTracks();
    super.onInit();
  }

  void fetchTracks() async {
    try {
      tracks.value = await client.tracks.getTrack();
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void clearBpm() {
    minBpm.clear();
    maxBpm.clear();
    update(["onChangeBpm"]);
  }

  final List<TrackType> trackTypes = TrackType.values;
  final List<TrackType> selectedTrackTypes = [];

  final List<Keys> keys = Keys.values;
  final List<Keys> selectedKey = [];

  List<Category> selectedCategory = <Category>[];

  void selectCategory(Category category) {
    if (selectedCategory.contains(category)) {
      selectedCategory.remove(category);
    } else {
      selectedCategory.add(category);
    }
    update([category.id!, "selectedCategory"]);
  }

  void clearSelectedCategory() {
    selectedCategory.clear();
    update(["selectedCategory"]);
  }

  void selectTrackType(TrackType trackType) {
    if (selectedTrackTypes.contains(trackType)) {
      selectedTrackTypes.remove(trackType);
    } else {
      selectedTrackTypes.add(trackType);
    }
    update([trackType.name, "selectedTrackTypes"]);
  }

  void clearSelectedTrackType() {
    selectedTrackTypes.clear();
    update(["selectedTrackTypes"]);
  }

  void selectKey(Keys k) {
    if (selectedKey.contains(k)) {
      selectedKey.remove(k);
    } else {
      selectedKey.add(k);
    }
    update([k.name, "selectedKey"]);
  }

  void clearSelectedKey() {
    selectedKey.clear();
    update(["selectedKey"]);
  }
}
