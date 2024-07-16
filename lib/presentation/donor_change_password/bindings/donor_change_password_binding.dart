import 'package:get/get.dart';

import '../controllers/donor_change_password_controller.dart';

class DonorChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonorChangePasswordController>(
      () => DonorChangePasswordController(),
    );
  }
}
