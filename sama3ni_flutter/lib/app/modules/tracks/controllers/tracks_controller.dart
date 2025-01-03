import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

class TracksController extends GetxController {
  final minBpm = TextEditingController(), maxBpm = TextEditingController();
  final minPrice = TextEditingController(), maxPrice = TextEditingController();
  bool onlyFree = false;
  void onChangeBpm(String value) {
    update(["onChangeBpm"]);
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
