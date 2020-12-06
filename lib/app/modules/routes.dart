import 'package:default_app/app/modules/company/company_page.dart';
import 'package:default_app/app/modules/home/home_page.dart';
import 'package:default_app/app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import 'admin/admin_page.dart';

class Routes {
  static var routes = [
    GetPage(
      name: '/',
      page: () {
        return true ? HomePage() : SplashPage();
      },
    ),
    GetPage(name: '/admin', page: () => AdminPage()),
    GetPage(name: '/company', page: () => CompanyPage()),
  ];
}
