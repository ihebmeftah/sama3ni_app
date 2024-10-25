import 'package:get/get.dart';

import '../controllers/kits_controller.dart';

class KitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KitsController>(
      () => KitsController(),
    );
  }
}
