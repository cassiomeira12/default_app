import 'package:default_app/app/shared/repositories/parse_user_service.dart';

class CompanyController {
  var service = ParseUserService();

  currentUser() {
    return service.currentUser();
  }
}
