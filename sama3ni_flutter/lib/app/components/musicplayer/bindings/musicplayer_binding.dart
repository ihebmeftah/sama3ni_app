import 'package:get/get.dart';

import '../controllers/musicplayer_controller.dart';

class MusicplayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicplayerController>(
      () => MusicplayerController(),
    );
  }
}
