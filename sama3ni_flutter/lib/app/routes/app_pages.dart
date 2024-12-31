import 'package:get/get.dart';

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
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
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
  ];
}
