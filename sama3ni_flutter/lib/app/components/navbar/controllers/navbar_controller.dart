import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class NavbarController extends GetxController {
  final navbarItems = <({String title, IconData icon, String route})>[
    (title: "Home", icon: Icons.home_rounded, route: Routes.HOME),
    (title: "Artists", icon: Icons.person_2_outlined, route: Routes.ARTISTS),
    (title: "Tracks", icon: Icons.earbuds_outlined, route: Routes.TRACKS),
    (title: "Music", icon: Icons.earbuds_outlined, route: Routes.MUSIC),
    (title: "Beats", icon: Icons.music_note_rounded, route: Routes.BEATS),
    (title: "Kits", icon: Icons.my_library_music, route: Routes.KITS),
    (title: "Loops", icon: Icons.play_arrow_rounded, route: Routes.LOOPS),
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
