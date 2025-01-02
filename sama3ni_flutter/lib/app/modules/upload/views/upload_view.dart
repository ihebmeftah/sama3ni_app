import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
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
      appBar: GetPlatform.isWeb ? null : AppBar(),
      body: controller.obx(
        (s) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: GetPlatform.isMobile
                      ? MediaQuery.sizeOf(context).width * 0.8
                      : MediaQuery.sizeOf(context).width * 0.45,
                ),
                child: Form(
                  key: controller.form,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Text(
                          "Track cover",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 32,
                          ),
                        ),
                        GetBuilder<UploadController>(
                            id: "photo",
                            builder: (_) {
                              return Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(10),
                                    image: controller.trackPhoto == null
                                        ? null
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: MemoryImage(
                                                Uint8List.fromList(controller
                                                    .trackPhoto!
                                                    .files
                                                    .single
                                                    .bytes!)),
                                          )),
                                child: controller.trackPhoto != null
                                    ? null
                                    : Center(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                foregroundColor: Colors.white),
                                            onPressed: controller.pickPhoto,
                                            child: const Text(
                                                'Upload track cover')),
                                      ),
                              );
                            }),
                        Text(
                          "Track Information",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 32,
                          ),
                        ),
                        AppInput(
                          ctr: controller.title,
                          isRequired: true,
                          name: "title",
                          hint:
                              "e.g. Flakka | Asap Rocky x Travis Scott Type beat",
                        ),
                        AppDropDown<TrackType>(
                          onChange: controller.selectTrackType,
                          intialV: controller.trackType,
                          isRequired: true,
                          name: "Type",
                          hint: "e.g. Song,Sample,Beat..",
                          items: TrackType.values
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.name)))
                              .toList(),
                        ),
                        GetX<CategoriesController>(
                            init: CategoriesController(),
                            builder: (_) {
                              return AppDropDown<Category>(
                                onChange: controller.selectCategoryy,
                                intialV: controller.category,
                                isRequired: true,
                                name: "category",
                                hint: "e.g. Hip-Hop",
                                items: Get.find<CategoriesController>()
                                    .categories
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e.name)))
                                    .toList(),
                              );
                            }),
                        Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: AppInput(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                ctr: controller.bpm,
                                isRequired: true,
                                name: "bpm",
                                hint: "e.g. 130",
                              ),
                            ),
                            Expanded(
                              child: AppDropDown<String>(
                                onChange: controller.selectKey,
                                intialV: controller.key,
                                isRequired: true,
                                name: "Key",
                                hint: "e.g. C# ",
                                items: [
                                  'C',
                                  'C#',
                                  'D',
                                  'D#',
                                  'E',
                                  'F',
                                  'F#',
                                  'G',
                                  'G#',
                                  'A',
                                  'A#',
                                  'B'
                                ]
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        AppInput(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          ctr: controller.price,
                          isRequired: true,
                          name: "Price (USD)",
                          hint: "e.g. 300",
                        ),
                        AppInput(
                          ctrTags: controller.tags,
                          name: "Tags",
                          hint: "e.g. Travis Scott, Asap Rocky, Flakka",
                        ),
                        Text(
                          "Track Audio",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 32,
                          ),
                        ),
                        Center(
                          child: Column(
                            spacing: 10,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                height: 80,
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  color: Colors.grey.shade400,
                                  strokeWidth: 0.6,
                                  child: InkWell(
                                      onTap: controller.pickAudio,
                                      child: const Center(
                                          child: Text(
                                              "Upload the track audio file"))),
                                ),
                              ),
                              GetBuilder<UploadController>(
                                  id: "audio",
                                  builder: (c) => Text(
                                        c.trackAudio == null
                                            ? "No file selected"
                                            : c.trackAudio!.files.single.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: c.trackAudio == null
                                                ? Colors.red
                                                : Colors.green),
                                      ))
                            ],
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: controller.uploadTrack,
                              child: const Text("Upload the track")),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
    EasyStepper(
                activeStep: 0,
                stepShape: StepShape.rRectangle,
                showLoadingAnimation: false,
                steps: [
                  const EasyStep(
                      icon: Icon(Icons.photo), title: "Upload cover"),
                  EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    customTitle: const Text(
                      'Dash 2',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    customTitle: const Text(
                      'Dash 3',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onStepReached: (index) {},
              ),
            */
