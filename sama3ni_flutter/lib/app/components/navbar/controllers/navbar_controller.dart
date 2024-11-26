import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class NavbarController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final navbarItems = <({String title, IconData icon, String route})>[
    (title: "Home", icon: Icons.home_rounded, route: Routes.HOME),
    (title: "Artists", icon: Icons.person_2_outlined, route: Routes.ARTISTS),
  ].obs;

  ({String title, IconData icon, String route}) currentNavBarItem =
      (title: "Home", icon: Icons.home_rounded, route: Routes.HOME);

  void navigateTo(({String title, IconData icon, String route}) nav) {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
    if (nav != currentNavBarItem) {
      final old = currentNavBarItem;
      currentNavBarItem = nav;
      update([old.route, nav.route]);
      Get.offAllNamed(nav.route);
    }
  }
}
