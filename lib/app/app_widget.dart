import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'modules/routes.dart';
import 'shared/notifications/push_notification.dart';
import 'shared/repositories/admin_company_service.dart';
import 'shared/repositories/admin_service.dart';
import 'shared/repositories/auth_service.dart';
import 'shared/repositories/parse/parse_init.dart';
import 'styles/themes/dark_theme.dart';
import 'styles/themes/light_theme.dart';
import 'styles/themes/theme.dart';
import 'utils/strings/strings.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //await Firebase.initializeApp();
    getTheme().then((value) {
      Get.changeThemeMode(value);
    });
    Get.putAsync(() => ParseInit.init(), permanent: true).then((value) {
      Get.put(AuthService(), permanent: true);
      Get.put(AdminService(), permanent: true);
      Get.put(AdminCompanyService(), permanent: true);
      Get.put(PushNotification(), permanent: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        GetMaterialApp(
          title: APP_NAME,
          themeMode: ThemeMode.light,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: kIsWeb ? '/' : '/admin',
          getPages: Routes.routes,
          enableLog: kDebugMode,
          defaultTransition: kIsWeb ? Transition.fade : Transition.cupertino,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          debugShowCheckedModeBanner: false,
        ),
        minWidth: 480,
        defaultScale: false,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
    );
  }
}
