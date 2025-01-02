import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/main.dart';

import '../../../components/appinput.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetPlatform.isWeb
          ? null
          : AppBar(
              title: const Text('Profile'),
            ),
      body: Column(
        spacing: 20,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
                vertical: MediaQuery.sizeOf(context).width * 0.015,
              ),
              child: Wrap(
                runSpacing: 10,
                spacing: 20,
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      spacing: 10,
                      children: [
                        GetBuilder<ProfileController>(builder: (_) {
                          return Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(sessionManager
                                          .signedInUser!.imageUrl!)),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)));
                        }),
                        TextButton(
                            onPressed: controller.pickImage,
                            child: const Text('Change your picture')),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width *
                          (GetPlatform.isMobile ? 0.75 : 0.30),
                      child: Form(
                        key: controller.formProfile,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            AppInput(
                              ctr: controller.username,
                              name: "UserName",
                              isRequired: true,
                            ),
                            AppInput(
                              ctr: controller.address,
                              name: "Location",
                            ),
                            AppInput(
                              ctr: controller.bio,
                              maxLines: 5,
                              name: "Biography",
                            ),
                            Text(
                              "Social Media",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppInput(
                              ctr: controller.ig,
                              name: "Instagram",
                            ),
                            AppInput(
                              ctr: controller.youtube,
                              name: "Youtube",
                            ),
                            AppInput(
                              ctr: controller.soundcloud,
                              name: "Soundcloud",
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /*  TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      foregroundColor: Colors.red),
                  onPressed: Get.back,
                  child: const Text("Close")) */
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: controller.updateProfile,
                  child: const Text("Save")),
            ],
          )
        ],
      ),
    );
  }
}
