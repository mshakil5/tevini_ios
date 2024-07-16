import 'package:get/get.dart';

import '../controllers/charity_transction_controller.dart';

class CharityTransctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityTransctionController>(
      () => CharityTransctionController(),
    );
  }
}
