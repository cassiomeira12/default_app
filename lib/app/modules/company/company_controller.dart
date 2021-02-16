import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyController {
  var auth = Get.find<AuthService>();

  currentUser() async {
    var currentUser = await auth.currentUser();
    var pref = await SharedPreferences.getInstance();
    var hasCompany = pref.getBool("hasCompany");
    if (!hasCompany) {
      await auth.logout();
      throw Exception("Estabelecimento não encontrado");
    }
    return currentUser;
  }
}
