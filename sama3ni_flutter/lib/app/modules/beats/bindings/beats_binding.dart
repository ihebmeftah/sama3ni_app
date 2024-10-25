import 'package:get/get.dart';

import '../controllers/beats_controller.dart';

class BeatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeatsController>(
      () => BeatsController(),
    );
  }
}
