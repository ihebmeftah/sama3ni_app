import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appempty.dart';

import '../controllers/follower_controller.dart';

class FollowerView extends GetView<FollowerController> {
  const FollowerView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Get.parameters["is"]! == "following"
        ? controller.following
        : controller.follower;
    return Scaffold(
        appBar: AppBar(
          title: Text(Get.parameters["is"]!.toUpperCase()),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.07,
            vertical: MediaQuery.sizeOf(context).width * 0.015,
          ),
          child: data.isEmpty
              ? const AppEmpty()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              data[index].following!.userInfo!.imageUrl!),
                        ),
                        Text(data[index].following!.displayName),
                        Text(data[index].following!.address ?? "No address"),
                      ],
                    );
                  }),
        ));
  }
}
