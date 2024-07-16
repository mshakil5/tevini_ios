import 'package:get/get.dart';

import '../controllers/charity_link_controller.dart';

class CharityLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityLinkController>(
      () => CharityLinkController(),
    );
  }
}
