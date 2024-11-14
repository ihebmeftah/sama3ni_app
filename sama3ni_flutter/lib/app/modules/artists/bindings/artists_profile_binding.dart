import 'package:get/get.dart';

import 'package:sama3ni_flutter/app/modules/artists/controllers/artists_profile_controller.dart';

class ArtistsProfieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtistsProfileController>(
      () => ArtistsProfileController(),
    );
  }
}
