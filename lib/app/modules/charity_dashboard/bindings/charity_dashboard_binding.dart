import 'package:get/get.dart';

import '../controllers/charity_dashboard_controller.dart';

class CharityDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityDashboardController>(
      () => CharityDashboardController(),
    );
  }
}
