import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appempty.dart';

import '../controllers/follower_controller.dart';

class FollowerView extends GetView<FollowerController> {
  const FollowerView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Get.parameters["is"] == "follower"
        ? controller.followers
        : controller.following;
    return Scaffold(
        appBar: AppBar(
          title: Text(Get.parameters["is"]!.toUpperCase()),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.07,
              vertical: MediaQuery.sizeOf(context).width * 0.015,
            ),
            child: controller.obx(
                (state) => ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                (Get.parameters["is"] == "follower"
                                        ? data[index].follower!
                                        : data[index].following!)
                                    .userInfo!
                                    .imageUrl!),
                          ),
                          Text((Get.parameters["is"] == "follower"
                                  ? data[index].follower!
                                  : data[index].following!)
                              .displayName),
                          Text((Get.parameters["is"] == "follower"
                                      ? data[index].follower!
                                      : data[index].following!)
                                  .address ??
                              "No address"),
                        ],
                      );
                    }),
                onEmpty: AppEmpty(
                  title: Get.parameters["is"] == "follower"
                      ? "You have no follower"
                      : "You have no following",
                ))));
  }
}
