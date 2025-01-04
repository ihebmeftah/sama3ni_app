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
  void onInit() async {
    if (Get.parameters["genre"] != null) {
      Category category = Get.put<CategoriesController>(CategoriesController())
          .categories
          .firstWhere(
              (element) => element.id.toString() == Get.parameters["genre"]);
      selectedCategory.add(category);
    }
    await fetchTracks();
    super.onInit();
  }

  Future<void> fetchTracks() async {
    try {
      tracks.value = await client.tracks.getTrack();
      for (var t in tracks) {
        if (!categories.any((c) => c.id == t.genreId)) {
          categories.add(t.genre!);
        }
      }

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
  RxList<Category> categories = <Category>[].obs;

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
