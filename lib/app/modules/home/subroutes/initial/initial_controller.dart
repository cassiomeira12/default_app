import 'package:default_app/app/shared/repositories/parse_company_service.dart';

class InitialController {
  var companyRepository = ParseCompanyService();

  listCompanies() {
    return companyRepository.list();
  }
}
