import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../controllers/default_layout_controller.dart';

class DefaultLayoutView extends GetView<DefaultLayoutController> {
  const DefaultLayoutView({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(width: 40),
          const Text("LOGO LOGO LOGO"),
          const SizedBox(width: 30),
          Expanded(
            child: Row(
              children: List.generate(controller.navItems.length, (index) {
                return GetBuilder<DefaultLayoutController>(
                  id: controller.navItems[index].route,
                  builder: (_) {
                    return TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontWeight: controller.currentIndex ==
                                        controller.navItems[index]
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: controller.currentIndex ==
                                        controller.navItems[index]
                                    ? 16.5
                                    : 14.5),
                            foregroundColor: controller.currentIndex ==
                                    controller.navItems[index]
                                ? Colors.blue
                                : Colors.grey.shade400),
                        onPressed: () =>
                            controller.changeIndex(controller.navItems[index]),
                        child: Text(controller.navItems[index].title));
                  },
                );
              }),
            ),
          ),
          const SizedBox(width: 5),
          if (sessionManager.isSignedIn)
            PopupMenuButton<String>(
              menuPadding: EdgeInsets.zero,
              offset: const Offset(0, 45),
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(controller.user!.imageUrl!),
                  ),
                  Text(controller.user!.userName!),
                ],
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "logout",
                  child: ListTile(
                    onTap: controller.logout,
                    leading: const Icon(Icons.logout),
                    title: const Text("logout"),
                  ),
                ),
              ],
            )
          else
            Row(
              spacing: 10,
              children: [
                const SizedBox(width: 5),
                TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue.shade900),
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(120, 40),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                        foregroundColor: Colors.grey.shade200),
                    onPressed: () => Get.offAllNamed(Routes.AUTHENTIFICATION),
                    child: const Text("Sign up")),
                TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(120, 40),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.grey.shade200),
                    onPressed: () {},
                    child: const Text("Log in")),
              ],
            ),
          const SizedBox(width: 40),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.07,
            vertical: MediaQuery.sizeOf(context).width * 0.015,
          ),
          child: child),
    );
  }
}
