import 'package:get/get.dart';

import '../controllers/charity_change_password_controller.dart';

class ChariyChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityChangePasswordController>(
      () => CharityChangePasswordController(),
    );
  }
}
