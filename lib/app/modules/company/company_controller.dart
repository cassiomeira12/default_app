import 'package:default_app/app/shared/repositories/parse_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyController {
  var service = ParseUserService();

  currentUser() async {
    var currentUser = await service.currentUser();
    var pref = await SharedPreferences.getInstance();
    var hasCompany = pref.getBool("hasCompany");
    if (!hasCompany) {
      await currentUser.logout();
      throw Exception("Estabelecimento não encontrado");
    }
    return service.currentUser();
  }
}
