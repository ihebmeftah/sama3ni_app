import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/authentification/controllers/verifcation_controller.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<VerifcationController>(
      () => VerifcationController(),
    );
  }
}
