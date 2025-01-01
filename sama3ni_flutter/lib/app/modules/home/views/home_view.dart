import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sama3ni_flutter/app/components/appempty.dart';
import 'package:sama3ni_flutter/app/modules/artists/controllers/artists_controller.dart';
import 'package:sama3ni_flutter/app/modules/categories/controllers/categories_controller.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../widgets/sectionhead.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.07,
        vertical: MediaQuery.sizeOf(context).width * 0.015,
      ),
      child: Center(
        child: Column(
            spacing: 40,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchAnchor.bar(
                  barHintText: "Search for a category",
                  constraints: BoxConstraints(
                      minHeight: 45,
                      maxHeight: 45,
                      minWidth: Get.width * 0.7,
                      maxWidth: Get.width * 0.7),
                  viewConstraints: BoxConstraints(
                      minWidth: Get.width * 0.7, maxWidth: Get.width * 0.7),
                  suggestionsBuilder: (c, searchCtr) {
                    return [];
                    // return controller.category
                    //     .where((x) => x.contains(searchCtr.text))
                    //     .map((e) => ListTile(
                    //           onTap: () {
                    //             searchCtr.closeView(e);
                    //           },
                    //           title: Text(e),
                    //         ))
                    //     .toList();
                  }),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 50,
                spacing: 20,
                children: [
                  SizedBox(
                    width: 400,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "MUSIC MADE IT BY SAMA3NI",
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: (22),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Yes, THAT beat was bought on BeatStars."
                                  .toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: (24),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Millions of artists have found their perfect beat on our marketplace.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (16),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.explore),
                            label: const Text('Explore'))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    child: CarouselSlider(
                        options: CarouselOptions(
                          height: 300,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          autoPlay: true,
                          autoPlayInterval:
                              const Duration(seconds: 3, milliseconds: 500),
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          viewportFraction: 0.6,
                        ),
                        items: List.generate(
                            3,
                            (i) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: AssetImage(i == 1
                                              ? "assets/images/foralldog.jpg"
                                              : i == 2
                                                  ? "assets/images/grandson.jpg"
                                                  : "assets/images/pellecoat.jpg"),
                                          fit: BoxFit.fill)),
                                ))),
                  )
                ],
              ),
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHead(title: "Top Artists"),
                  SizedBox(
                    //color: Colors.white,
                    height: 160,
                    child: GetX<ArtistsController>(
                        autoRemove: false,
                        init: ArtistsController(),
                        builder: (artistsCtr) {
                          return artistsCtr.artists.isEmpty
                              ? const AppEmpty()
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: artistsCtr.artists.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      hoverColor:
                                          Colors.grey.withValues(alpha: 0.2),
                                      onTap: () => Get.toNamed(
                                          "${Routes.ARTISTS}/${artistsCtr.artists[index].id}"),
                                      child: Container(
                                        width: 160,
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 55,
                                              backgroundImage: NetworkImage(
                                                  artistsCtr.artists[index]
                                                      .userInfo!.imageUrl!),
                                            ),
                                            Text(
                                              artistsCtr.artists[index]
                                                  .displayName.capitalize!,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.w500,
                                                fontSize: (13.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                        }),
                  ),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  const SectionHead(title: "Trending beats"),
                  SizedBox(
                      width: Get.width,
                      height: 310,
                      child: ListView.separated(
                        physics: GetPlatform.isWeb
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (c, i) => const SizedBox(width: 10),
                        itemBuilder: (c, i) => SizedBox(
                          width: 300,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/images/vinyl.png",
                                  scale: 3,
                                ).animate().rotate(duration: 20000.ms),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: 240,
                                decoration:
                                    BoxDecoration(color: HexColor("262626")),
                                child: Column(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      height: 180,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/foralldog.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 5,
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "My mind ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                "130 BPM",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Iheb music ",
                                            style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "5 Credits",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                      fixedSize:
                                                          const Size(80, 40),
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      backgroundColor:
                                                          Colors.blue.shade900,
                                                      foregroundColor:
                                                          Colors.grey.shade200),
                                                  onPressed: () {},
                                                  child: const Text("Buy")),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  const SectionHead(title: "Genre"),
                  GetX<CategoriesController>(
                      init: CategoriesController(),
                      builder: (categoriesController) {
                        return categoriesController.categories.isEmpty
                            ? const AppEmpty()
                            : Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 20,
                                spacing: 20,
                                children: List.generate(
                                  5,
                                  (i) => Container(
                                    width: 360,
                                    height: 180,
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    child: Text(
                                      categoriesController
                                          .categories[i].name.capitalizeFirst!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ));
                      }),
                ],
              )
            ]),
      ),
    ));
  }
}
