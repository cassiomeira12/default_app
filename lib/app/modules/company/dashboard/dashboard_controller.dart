import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/shared/repositories/parse_user_service.dart';
import 'package:get/get.dart';

class DashBoardController {
  var userService = ParseUserService();

  currentUser() {
    return userService.currentUser();
  }

  signOut(context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: "SIGNOUT",
      okLabel: "SIGNOUT",
      cancelLabel: "CANCELAR",
      message: "Deseja sair do APP_NAME ?",
    );
    switch (result) {
      case OkCancelResult.ok:
        await userService.signOut();
        return Get.back();
      case OkCancelResult.cancel:
        return;
    }
  }
}
