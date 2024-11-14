import 'package:get/get.dart';


import '../controllers/artists_controller.dart';

class ArtistsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtistsController>(
      () => ArtistsController(),
    );
  }
}
