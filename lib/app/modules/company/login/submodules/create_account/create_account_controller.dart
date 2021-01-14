import 'package:get/get.dart';

import '../../../../../shared/repositories/parse/parse_login_service.dart';
import '../../../../../shared/repositories/parse/parse_user_service.dart';

class CreateAccountController extends GetxController {
  var service = ParseUserService();
  var login = ParseLoginService();

  Future<dynamic> createAccount(data) async {
    return service.create(data).then((value) {
      return login.signIn(data['email'], data['password']);
    });
  }
}
