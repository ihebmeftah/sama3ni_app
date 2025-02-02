import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/app/modules/favoris/controllers/favoris_controller.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';
import 'package:sama3ni_flutter/main.dart';

import '../controllers/tracks_controller.dart';

class TracksView extends GetView<TracksController> {
  const TracksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: Get.height * 0.35,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
                vertical: MediaQuery.sizeOf(context).width * 0.015,
              ),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text("Only free"),
                          value: true,
                          onChanged: (_) {},
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text("Most played"),
                          value: true,
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Search by tags, track, artist, or album",
                    ),
                  ),
                  Wrap(spacing: 20, children: [
                    GetX<TracksController>(builder: (_) {
                      return PopupMenuButton<Category>(
                        constraints: BoxConstraints(
                          maxHeight: Get.height * 0.5,
                          minWidth: Get.width * 0.18,
                        ),
                        enabled: controller.categories.isNotEmpty,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Genre"),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                        onSelected: (Category item) {},
                        itemBuilder: (BuildContext context) => List.generate(
                          controller.categories.length,
                          (index) => PopupMenuItem<Category>(
                            value: controller.categories[index],
                            child: GetBuilder<TracksController>(
                                id: controller.categories[index].id,
                                builder: (_) {
                                  return CheckboxListTile(
                                      title: Text(
                                          controller.categories[index].name),
                                      value: controller.selectedCategory.any(
                                          (cat) =>
                                              cat.id ==
                                              controller.categories[index].id),
                                      onChanged: (v) {
                                        controller.selectCategory(
                                            controller.categories[index]);
                                      });
                                }),
                          ),
                        ),
                      );
                    }),
                    PopupMenuButton<TrackType>(
                      constraints: BoxConstraints(
                        maxHeight: Get.height * 0.5,
                        minWidth: Get.width * 0.18,
                      ),
                      enabled: controller.trackTypes.isNotEmpty,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Track types"),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext context) => List.generate(
                        controller.trackTypes.length,
                        (index) => PopupMenuItem<TrackType>(
                          value: controller.trackTypes[index],
                          child: GetBuilder<TracksController>(
                              id: controller.trackTypes[index].name,
                              builder: (_) {
                                return CheckboxListTile(
                                    title:
                                        Text(controller.trackTypes[index].name),
                                    value: controller.selectedTrackTypes.any(
                                        (trackType) =>
                                            trackType ==
                                            controller.trackTypes[index]),
                                    onChanged: (v) {
                                      controller.selectTrackType(
                                          controller.trackTypes[index]);
                                    });
                              }),
                        ),
                      ),
                    ),
                    PopupMenuButton<Keys>(
                      constraints: BoxConstraints(
                        maxHeight: Get.height * 0.5,
                        minWidth: Get.width * 0.18,
                      ),
                      enabled: controller.trackTypes.isNotEmpty,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Keys"),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext context) => List.generate(
                        controller.keys.length,
                        (index) => PopupMenuItem<Keys>(
                          value: controller.keys[index],
                          child: GetBuilder<TracksController>(
                              id: controller.keys[index].name,
                              builder: (_) {
                                return CheckboxListTile(
                                    title: Text(controller.keys[index].name
                                        .toUpperCase()
                                        .replaceFirst("_", "#")),
                                    value: controller.selectedKey.any(
                                        (k) => k == controller.keys[index]),
                                    onChanged: (v) {
                                      controller
                                          .selectKey(controller.keys[index]);
                                    });
                              }),
                        ),
                      ),
                    ),
                    PopupMenuButton(
                        constraints: BoxConstraints(
                          maxHeight: Get.height * 0.5,
                          minWidth: Get.width * 0.18,
                        ),
                        enabled: true,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Bpm"),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                  enabled: false,
                                  child: Column(
                                    spacing: 10,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Write the bpm range",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      ),
                                      Row(
                                        spacing: 10,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: controller.minBpm,
                                              onChanged: controller.onChangeBpm,
                                              decoration: InputDecoration(
                                                hintText: "Min : 0",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Text("To"),
                                          Expanded(
                                            child: TextField(
                                              controller: controller.maxBpm,
                                              onChanged: controller.onChangeBpm,
                                              decoration: InputDecoration(
                                                hintText: "max : 200",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ])
                  ]),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      GetBuilder<TracksController>(
                          id: "selectedCategory",
                          builder: (_) {
                            return controller.selectedCategory.isEmpty
                                ? const SizedBox()
                                : Chip(
                                    onDeleted: controller.clearSelectedCategory,
                                    label: Text(
                                      "Genre : ${controller.selectedCategory.map((e) => e.name).join(", ")}",
                                    ),
                                  );
                          }),
                      GetBuilder<TracksController>(
                          id: "selectedTrackTypes",
                          builder: (_) {
                            return controller.selectedTrackTypes.isEmpty
                                ? const SizedBox()
                                : Chip(
                                    onDeleted:
                                        controller.clearSelectedTrackType,
                                    label: Text(
                                      "Track types : ${controller.selectedTrackTypes.map((e) => e.name).join(", ")}",
                                    ),
                                  );
                          }),
                      GetBuilder<TracksController>(
                          id: "selectedKey",
                          builder: (_) {
                            return controller.selectedKey.isEmpty
                                ? const SizedBox()
                                : Chip(
                                    onDeleted: controller.clearSelectedKey,
                                    label: Text(
                                      "Keys : ${controller.selectedKey.map((e) => e.name.toUpperCase().replaceFirst("_", "#")).join(", ")}",
                                    ),
                                  );
                          }),
                      GetBuilder<TracksController>(
                          id: "onChangeBpm",
                          builder: (_) {
                            return controller.minBpm.text.isEmpty &&
                                    controller.maxBpm.text.isEmpty
                                ? const SizedBox()
                                : Chip(
                                    onDeleted: controller.clearBpm,
                                    label: Text(
                                      "Bpm : ${controller.minBpm.text} to ${controller.maxBpm.text.isEmpty ? "--" : controller.maxBpm.text}",
                                    ),
                                  );
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.07,
            vertical: MediaQuery.sizeOf(context).width * 0.015,
          ),
          sliver: GetX<TracksController>(builder: (c) {
            return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: switch (Get.width) {
                    <= 360 => 0.85,
                    <= 1131 => 0.9,
                    _ => 1
                  },
                  crossAxisCount: switch (Get.width) {
                    <= 650 => 2,
                    <= 900 => 3,
                    _ => 4
                  },
                ),
                delegate: SliverChildBuilderDelegate(
                    childCount: controller.tracks.length, (context, index) {
                  return ZoomIn(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      hoverColor: Colors.grey.withValues(alpha: 0.2),
                      onTap: () => Get.toNamed(
                          "${Routes.TRACKS}/${controller.tracks[index].id}"),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              height: switch (Get.width) {
                                <= 650 => Get.width * 0.25,
                                _ => Get.width * 0.135
                              },
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          controller.tracks[index].photoUrl!),
                                      fit: BoxFit.cover)),
                              child: !sessionManager.isSignedIn
                                  ? null
                                  : Align(
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
                                                              .tracks[index]
                                                              .id)) {
                                                    favControllere
                                                        .removeFavByTrackId(
                                                            controller
                                                                .tracks[index]
                                                                .id!);
                                                  } else {
                                                    favControllere.addFav(
                                                        controller
                                                            .tracks[index].id!);
                                                  }
                                                },
                                                style: IconButton.styleFrom(
                                                    foregroundColor:
                                                        favControllere.fav.any(
                                                                (e) =>
                                                                    e.trackId ==
                                                                    controller
                                                                        .tracks[
                                                                            index]
                                                                        .id)
                                                            ? Colors.red
                                                            : Colors
                                                                .grey.shade400),
                                                icon: Icon(favControllere.fav
                                                        .any((e) =>
                                                            e.trackId ==
                                                            controller
                                                                .tracks[index]
                                                                .id)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border));
                                          }),
                                    ),
                            ),
                            Text(
                              controller.tracks[index].title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.5,
                              ),
                            ),
                            Text(
                              controller.tracks[index].artist!.displayName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
          }),
        )
      ],
    ));
  }
}
