import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/shared/repositories/admin_company_service.dart';
import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashBoardController {
  var auth = Get.find<AuthService>();
  var adminService = Get.find<AdminCompanyService>();

  signOut(context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: CLOSE,
      okLabel: CLOSE,
      cancelLabel: CANCELAR,
      message: "Deseja sair do $APP_NAME ?",
    );
    switch (result) {
      case OkCancelResult.ok:
        var logout = await auth.logout();
        if (logout) {
          return kIsWeb ? Get.offNamed('/company') : Get.offNamed('/company');
        }
        return;
      case OkCancelResult.cancel:
        return;
    }
  }

  getCompanyFromAdmin() async {
    return adminService.currentCompany();
  }
}
