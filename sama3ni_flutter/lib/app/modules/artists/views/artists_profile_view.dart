import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/artists/controllers/artists_profile_controller.dart';
import 'package:sama3ni_flutter/app/modules/artists/widgets/artist_about_widget.dart';

import '../widgets/artist_discography_widget.dart';
import '../widgets/artist_releases_widget.dart';

class ArtistsProfileView extends GetView<ArtistsProfileController> {
  const ArtistsProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      collapsedHeight: MediaQuery.sizeOf(context).height * 0.12,
                      floating: true,
                      pinned: true,
                      expandedHeight: MediaQuery.sizeOf(context).height * 0.45,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: false,
                          title: FittedBox(
                            child: Column(
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
                                    SizedBox(width: 10),
                                    Text(
                                      "Artiste vérifié",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage("assets/images/durk.jpg"),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Lil durk".capitalize!,
                                          style: const TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "2.5M followers",
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "From chicago, IL",
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
                                const SizedBox(height: 30)
                              ],
                            ),
                          ),
                          background: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/cover.jpg",
                                    ),
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
                            Tab(text: "Discography"),
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
                      ArtistDiscoGraphyWidget(),
                      ArtistRealeasesWidget(),
                    ]),
              ))),
    );
  }
}
