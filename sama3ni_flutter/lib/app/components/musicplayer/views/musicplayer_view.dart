import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/config/appthemes.dart';

import '../controllers/musicplayer_controller.dart';

class MusicplayerView extends GetView<MusicplayerController> {
  const MusicplayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        gradient: AppThemes.gradientV1,
      ),
      child: Theme(
        data: ThemeData(
            sliderTheme: context.theme.sliderTheme,
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pellecoat.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pelle Coat",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: (11),
                      ),
                    ),
                    Text(
                      "Lil durk",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: (10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(foregroundColor: Colors.red),
                    icon: const Icon(Icons.favorite)),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Row(
                children: [
                  const Text("0:30"),
                  Expanded(
                    child: Slider(min: 0, max: 5, value: 1, onChanged: (v) {}),
                  ),
                  const Text("3:27"),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shuffle_rounded)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous_rounded)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow_rounded)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next_rounded)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.repeat_rounded)),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.list_rounded)),
          ],
        ),
      ),
    );
  }
}
