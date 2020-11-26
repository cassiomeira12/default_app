import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/utils/strings/strings.dart';
import 'modules/routes.dart';
import 'style/themes/dark_theme.dart';
import 'style/themes/light_theme.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: '/',
      getPages: Routes.routes,
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultDurationTransition,
      defaultGlobalState: Get.defaultGlobalState,
    );
  }
}
