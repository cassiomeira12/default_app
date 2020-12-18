import 'package:default_app/app/shared/repositories/parse/parse_init.dart';
import 'package:default_app/app/utils/strings/errors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';
import 'parse/parse_company_service.dart';

class AdminCompanyService extends GetxController {
  final admin = false.obs;
  var user;

  var auth = Get.put(AuthService());
  var companyService = ParseCompanyService();

  currentAdminUser() async {
    await ParseInit.init();
    user = await auth.currentUser();
    if (user == null) {
      admin.value = false;
    } else {
      var hasCompany =
          await companyService.userHasCompany(user).catchError((error) {
        throw Exception(ERROR_LOGIN_PASSWORD);
      });
      admin.value = hasCompany;
      var pref = await SharedPreferences.getInstance();
      pref.setBool("hasCompany", hasCompany);
      if (!hasCompany) {
        await user.logout();
      }
    }
    return user;
  }

  isAdmin() {
    return admin.value;
  }
}
