import 'package:default_app/app/shared/repositories/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMiddleware extends GetMiddleware {
  final _auth = Get.put(AdminService());

  String redirectPath;

  AdminMiddleware({this.redirectPath}) {
    _auth.currentAdminUser();
  }

  @override
  RouteSettings redirect(String route) {
    return _auth.isAdmin() ? null : RouteSettings(name: redirectPath ?? '/');
  }
}
