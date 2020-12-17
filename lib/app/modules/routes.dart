import 'package:default_app/app/pages/splash/splash_page.dart';
import 'package:default_app/app/utils/middlewares/auth_middleware.dart';
import 'package:get/get.dart';

import 'admin/admin_page.dart';
import 'admin/dashboard/dashboard_bind.dart' as AdminDashboard;
import 'admin/dashboard/dashboard_page.dart' as AdminDashboard;
import 'admin/login/login_page.dart' as AdminLogin;
import 'company/company_page.dart';
import 'company/dashboard/dashboard_bind.dart' as CompanyBind;
import 'company/dashboard/dashboard_page.dart' as CompanyDashboard;
import 'company/login/login_page.dart' as CompanyLogin;
import 'home/home_bind.dart';
import 'home/home_page.dart';

class Routes {
  static var routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
      binding: HomeBind(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
    ),
    GetPage(
      name: '/admin',
      page: () => AdminPage(),
      children: [
        GetPage(
          name: '/login',
          page: () => AdminLogin.LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => AdminDashboard.DashboardPage(),
          binding: AdminDashboard.DashboardBind(),
          middlewares: [AuthMiddleware(redirectPath: '/admin')],
        ),
      ],
    ),
    GetPage(
      name: '/company',
      page: () => CompanyPage(),
      children: [
        GetPage(
          name: '/login',
          page: () => CompanyLogin.LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => CompanyDashboard.DashboardPage(),
          binding: CompanyBind.DashboardBind(),
          middlewares: [AuthMiddleware(redirectPath: '/company')],
        ),
      ],
    ),
  ];
}
