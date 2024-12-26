import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sama3ni_client/sama3ni_client.dart';
import 'package:sama3ni_flutter/app/config/appthemes.dart';
import 'package:sama3ni_flutter/app/modules/default_layout/controllers/default_layout_controller.dart';
import 'package:sama3ni_flutter/app/modules/default_layout/views/default_layout_view.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app/routes/app_pages.dart';

late SessionManager sessionManager;
late Client client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const ipAddress = 'localhost';
  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  sessionManager = SessionManager(caller: client.modules.auth);
  await sessionManager.initialize();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DefaultLayoutController());
    return GetMaterialApp(
      title: "Sama3ni",
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      routingCallback: controller.onChangeRoute,
      builder: (context, c) {
        return Overlay(initialEntries: [
          OverlayEntry(builder: (_) => DefaultLayoutView(child: c!))
        ]);
      },
    );
  }
}
