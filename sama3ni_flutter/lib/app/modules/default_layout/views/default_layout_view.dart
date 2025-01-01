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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: GetBuilder<DefaultLayoutController>(
              id: "showNav",
              builder: (ctr) {
                return !ctr.showNav
                    ? const SizedBox()
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.02,
                        ),
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          children: [
                            const Text("LOGO LOGO LOGO"),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                children: List.generate(
                                    controller.navItems.length, (index) {
                                  return TextButton(
                                      style: TextButton.styleFrom(
                                          textStyle: TextStyle(
                                              fontWeight: controller.current ==
                                                      controller.navItems[index]
                                                  ? FontWeight.w600
                                                  : FontWeight.w400,
                                              fontSize: controller.current ==
                                                      controller.navItems[index]
                                                  ? 16.5
                                                  : 14.5),
                                          foregroundColor: controller.current ==
                                                  controller.navItems[index]
                                              ? Colors.blue
                                              : Colors.grey.shade400),
                                      onPressed: () => Get.offNamed(
                                            controller.navItems[index].route),
                                      child: Text(
                                          controller.navItems[index].title));
                                }),
                              ),
                            ),
                            if (sessionManager.isSignedIn) ...[
                              TextButton.icon(
                                  style: TextButton.styleFrom(
                                      minimumSize: const Size(140, 46),
                                      textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      backgroundColor: Colors.grey.shade900,
                                      foregroundColor: Colors.grey.shade300),
                                  onPressed: () =>
                                      Get.toNamed("${Routes.ARTISTS}/me"),
                                  icon: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        sessionManager.signedInUser!.imageUrl!),
                                  ),
                                  label: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(sessionManager
                                          .signedInUser!.userName!.capitalize!),
                                      Icon(Icons.keyboard_arrow_down_sharp,
                                          color: Colors.grey.shade300),
                                    ],
                                  )),
                              const SizedBox(width: 5),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    iconColor: Colors.grey.shade300,
                                    foregroundColor: Colors.grey.shade300),
                                onPressed: () => Get.toNamed(Routes.UPLOAD),
                                icon: const Icon(Icons.add),
                                label: const Text("Upload"),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      foregroundColor: Colors.red),
                                  onPressed: controller.logout,
                                  icon: const Icon(Icons.logout)),
                            ] else
                              Row(
                                spacing: 10,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.blue.shade900),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fixedSize: const Size(120, 40),
                                          textStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          foregroundColor:
                                              Colors.grey.shade200),
                                      onPressed: () => Get.offAllNamed(
                                          Routes.AUTHENTIFICATION),
                                      child: const Text("Sign up")),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          fixedSize: const Size(120, 40),
                                          textStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          backgroundColor: Colors.blue.shade900,
                                          foregroundColor:
                                              Colors.grey.shade200),
                                      onPressed: () => Get.offAllNamed(
                                          Routes.AUTHENTIFICATION),
                                      child: const Text("Log in")),
                                ],
                              ),
                          ],
                        ),
                      );
              })),
      body: child,
    );
  }
}
