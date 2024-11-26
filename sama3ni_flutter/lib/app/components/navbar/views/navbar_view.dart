import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';
import '../widgets/navbaritem.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        /*  actions: [
          const SizedBox(width: 25),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 18,
                  ),
                  hintText: "Try searching track or artist or genre...",
                  filled: true),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 25),
        ], */
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (!GetPlatform.isMobile) ...[
                  Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.15,
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
                                      onClick: () => controller.navigateTo(
                                          controller.navbarItems[i]),
                                      isSelected: controller.navbarItems[i] ==
                                          controller.currentNavBarItem,
                                      iconData: controller.navbarItems[i].icon,
                                      text: controller.navbarItems[i].title,
                                    ),
                                  );
                                }),
                          )))
                ],
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.sizeOf(context).height * 0.02,
                      horizontal: MediaQuery.sizeOf(context).width * 0.08),
                  child: child,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
