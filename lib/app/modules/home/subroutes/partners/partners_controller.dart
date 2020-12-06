import 'package:default_app/app/shared/repositories/parse_company_service.dart';

class PartnersController {
  var repository = ParseCompanyService();

  listCompanies() {
    return repository.list();
  }
}
