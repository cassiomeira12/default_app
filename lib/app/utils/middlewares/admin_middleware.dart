import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/repositories/admin_service.dart';

class AdminMiddleware extends GetMiddleware {
  String redirectPath;

  AdminMiddleware(
    int priority, {
    this.redirectPath,
  }) : super(priority: priority);

  @override
  RouteSettings redirect(String route) {
    final _auth = Get.find<AdminService>();
    return _auth.isAdmin() ? null : RouteSettings(name: redirectPath ?? '/');
  }

  @override
  GetPage onPageCalled(GetPage page) {
    final _auth = Get.find<AdminService>();
    return page.copyWith(
      transition: _auth.isAdmin() ? page.transition : Transition.upToDown,
      transitionDuration: _auth.isAdmin() ? page.transitionDuration : 1.seconds,
    );
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings> bindings) {
    final _auth = Get.find<AdminService>();
    if (!_auth.isAdmin()) {
      bindings = <Bindings>[];
    }
    return super.onBindingsStart(bindings);
  }
}
