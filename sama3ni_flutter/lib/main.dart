import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_flutter/app/config/appthemes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Sama3ni",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      theme: Appthemes.light,
      darkTheme: Appthemes.dark,
    ),
  );
}
