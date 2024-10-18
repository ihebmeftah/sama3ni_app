import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class NavbarController extends GetxController {
  final navbarItems = <({String title, IconData icon, String route})>[
    (title: "Home", icon: Icons.home_rounded, route: Routes.HOME),
    (title: "Music", icon: Icons.earbuds_outlined, route: "Music"),
    (title: "Beats", icon: Icons.music_note_rounded, route: "Beats"),
    (title: "Kits", icon: Icons.my_library_music, route: "Kits"),
    (title: "Loops", icon: Icons.play_arrow_rounded, route: "Loops"),
    (title: "Settings", icon: Icons.settings_rounded, route: Routes.SETTING),
  ].obs;

  ({String title, IconData icon, String route}) currentNavBarItem =
      (title: "Home", icon: Icons.home_rounded, route: Routes.HOME);

  void navigateTo(({String title, IconData icon, String route}) nav) {
    if (nav != currentNavBarItem) {
      final old = currentNavBarItem;
      currentNavBarItem = nav;
      update([old.route, nav.route]);
      Get.offAllNamed(nav.route);
    }
  }
}
