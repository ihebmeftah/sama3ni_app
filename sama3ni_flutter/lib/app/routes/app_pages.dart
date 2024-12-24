import 'package:get/get.dart';

import '../middlewares/auth_middlewares.dart';
import '../modules/artists/bindings/artists_binding.dart';
import '../modules/artists/bindings/artists_profile_binding.dart';
import '../modules/artists/views/artists_profile_view.dart';
import '../modules/artists/views/artists_view.dart';
import '../modules/authentification/bindings/authentification_binding.dart';
import '../modules/authentification/views/authentification_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
      name: _Paths.AUTHENTIFICATION,
      page: () => const AuthentificationView(),
      middlewares: [AuthMiddlewares()],
      binding: AuthentificationBinding(),
    ),
    GetPage(
        name: _Paths.ARTISTS,
        page: () => const ArtistsView(),
        binding: ArtistsBinding(),
        children: [
          GetPage(
              name: "/:id",
              page: () => const ArtistsProfileView(),
              binding: ArtistsProfieBinding())
        ]),
  ];
}
