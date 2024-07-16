import 'package:get/get.dart';

import '../controllers/forget_password_viewweb_controller.dart';

class ForgetPasswordViewwebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordViewwebController>(
      () => ForgetPasswordViewwebController(),
    );
  }
}
