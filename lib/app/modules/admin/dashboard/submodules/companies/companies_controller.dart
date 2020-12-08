import 'package:default_app/app/shared/repositories/parse_company_service.dart';

class CompaniesController {
  var repository = ParseCompanyService();

  list() {
    return repository.list();
  }
}
