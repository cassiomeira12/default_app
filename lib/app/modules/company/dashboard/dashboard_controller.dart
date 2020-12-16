import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/shared/repositories/parse_company_service.dart';
import 'package:default_app/app/shared/repositories/parse_user_service.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class DashBoardController {
  var userService = ParseUserService();
  var companyService = ParseCompanyService();

  dynamic company;

  currentUser() {
    return userService.currentUser();
  }

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
        await userService.signOut();
        return kIsWeb ? Get.offNamed('/company') : Get.offNamed('/splash');
      case OkCancelResult.cancel:
        return;
    }
  }

  getCompanyFromAdmin() async {
    if (company == null) {
      var currentUser = await ParseUser.currentUser();
      company = await companyService.getCompanyFromAdmin(currentUser);
    }
    return company;
  }
}
