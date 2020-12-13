import 'package:default_app/app/shared/repositories/parse_company_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var companyRepository = ParseCompanyService();

  Future<dynamic> companies;

  listCompanies() {
    if (companies == null) {
      companies = companyRepository.listCompanies();
    }
    return companies;
  }
}
