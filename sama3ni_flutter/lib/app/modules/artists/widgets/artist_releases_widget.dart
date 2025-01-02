import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/appempty.dart';

import '../controllers/artists_profile_controller.dart';

class ArtistRealeasesWidget extends GetView<ArtistsProfileController> {
  const ArtistRealeasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
            focusColor: Colors.transparent,
            menuWidth: MediaQuery.sizeOf(context).width * 0.2,
            isDense: true,
            underline: const SizedBox(),
            value: "All",
            items: [
              "All",
              "Albums ",
              "Singles",
              "Beats",
              "Loops/Samples",
              "Kits",
              "EPs",
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {}),
        const SizedBox(height: 20),
        Expanded(
            child: controller.tracks.isEmpty
                ? const AppEmpty()
                : ListView.separated(
                    itemCount: controller.tracks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemBuilder: (context, index) => Row(
                      children: [
                        Image.network(
                          controller.tracks[index].photoUrl!,
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.artist.displayName} - ${controller.tracks[index].title}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${controller.tracks[index].genre?.name} . ${controller.tracks[index].playtime} Plays",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                      onPressed: () {},
                                      style: IconButton.styleFrom(
                                          foregroundColor: Colors.red),
                                      icon: const Icon(Icons.favorite)),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    style: IconButton.styleFrom(
                                        foregroundColor: Colors.grey.shade400),
                                    icon: const Icon(Icons.more_horiz),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
      ],
    );
  }
}
