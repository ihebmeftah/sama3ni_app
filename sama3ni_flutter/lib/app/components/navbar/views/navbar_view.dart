import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/appthemes.dart';
import '../controllers/navbar_controller.dart';
import '../widgets/navbaritem.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      bottomNavigationBar: GetPlatform.isMobile
          ? Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha : 0.2),
                      blurRadius: 20,
                      spreadRadius: 3,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: AppThemes.gradientV1),
              child: BottomNavigationBar(items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_add_check), label: "You library"),
              ]),
            )
          : null,
      drawer: !GetPlatform.isMobile
          ? null
          : Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/drake.jpeg"),
                    ),
                    decoration: BoxDecoration(color: Colors.blue.shade800),
                    accountName: const Text(
                      "Iheb meftah",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    accountEmail: const Text(
                      "iheb@gmail.com",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  ...List.generate(
                    controller.navbarItems.length,
                    (i) => GetBuilder<NavbarController>(
                        id: controller.navbarItems[i].route,
                        builder: (context) {
                          return FlipInX(
                              delay: Duration(milliseconds: i * 200),
                              child: ListTile(
                                titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: controller.navbarItems[i] ==
                                            controller.currentNavBarItem
                                        ? (16)
                                        : (14),
                                    color: Colors.white),
                                selected: controller.navbarItems[i] ==
                                    controller.currentNavBarItem,
                                onTap: () => controller
                                    .navigateTo(controller.navbarItems[i]),
                                title: Text(controller.navbarItems[i].title),
                                leading: Icon(controller.navbarItems[i].icon),
                              ));
                        }),
                  )
                ],
              ),
            ),
      appBar: AppBar(toolbarHeight: MediaQuery.sizeOf(context).height * 0.1),
      body: Row(
        children: [
          if (!GetPlatform.isMobile)
            Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.135,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      controller.navbarItems.length,
                      (i) => GetBuilder<NavbarController>(
                          id: controller.navbarItems[i].route,
                          builder: (context) {
                            return FlipInX(
                              delay: Duration(milliseconds: i * 200),
                              child: NavBarItem(
                                onClick: () => controller
                                    .navigateTo(controller.navbarItems[i]),
                                isSelected: controller.navbarItems[i] ==
                                    controller.currentNavBarItem,
                                iconData: controller.navbarItems[i].icon,
                                text: controller.navbarItems[i].title,
                              ),
                            );
                          }),
                    ))),
          Expanded(child: child)
        ],
      ),
    );
  }
}
