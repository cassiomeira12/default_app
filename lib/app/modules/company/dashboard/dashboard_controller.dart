import 'package:default_app/app/shared/repositories/parse_user_service.dart';

class DashBoardController {
  var userService = ParseUserService();

  currentUser() {
    return userService.currentUser();
  }

  signOut() {
    return userService.signOut();
  }
}
