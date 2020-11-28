import 'package:default_app/app/shared/repositories/parse_company_service.dart';

class NotificationController {
  var respository = ParseCompanyService();
  list() {
    return respository.list();
  }
}
