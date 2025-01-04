import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: controller.obx((c) {
          return GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
                vertical: MediaQuery.sizeOf(context).width * 0.015,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: switch (Get.width) {
                  <= 650 => 3,
                  <= 900 => 4,
                  _ => 6
                },
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Container(
                    color: RandomColor.getColorObject(Options(
                      luminosity: Luminosity.dark,
                    )),
                    width: 300,
                    child: Center(
                      child: Text(
                        controller.categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ));
              });
        }));
  }
}
