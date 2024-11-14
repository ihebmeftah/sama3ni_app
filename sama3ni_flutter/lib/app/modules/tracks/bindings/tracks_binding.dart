import 'package:get/get.dart';

import '../controllers/tracks_controller.dart';

class TracksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TracksController>(
      () => TracksController(),
    );
  }
}
