import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class FollowerController extends GetxController with StateMixin {
  final following = <Follower>[].obs;
  final follower = <Follower>[].obs;
  @override
  Future<void> onInit() async {
    await getFollowing();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getFollowing() async {
    try {
      following(await client.follower
          .getFollowing(int.tryParse(Get.parameters["id"]!)));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> followArtist(int artistId) async {
    try {
      await getFollowing();
      final exist =
          following.firstWhereOrNull((a) => a.followingId == artistId);
      if (exist != null) {
        await client.follower.unfollowArtistByArtistId(artistId);
        following.removeWhere((a) => a.followingId == artistId);
      } else {
        final follower = await client.follower.followArtist(artistId);
        following.add(follower);
      }
      update([artistId]);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
