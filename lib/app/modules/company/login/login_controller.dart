import 'package:default_app/app/shared/repositories/parse_login_service.dart';

class LoginController {
  var service = ParseLoginService();

  signIn(email, password) {
    return service.signIn(email, password);
  }
}
