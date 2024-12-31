import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/app/components/appdropdown.dart';
import 'package:sama3ni_flutter/app/components/appinput.dart';
import 'package:sama3ni_flutter/app/modules/categories/controllers/categories_controller.dart';

import '../controllers/upload_controller.dart';

class UploadView extends GetView<UploadController> {
  const UploadView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: controller.obx(
 (s) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
                vertical: MediaQuery.sizeOf(context).width * 0.015,
              ),
              child: Form(
                key: controller.form,
                child: Column(
                  spacing: 20,
                  children: [
                    AppInput(
                      ctr: controller.title,
                      isRequired: true,
                      name: "title",
                      hint: "e.g. Flakka | Asap Rocky x Travis Scott Type beat",
                    ),
                    AppDropDown<Category>(
                      onChange: controller.selectCategoryy,
                      intialV: controller.category,
                      isRequired: true,
                      name: "category",
                      hint: "e.g. Hip-Hop",
                      items: Get.find<CategoriesController>()
                          .categories
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(),
                    ),
                    AppInput(
                      onTap: controller.pickAudio,
                      ctr: controller.audio,
                      isRequired: true,
                      name: "Audio",
                      hint: "Upload your audio file",
                    ),
                    ElevatedButton(
                        onPressed: controller.uploadTrack,
                        child: const Text("Upload the track")),
                  ],
                ),
              ),
            );
          }
        ));
  }
}
