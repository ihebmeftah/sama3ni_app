import 'package:get/get.dart';

import '../controllers/loops_controller.dart';

class LoopsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoopsController>(
      () => LoopsController(),
    );
  }
}
