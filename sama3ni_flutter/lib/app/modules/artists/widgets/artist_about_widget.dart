import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/artists_profile_controller.dart';

class ArtistAboutWidget extends GetView<ArtistsProfileController> {
  const ArtistAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            TextButton(
              onPressed: () => Get.toNamed(Routes.FOLLOWER,
                  parameters: {'is': "follower", 'id': controller.id}),
              child: Text("Followers ${controller.artist.following?.length}"),
            ),
            TextButton(
                onPressed: () => Get.toNamed(Routes.FOLLOWER,
                    parameters: {'is': "following", 'id': controller.id}),
                child: Text("Following ${controller.artist.follower?.length}")),
            if (controller.isMe)
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey.shade200,
                    iconColor: Colors.grey.shade200,
                    backgroundColor: Colors.blue.shade900),
                onPressed: controller.updateCoverPhoto,
                icon: const Icon(Icons.photo),
                label: const Text("Upload new cover"),
              ),
            if (controller.isMe)
              TextButton.icon(
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                  foregroundColor: Colors.grey.shade200,
                  iconColor: Colors.grey.shade200,
                ),
                onPressed: () async {
                  if (GetPlatform.isMobile) {
                    Get.toNamed(Routes.PROFILE);
                  } else {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Edit Profile'),
                              IconButton(
                                  onPressed: Get.back,
                                  icon: const Icon(Icons.clear)),
                            ],
                          ),
                          content: SizedBox(
                              width: Get.width * 0.6,
                              child: const ProfileView()),
                        );
                      },
                    ).whenComplete(() {
                      controller.getArtistById();
                    });
                  }
                },
                label: const Text('Edit Profile'),
                icon: const Icon(Icons.edit),
              ),
          ],
        ),
        Text(
          controller.artist.displayName.capitalize!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: ReadMoreText(
            controller.artist.bio ?? "No bio ",
            trimLength: 1400,
          ),
        ),
        Row(
          spacing: 20,
          children: [
            if (controller.artist.iglink != null)
              IconButton(
                  icon: const FaIcon(
                    size: 30,
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                  ),
                  onPressed: () {}),
            if (controller.artist.youtubelink != null)
              IconButton(
                  icon: const FaIcon(
                    size: 30,
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
            if (controller.artist.soundcloudlink != null)
              IconButton(
                  icon: const FaIcon(
                    size: 30,
                    FontAwesomeIcons.soundcloud,
                    color: Colors.orange,
                  ),
                  onPressed: () {})
          ],
        )
      ],
    );
  }
}
