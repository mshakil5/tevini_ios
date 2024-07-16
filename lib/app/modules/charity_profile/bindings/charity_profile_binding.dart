import 'package:get/get.dart';

import '../controllers/charity_profile_controller.dart';

class CharityProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityProfileController>(
      () => CharityProfileController(),
    );
  }
}
