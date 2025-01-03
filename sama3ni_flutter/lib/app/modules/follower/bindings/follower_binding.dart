import 'package:get/get.dart';

import '../controllers/follower_controller.dart';

class FollowerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowerController>(
      () => FollowerController(),
    );
  }
}
