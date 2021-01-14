import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/strings/errors.dart';
import '../models/company/company.dart';
import '../models/user.dart';
import '../repositories/parse/parse_init.dart';
import 'auth_service.dart';
import 'parse/parse_company_service.dart';

class AdminCompanyService extends GetxController {
  final admin = false.obs;
  User user;
  Company company;

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
        await auth.logout();
      }
    }
    return user;
  }

  isAdmin() {
    return admin.value;
  }

  currentCompany() async {
    if (company == null) {
      var json = await companyService.getCompanyFromAdmin(user);
      company = Company.fromMap(json);
    }
    return company;
  }
}
