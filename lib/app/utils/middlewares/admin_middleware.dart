import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/repositories/admin_service.dart';

class AdminMiddleware extends GetMiddleware {
  final _auth = Get.put(AdminService());

  String redirectPath;

  AdminMiddleware(int priority, {this.redirectPath})
      : super(priority: priority);

  @override
  RouteSettings redirect(String route) {
    return _auth.isAdmin() ? null : RouteSettings(name: redirectPath ?? '/');
  }

  @override
  GetPage onPageCalled(GetPage page) {
    return page.copyWith(
      transition: _auth.isAdmin() ? page.transition : Transition.upToDown,
      transitionDuration: _auth.isAdmin() ? page.transitionDuration : 1.seconds,
    );
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings> bindings) {
    if (!_auth.isAdmin()) {
      bindings = <Bindings>[];
    }
    return super.onBindingsStart(bindings);
  }
}
