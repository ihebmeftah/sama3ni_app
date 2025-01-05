import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/main.dart';

class FavorisController extends GetxController with StateMixin {
  final fav = <Favoris>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoris();
  }

  Future<void> fetchFavoris() async {
    try {
      fav.value = await client.favoris.getFavoris();
      if (fav.isNotEmpty) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> addFav(int trackid) async {
    try {
      await client.favoris.addFav(trackid);
      await fetchFavoris();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> removeFavByTrackId(int trackid) async {
    try {
      change(null, status: RxStatus.loading());
      await client.favoris.removeFavByTrackId(trackid);
      await fetchFavoris();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> removeFav(int index) async {
    try {
      await client.favoris.removeFav(fav[index]);
      await fetchFavoris();
      if (fav.isNotEmpty) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
