import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
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
        actions: [
          const SizedBox(width: 25),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.22,
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 14.sp,
                  ),
                  hintText: "Try searching track or artist or genre...",
                  filled: true),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 25),
        ],
      ),
      body: Row(
        children: [
          if (!GetPlatform.isMobile) ...[
            Container(
                padding: const EdgeInsets.all(20),

                // color: Colors.blue,
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: controller.navbarItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (c, i) => GetBuilder<NavbarController>(
                            id: controller.navbarItems[i].route,
                            builder: (context) {
                              return NavBarItem(
                                onClick: () => controller
                                    .navigateTo(controller.navbarItems[i]),
                                isSelected: controller.navbarItems[i] ==
                                    controller.currentNavBarItem,
                                iconData: controller.navbarItems[i].icon,
                                text: controller.navbarItems[i].title,
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: NavBarItem(
                        onClick: () {
                          Get.toNamed(Routes.HOME);
                        },
                        isSelected: true,
                        iconData: Icons.logout,
                        text: "Logout",
                      ),
                    )
                  ],
                ))
          ],
          Expanded(
              child: Container(
            child: child,
          ))
        ],
      ),
    );
  }
}
