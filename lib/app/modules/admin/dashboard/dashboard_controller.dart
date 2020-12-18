import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:default_app/app/shared/repositories/parse/parse_version_app_service.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var versionAppService = ParseVersionAppService();

  Future<dynamic> versionApps;

  var auth = Get.find<AuthService>();

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
        await auth.currentUser().signOut();
        return kIsWeb ? Get.offNamed('/admin') : Get.offNamed('/splash');
      case OkCancelResult.cancel:
        return;
    }
  }

  updateVersionApp(item) {
    return versionAppService.update(item);
  }

  listVersionApps() {
    //if (versionApps == null) {
    versionApps = versionAppService.list();
    //}
    return versionApps;
  }
}
