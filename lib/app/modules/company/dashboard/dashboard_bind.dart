import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
