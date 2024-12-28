import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../main.dart';

class AuthentificationController extends GetxController {
  final authController = EmailAuthController(client.modules.auth);

}
