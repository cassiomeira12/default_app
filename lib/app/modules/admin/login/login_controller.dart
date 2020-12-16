import 'package:default_app/app/shared/repositories/parse_login_service.dart';
import 'package:default_app/app/shared/repositories/parse_super_admin_service.dart';
import 'package:default_app/app/utils/strings/errors.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginController {
  var loginService = ParseLoginService();
  var superAdminService = ParseSuperAdminService();

  signIn(email, password) async {
    var result = await loginService.signIn(email, password);
    ParseUser currentUser = await ParseUser.currentUser();
    var isAdmin = await superAdminService.findBy(
      'user',
      currentUser.toPointer(),
    );
    if (isAdmin.isEmpty) {
      await currentUser.logout();
      throw Exception(ERROR_LOGIN_PASSWORD);
    }
    return result;
  }
}
