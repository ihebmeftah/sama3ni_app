import 'package:get/get.dart';

import 'package:sama3ni_flutter/app/modules/tracks/controllers/track_details_controller.dart';


class TrackDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackDetailsController>(
      () => TrackDetailsController(),
    );

  }
}
