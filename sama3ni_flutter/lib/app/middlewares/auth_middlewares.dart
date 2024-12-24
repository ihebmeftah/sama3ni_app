import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_flutter/main.dart';

import '../routes/app_pages.dart';

class AuthMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!sessionManager.isSignedIn) {
      return null;
    }
    return const RouteSettings(name: Routes.HOME);
  }
}
