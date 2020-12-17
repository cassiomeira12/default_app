import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/repositories/auth_service.dart';

class AdminMiddleware extends GetMiddleware {
  final _auth = Get.put(AuthService());

  String redirectPath;

  AdminMiddleware({this.redirectPath}) {
    _auth.currentUser();
  }

  @override
  RouteSettings redirect(String route) {
    return _auth.isAuth() ? null : RouteSettings(name: redirectPath ?? '/');
  }
}
