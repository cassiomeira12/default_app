import 'package:default_app/app/shared/repositories/parse_company_service.dart';
import 'package:default_app/app/shared/repositories/parse_login_service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  var loginService = ParseLoginService();
  var companyService = ParseCompanyService();

  signIn(email, password) async {
    var result = await loginService.signIn(email, password);
    ParseUser currentUser = await ParseUser.currentUser();
    var hasCompany = await companyService.userHasCompany(currentUser);
    if (hasCompany) {
      var pref = await SharedPreferences.getInstance();
      pref.setBool("hasCompany", hasCompany);
    } else {
      await currentUser.logout();
      throw Exception("Estabelecimento não encontrado");
    }
    return result;
  }
}
