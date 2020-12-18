import 'package:default_app/app/shared/repositories/admin_company_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyMiddleware extends GetMiddleware {
  final _auth = Get.put(AdminCompanyService());

  String redirectPath;

  CompanyMiddleware({this.redirectPath}) {
    _auth.currentAdminUser();
  }

  @override
  RouteSettings redirect(String route) {
    return _auth.isAdmin() ? null : RouteSettings(name: redirectPath ?? '/');
  }
}