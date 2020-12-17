import 'package:get/get.dart';

import 'company_controller.dart';

class CompanyBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyController>(() => CompanyController());
  }
}
