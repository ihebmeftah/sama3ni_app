import 'package:get/get.dart';

import '../controllers/default_layout_controller.dart';

class DefaultLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DefaultLayoutController>(
      () => DefaultLayoutController(),
    );
  }
}
