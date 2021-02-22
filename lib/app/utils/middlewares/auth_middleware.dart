import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/repositories/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  String redirectPath;

  AuthMiddleware({this.redirectPath});

  @override
  RouteSettings redirect(String route) {
    final _auth = Get.find<AuthService>();
    return _auth.isAuth() ? null : RouteSettings(name: redirectPath ?? '/');
  }
}
