import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class FollowerController extends GetxController with StateMixin {
  final following = <Follower>[].obs;
  final followers = <Follower>[].obs;
  @override
  Future<void> onInit() async {
    await getFollowing();
    super.onInit();
  }

  Future<void> getFollowing() async {
    try {
      following(
          await client.follower.getFollowers(int.parse(Get.parameters["id"]!)));
      followers(
          await client.follower.getFollowing(int.parse(Get.parameters["id"]!)));
      if (Get.parameters["is"] != "follower") {
        if (following.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(null, status: RxStatus.success());
        }
      } else {
        if (followers.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(null, status: RxStatus.success());
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
