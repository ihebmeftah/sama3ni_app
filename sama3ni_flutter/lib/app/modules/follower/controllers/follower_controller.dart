import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';

import '../../../../main.dart';

class FollowerController extends GetxController with StateMixin {
  final following = <Follower>[].obs;
  final followers = <Follower>[].obs;
  @override
  Future<void> onInit() async {
    await getFollowing();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getFollowing() async {
    try {
      following(
          await client.follower.getFollowers(int.parse(Get.parameters["id"]!)));
      followers(
          await client.follower.getFollowing(int.parse(Get.parameters["id"]!)));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
