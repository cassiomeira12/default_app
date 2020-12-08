import 'package:default_app/app/shared/repositories/parse_user_service.dart';

class AdminController {
  var service = ParseUserService();

  currentUser() {
    return service.currentUser();
  }
}
