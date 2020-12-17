import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:default_app/app/shared/repositories/parse/parse_login_service.dart';
import 'package:default_app/app/shared/repositories/parse/parse_super_admin_service.dart';
import 'package:default_app/app/utils/strings/errors.dart';
import 'package:get/get.dart';

class LoginController {
  var loginService = ParseLoginService();
  var superAdminService = ParseSuperAdminService();

  var auth = Get.find<AuthService>();

  signIn(email, password) async {
    var result = await loginService.signIn(email, password);
    var user = await auth.currentUser();
    var isAdmin = await superAdminService.findBy('user', user.toPointer());
    if (isAdmin.isEmpty) {
      await user.logout();
      throw Exception(ERROR_LOGIN_PASSWORD);
    }
    return result;
  }
}
