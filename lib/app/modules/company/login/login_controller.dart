import 'package:default_app/app/shared/repositories/admin_company_service.dart';
import 'package:default_app/app/shared/repositories/parse/parse_login_service.dart';
import 'package:get/get.dart';

class LoginController {
  var loginService = ParseLoginService();
  var admin = Get.put(AdminCompanyService());

  signIn(email, password) async {
    var result = await loginService.signIn(email, password);
    await admin.currentAdminUser();
    if (!admin.isAdmin()) {
      throw Exception("Estabelecimento não encontrado");
    }
    return result;
  }
}
