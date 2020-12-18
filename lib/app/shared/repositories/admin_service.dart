import 'package:default_app/app/shared/repositories/parse/parse_init.dart';
import 'package:get/get.dart';

import 'auth_service.dart';
import 'parse/parse_super_admin_service.dart';

class AdminService extends GetxController {
  final admin = false.obs;
  var user;

  var auth = Get.put(AuthService());
  var superAdminService = ParseSuperAdminService();

  currentAdminUser() async {
    await ParseInit.init();
    user = await auth.currentUser();
    if (user == null) {
      admin.value = false;
    } else {
      var isAdmin = await superAdminService.findBy('user', user.toPointer());
      admin.value = isAdmin.isNotEmpty;
      if (isAdmin.isEmpty) {
        await user.logout();
      }
    }
    return user;
  }

  isAdmin() {
    return admin.value;
  }
}
