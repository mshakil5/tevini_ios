import '../controller/order_a_card_controller.dart';

import 'package:get/get.dart';

class OrderACardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderACardController());
  }
}
