import 'package:default_app/app/shared/repositories/parse/parse_company_service.dart';

class CompanyController {
  var repository = ParseCompanyService();

  list() {
    return repository.list();
  }
}
