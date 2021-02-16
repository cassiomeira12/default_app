import 'package:default_app/app/shared/repositories/parse/parse_company_service.dart';
import 'package:default_app/app/shared/repositories/parse/parse_plan_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var companyRepository = ParseCompanyService();
  var plansRepository = ParsePlanService();

  Future<dynamic> companies;
  Future<dynamic> plans;

  listCompanies() {
    if (companies == null) {
      companies = companyRepository.listCompanies();
    }
    return companies;
  }

  listPlans() {
    if (plans == null) {
      plans = plansRepository.listPlans();
    }
    return plans;
  }
}
