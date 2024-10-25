import 'package:get/get.dart';

import '../components/musicplayer/bindings/musicplayer_binding.dart';
import '../components/musicplayer/views/musicplayer_view.dart';
import '../modules/authentification/bindings/authentification_binding.dart';
import '../modules/authentification/views/authentification_view.dart';
import '../modules/beats/bindings/beats_binding.dart';
import '../modules/beats/views/beats_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kits/bindings/kits_binding.dart';
import '../modules/kits/views/kits_view.dart';
import '../modules/loops/bindings/loops_binding.dart';
import '../modules/loops/views/loops_view.dart';
import '../modules/music/bindings/music_binding.dart';
import '../modules/music/views/music_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.MUSIC,
      page: () => const MusicView(),
      binding: MusicBinding(),
    ),
    GetPage(
      name: _Paths.BEATS,
      page: () => const BeatsView(),
      binding: BeatsBinding(),
    ),
    GetPage(
      name: _Paths.KITS,
      page: () => const KitsView(),
      binding: KitsBinding(),
    ),
    GetPage(
      name: _Paths.LOOPS,
      page: () => const LoopsView(),
      binding: LoopsBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTIFICATION,
      page: () => const AuthentificationView(),
      binding: AuthentificationBinding(),
    ),
  ];
}
