import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class DefaultLayoutController extends GetxController {
  final user = sessionManager.signedInUser;
  final navItems = <({String title, String route})>[
    (title: "Home", route: Routes.HOME),
    (title: "Artists", route: Routes.ARTISTS),
    (title: "Tracks", route: Routes.TRACKS),
    (title: "Categories", route: Routes.CATEGORIES),
    // (title: "Sound kits", route: null),
  ];
  ({String title, String? route})? current =
      (title: "Home", route: Routes.HOME);

  void logout() async {
    final isLoggedOut = await sessionManager.signOutDevice();
    if (isLoggedOut) {
      Get.offAllNamed(Routes.AUTHENTIFICATION);
    }
  }

  bool showNav = true;
  void onChangeRoute(Routing? r) {
    if (r!.current.contains(Routes.AUTHENTIFICATION)) {
      showNav = false;
    } else {
      showNav = true;
    }
    if (navItems.any((element) => element.route == r.current)) {
      current = navItems.firstWhere((element) => element.route == r.current);
    } else {
      current = null;
    }
    update(["showNav"]);
  }
}
