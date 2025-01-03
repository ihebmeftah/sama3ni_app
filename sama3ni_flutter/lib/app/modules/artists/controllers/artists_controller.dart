import 'dart:developer';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/main.dart';

class ArtistsController extends GetxController with StateMixin {
  final artists = <Artist>[].obs;

  @override
  void onInit() async {
    await getArtists();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getArtists() async {
    try {
      artists(await client.artists.getArtists());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void folllowArtist(index) async {
    try {
      final exist = artists[index].following!.firstWhereOrNull(
          (a) => a.followerId == sessionManager.signedInUser?.id);
      if (exist != null) {
        await client.follower.unfollowArtist(exist);
        artists[index].following?.remove(exist);
      } else {
        final f = await client.follower.followArtist(artists[index].id!);
        artists[index].following?.add(f);
      }
      update([index]);
    } catch (e) {
      log(e.toString());
    }
  }
}
