import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/appthemes.dart';
import '../controllers/home_controller.dart';
import '../widgets/popularartists.dart';
import '../widgets/trendingalbum.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 50,
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
                        "Yes, THAT beat was bought on BeatStars.".toUpperCase(),
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
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
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
        const SizedBox(height: 40),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 30,
          children: List.generate(
            3,
            (index) => FlipInY(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 320,
                height: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/songs.jpg",
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "[REGISTRED USERS]",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const Text(
                      "1000 users",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlipInX(
              child: const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              children: List.generate(
                  controller.category.length,
                  (index) => FlipInX(
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 0.2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue,
                                gradient: AppThemes.gradientV1),
                            height: 48,
                            width: 130,
                            child: Text(
                              controller.category[index],
                              style: const TextStyle(
                                  fontSize: (11.5),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const PopularArtist(),
        const SizedBox(height: 10),
        const TrendingAlbum()
      ],
    ));
  }
}
