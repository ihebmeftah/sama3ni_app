import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/categories/controllers/categories_controller.dart';

import '../controllers/upload_controller.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(
      () => UploadController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
