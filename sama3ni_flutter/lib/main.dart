import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/components/navbar/bindings/navbar_binding.dart';
import 'package:sama3ni_flutter/app/components/navbar/views/navbar_view.dart';
import 'package:sama3ni_flutter/app/config/appthemes.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: "Sama3ni",
        theme: AppThemes.light,
        darkTheme: AppThemes.dark,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
        defaultTransition: Transition.fade,
        initialBinding: NavbarBinding(),
        builder: (_, c) => NavbarView(child: c!),
      );
    }),
  );
}
