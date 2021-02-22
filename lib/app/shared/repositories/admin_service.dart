import 'package:default_app/app/utils/strings/errors.dart';
import 'package:get/get.dart';

import 'auth_service.dart';
import 'parse/parse_super_admin_service.dart';

class AdminService extends GetxController {
  final admin = false.obs;
  var user;

  var auth = Get.find<AuthService>();
  var superAdminService = ParseSuperAdminService();

  currentAdminUser() async {
    user = await auth.currentUser();
    if (user == null) {
      admin.value = false;
    } else {
      try {
        var isAdmin = await superAdminService
            .findBy('user', user.toPointer())
            .catchError((error) {
          throw Exception(ERROR_LOGIN_PASSWORD);
        });
        admin.value = isAdmin.isNotEmpty;
        if (isAdmin.isEmpty) {
          await auth.logout();
        }
      } catch (error) {
        await auth.logout();
      }
    }
    return user;
  }

  isAdmin() {
    return admin.value;
  }
}
