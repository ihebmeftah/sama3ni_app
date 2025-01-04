import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';
import 'package:sama3ni_flutter/main.dart';

import '../controllers/artists_controller.dart';

class ArtistsView extends GetView<ArtistsController> {
  const ArtistsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.07,
        vertical: MediaQuery.sizeOf(context).width * 0.015,
      ),
      child: controller.obx((s) {
        return LayoutBuilder(builder: (context, constraints) {
          return /* constraints.biggest.width < 800
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      crossAxisCount: GetPlatform.isMobile
                          ? 2
                          : switch (constraints.biggest.width) {
                              <= 600 => 3,
                              _ => 4
                            }),
                  itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                              ),
                              TextButton.icon(
                                onPressed: () =>
                                    Get.toNamed("${Routes.ARTISTS}/$index"),
                                label: const Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                                icon: const Text(
                                  "Iheb Beats",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Text(
                                "tunis, Tunisia",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue.shade800,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () =>
                                    Get.toNamed("${Routes.ARTISTS}/$index"),
                                child: const Text('Visit'),
                              ),
                            ],
                          ),
                        ),
                      ))
              :  */
              ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            itemCount: controller.artists.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade900,
              endIndent: MediaQuery.sizeOf(context).width * 0.1,
              indent: MediaQuery.sizeOf(context).width * 0.1,
            ),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      controller.artists[index].userInfo!.imageUrl!),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () => Get.toNamed(
                            "${Routes.ARTISTS}/${controller.artists[index].id}"),
                        label: const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 18,
                        ),
                        icon: Text(
                          controller.artists[index].displayName.capitalize!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (controller.artists[index].address != null)
                        Text(
                          controller.artists[index].address!,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      const SizedBox(height: 10),
                      Text(
                        controller.artists[index].bio ??
                            "This artist has no bio yet",
                        maxLines: !sessionManager.isSignedIn ? 8 : 3,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      if (sessionManager.isSignedIn)
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () => Get.toNamed(
                                      "${Routes.ARTISTS}/${controller.artists[index].id}"),
                                  child: const Text('Visit')),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade600),
                                  onPressed: () {},
                                  child: const Text('Message')),
                            )
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (sessionManager.isSignedIn)
                        GetBuilder<ArtistsController>(
                            id: index,
                            builder: (_) {
                              return ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    iconColor: Colors.white,
                                    backgroundColor: controller
                                            .artists[index].following!
                                            .any((a) =>
                                                a.followerId ==
                                                sessionManager.signedInUser?.id)
                                        ? Colors.grey
                                        : null),
                                onPressed: () =>
                                    controller.folllowArtist(index),
                                icon: Icon(controller.artists[index].following!
                                        .any((a) =>
                                            a.followerId ==
                                            sessionManager.signedInUser?.id)
                                    ? Icons.remove
                                    : Icons.add),
                                label: Text(
                                  controller.artists[index].following!.any(
                                          (a) =>
                                              a.followerId ==
                                              sessionManager.signedInUser?.id)
                                      ? "Unfollow"
                                      : 'Follow',
                                ),
                              );
                            }),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Visibility(
                  visible: Get.width > 390,
                  child: Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Top release",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          //color: Colors.white,
                          height: 210,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(15),
                                hoverColor: Colors.grey..withValues(alpha: 0.2),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        width: 160,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(index == 1
                                                    ? "assets/images/certifei.jpeg"
                                                    : "assets/images/foralldog.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        index == 1
                                            ? "Certified Lover Boy"
                                            : "For All the Dogs",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w700,
                                          fontSize: (11.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      }),
    ));
  }
}
