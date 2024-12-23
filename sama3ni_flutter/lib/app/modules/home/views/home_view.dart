import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size(Get.width, MediaQuery.sizeOf(context).height * 0.1),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("LOGO LOGO LOGO"),
                      Expanded(
                        child: Row(
                          children: List.generate(controller.navItems.length,
                              (index) {
                            return GetBuilder<HomeController>(
                              id: index,
                              builder: (_) {
                                return TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: TextStyle(
                                            fontWeight:
                                                controller.currentIndex == index
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                            fontSize:
                                                controller.currentIndex == index
                                                    ? 16.5
                                                    : 14.5),
                                        foregroundColor:
                                            controller.currentIndex == index
                                                ? Colors.pink
                                                : Colors.grey.shade200),
                                    onPressed: () =>
                                        controller.changeIndex(index),
                                    child: Text(controller.navItems[index]));
                              },
                            );
                          }),
                        ),
                      )
                    ]),
              ),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.red,
                height: Get.height / 2,
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Swiper(
                    itemHeight: 200,
                    itemWidth: 200,
                    layout: SwiperLayout.TINDER,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: index / 2 == 0 ? Colors.green : Colors.red,
                        child: Text(index.toString()),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
