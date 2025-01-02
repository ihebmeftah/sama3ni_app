import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/artists/controllers/artists_profile_controller.dart';
import 'package:sama3ni_flutter/app/modules/artists/widgets/artist_about_widget.dart';

import '../widgets/artist_releases_widget.dart';

class ArtistsProfileView extends GetView<ArtistsProfileController> {
  const ArtistsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: Get.arguments ?? 0,
      length: 2,
      child: Scaffold(body: controller.obx((s) {
        return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    collapsedHeight: MediaQuery.sizeOf(context).height * 0.12,
                    floating: true,
                    pinned: true,
                    expandedHeight: MediaQuery.sizeOf(context).height * 0.35,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: false,
                        title: FittedBox(
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                  Text(
                                    "Artiste vérifié",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        controller.artist.userInfo!.imageUrl!),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .artist.displayName.capitalize!,
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        controller.artist.address ??
                                            "No address",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                              image: controller.artist.coverphoto == null
                                  ? null
                                  : DecorationImage(
                                      image: NetworkImage(
                                          controller.artist.coverphoto!),
                                      fit: BoxFit.cover)),
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                                Colors.black87,
                              ],
                            )),
                          ),
                        )),
                    bottom: const TabBar(
                        dividerHeight: 0,
                        indicatorColor: Colors.blue,
                        labelStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        tabs: [
                          Tab(text: "About"),
                          Tab(text: "Releases"),
                        ]),
                  ),
                ],
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.05,
                  vertical: MediaQuery.sizeOf(context).height * 0.05),
              child: TabBarView(
                  physics: GetPlatform.isWeb
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  children: const [
                    ArtistAboutWidget(),
                    ArtistRealeasesWidget(),
                  ]),
            ));
      })),
    );
  }
}
