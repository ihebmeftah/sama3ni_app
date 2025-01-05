import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appempty.dart';

import '../controllers/favoris_controller.dart';

class FavorisView extends GetView<FavorisController> {
  const FavorisView({super.key});
  @override
  Widget build(BuildContext context) {
    FavorisController _ = Get.put(FavorisController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Favoris tracks"),
        ),
        body: controller.obx(
          (c) => ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
                vertical: MediaQuery.sizeOf(context).width * 0.015,
              ),
              itemCount: controller.fav.length,
              itemBuilder: (context, index) => ListTile(
                    leading:
                        Image.network(controller.fav[index].track!.photoUrl!),
                    title: Text(controller.fav[index].track!.title),
                    subtitle:
                        Text(controller.fav[index].track!.artist!.displayName),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.removeFav(index);
                      },
                    ),
                  )),
          onEmpty: const AppEmpty(title: "No favoris yet!"),
        ));
  }
}
