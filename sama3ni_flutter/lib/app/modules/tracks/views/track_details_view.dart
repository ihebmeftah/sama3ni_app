import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sama3ni_flutter/app/modules/tracks/controllers/track_details_controller.dart';

import '../../../../main.dart';
import '../../../components/appempty.dart';
import '../../favoris/controllers/favoris_controller.dart';

class TrackDetailsView extends GetView<TrackDetailsController> {
  const TrackDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return controller.obx((s) => Scaffold(
          appBar: AppBar(
            title: Text("Track > ${controller.track.title}"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 0.4),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.07,
                      vertical: MediaQuery.sizeOf(context).width * 0.015,
                    ),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(controller.track.photoUrl!),
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(
                          width: 800,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  controller.track.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Created by ${controller.track.artist!.displayName} at ${DateFormat('d MMMM EEEE').format(controller.track.createdAt)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                if (controller.track.tags.isNotEmpty)
                                  SizedBox(
                                    height: 60,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.track.tags.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 10),
                                        itemBuilder: (context, index) {
                                          return Chip(
                                              label: Text(
                                                  "#${controller.track.tags[index]}"));
                                        }),
                                  ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        style: IconButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.grey, width: 0.5),
                                          shape: const CircleBorder(),
                                        ),
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow)),
                                    const SizedBox(width: 20),
                                    const Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Slider(
                                          min: 0,
                                          max: 3.4,
                                          value: 3,
                                          onChanged: (_) {}),
                                    ),
                                    const Text(
                                      "3:40",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    if (sessionManager.isSignedIn)
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GetX<FavorisController>(
                                            init: FavorisController(),
                                            builder: (favControllere) {
                                              return IconButton(
                                                  onPressed: () {
                                                    if (favControllere.fav.any(
                                                        (e) =>
                                                            e.trackId ==
                                                            controller
                                                                .track.id)) {
                                                      favControllere
                                                          .removeFavByTrackId(
                                                              controller
                                                                  .track.id!);
                                                    } else {
                                                      favControllere.addFav(
                                                          controller.track.id!);
                                                    }
                                                  },
                                                  style: IconButton.styleFrom(
                                                      foregroundColor:
                                                          favControllere.fav
                                                                  .any((e) =>
                                                                      e.trackId ==
                                                                      controller
                                                                          .track
                                                                          .id)
                                                              ? Colors.red
                                                              : Colors.grey
                                                                  .shade400),
                                                  icon: Icon(favControllere.fav
                                                          .any((e) =>
                                                              e.trackId ==
                                                              controller
                                                                  .track.id)
                                                      ? Icons.favorite
                                                      : Icons.favorite_border));
                                            }),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                    child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Genre",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.genre!.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "BPM",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.bpm.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Plays",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.playtime
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Likes",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.favoris!.length
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Type",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.type.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Price",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            controller.track.price.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                              ]),
                        ),
                      ],
                    )),
                const Divider(thickness: 0.4),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.07,
                    vertical: MediaQuery.sizeOf(context).width * 0.015,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      const Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: controller.commentController,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxWidth: Get.width * 0.5,
                          ),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(),
                          focusedBorder: const UnderlineInputBorder(),
                          hintText: 'Write your comment here',
                          suffixIcon: IconButton(
                            onPressed: controller.addComment,
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: GetX<TrackDetailsController>(builder: (_) {
                    return controller.comments.isEmpty
                        ? const AppEmpty(title: "No comments found")
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(controller.comments.length,
                                (index) {
                              return SizedBox(
                                width: Get.width * 0.8,
                                child: ListTile(
                                  onTap: () {},
                                  trailing: sessionManager.signedInUser?.id ==
                                          controller.comments[index].artist!.id
                                      ? IconButton(
                                          onPressed: () =>
                                              controller.removeComment(index),
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                      : null,
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(controller
                                          .comments[index]
                                          .artist!
                                          .userInfo!
                                          .imageUrl!)),
                                  title: Text(controller
                                      .comments[index].artist!.displayName),
                                  subtitle:
                                      Text(controller.comments[index].comment),
                                ),
                              );
                            }),
                          );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
