import 'dart:developer';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/main.dart';

class CategoriesController extends GetxController with StateMixin {
  final categories = <Category>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
    change(null, status: RxStatus.success());
  }

  Future<void> getCategories() async {
    try {
      categories(await client.categories.getCategories());
    } catch (e) {
      log(e.toString());
    }
  }
}
