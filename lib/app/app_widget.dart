import 'package:default_app/app/style/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/utils/strings/strings.dart';
import 'modules/routes.dart';
import 'shared/repositories/parse_init.dart';
import 'style/themes/dark_theme.dart';
import 'style/themes/light_theme.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    ParseInit.init();
    getTheme().then((value) {
      Get.changeThemeMode(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: kIsWeb ? '/' : '/splash',
      getPages: Routes.routes,
      enableLog: false,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultDurationTransition,
      defaultGlobalState: Get.defaultGlobalState,
    );
  }
}
