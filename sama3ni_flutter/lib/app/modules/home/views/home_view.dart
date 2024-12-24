import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sama3ni_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../widgets/homesectionwidget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(width: 20),
            const Text("LOGO LOGO LOGO"),
            const SizedBox(width: 30),
            Expanded(
              child: Row(
                children: List.generate(controller.navItems.length, (index) {
                  return GetBuilder<HomeController>(
                    id: index,
                    builder: (_) {
                      return TextButton(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontWeight: controller.currentIndex == index
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: controller.currentIndex == index
                                      ? 16.5
                                      : 14.5),
                              foregroundColor: controller.currentIndex == index
                                  ? Colors.blue
                                  : Colors.grey.shade400),
                          onPressed: () => controller.changeIndex(index),
                          child: Text(controller.navItems[index]));
                    },
                  );
                }),
              ),
            ),
            PopupMenuButton<String>(
              menuPadding: EdgeInsets.zero,
              offset: const Offset(0, 40),
              child: const Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/tyler.jpg"),
                  ),
                  Text("Iheb meftah"),
                ],
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "Profile",
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Profile"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Profile",
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Profile"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Profile",
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Profile"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Profile",
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Profile"),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
            TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(20)),
                    fixedSize: const Size(120, 40),
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    foregroundColor: Colors.grey.shade200),
                onPressed: () => Get.offAllNamed(Routes.AUTHENTIFICATION),
                child: const Text("Sign up")),
            const SizedBox(width: 5),
            TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(120, 40),
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.grey.shade200),
                onPressed: () {},
                child: const Text("Log in")),
            const SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.05,
            vertical: MediaQuery.sizeOf(context).width * 0.015,
          ),
          child: Center(
            child: Column(
                spacing: 40,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Carousel Intro
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
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 3),
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

                  HomeSectionWidget(
                    title: "Trending beats",
                    itemNb: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 360,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/images/vinyl.png",
                                scale: 3,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 300,
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ]),
          ),
        ));
  }
}
