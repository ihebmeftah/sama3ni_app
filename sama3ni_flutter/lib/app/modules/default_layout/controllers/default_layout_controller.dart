import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class DefaultLayoutController extends GetxController {
  final user = sessionManager.signedInUser;
  final navItems = <({String title, String? route})>[
    (title: "Home", route: Routes.HOME),
    (title: "Artists", route: Routes.ARTISTS),
    (title: "Tracks", route: null),
    (title: "Sound kits", route: null),
  ];
  ({String title, String? route}) currentIndex =
      (title: "Home", route: Routes.HOME);
  void changeIndex(({String title, String? route}) data) {
    if (data.route != null) {
      update([currentIndex.route!]);
      currentIndex = data;
      update([data.route!]);
      Get.toNamed(data.route!);
    }
  }

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
    update(["showNav"]);
  }
}
