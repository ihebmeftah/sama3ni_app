import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/main.dart';

class ArtistsController extends GetxController with StateMixin {
  final artists = <Artist>[].obs;

  @override
  void onInit() async {
    await getArtists();
    super.onInit();
  }

  Future<void> getArtists() async {
    try {
      change(artists, status: RxStatus.loading());
      artists(await client.artists.getArtists());
      change(artists, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
