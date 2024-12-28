import 'package:get/get.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthentificationController>(AuthentificationController());
  }
}
