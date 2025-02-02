import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/modules/tracks/bindings/track_details_binding.dart';
import 'package:sama3ni_flutter/app/modules/tracks/views/track_details_view.dart';

import '../middlewares/auth_middlewares.dart';
import '../modules/artists/bindings/artists_binding.dart';
import '../modules/artists/bindings/artists_profile_binding.dart';
import '../modules/artists/views/artists_profile_view.dart';
import '../modules/artists/views/artists_view.dart';
import '../modules/authentification/bindings/authentification_binding.dart';
import '../modules/authentification/bindings/login_binding.dart';
import '../modules/authentification/bindings/register_binding.dart';
import '../modules/authentification/views/authentification_view.dart';
import '../modules/authentification/views/login_view.dart';
import '../modules/authentification/views/register_view.dart';
import '../modules/authentification/views/verifcation_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/favoris/views/favoris_view.dart';
import '../modules/follower/bindings/follower_binding.dart';
import '../modules/follower/views/follower_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/tracks/bindings/tracks_binding.dart';
import '../modules/tracks/views/tracks_view.dart';
import '../modules/upload/bindings/upload_binding.dart';
import '../modules/upload/views/upload_view.dart';

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
        children: [
          GetPage(
              name: _Paths.REGISTER,
              page: () => const RegisterView(),
              binding: RegisterBinding(),
              children: [
                GetPage(
                  name: _Paths.VERIFCATION,
                  page: () => const VerifcationView(),
                  binding: RegisterBinding(),
                )
              ]),
          GetPage(
            name: _Paths.LOGIN,
            page: () => const LoginView(),
            binding: LoginBinding(),
          ),
        ]),
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
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => const UploadView(),
      binding: UploadBinding(),
    ),
    GetPage(
      name: _Paths.TRACKS,
      page: () => const TracksView(),
      binding: TracksBinding(),
      children: [
          GetPage(
      name: '/:id',
      page: () => const TrackDetailsView(),
      binding: TrackDetailsBinding(),
    ),
      ]
    ),
    GetPage(
      name: _Paths.FOLLOWER,
      page: () => const FollowerView(),
      binding: FollowerBinding(),
    ),
    GetPage(
      name: _Paths.FAVORIS,
      page: () => const FavorisView(),
    ),
  ];
}
