import '../controller/order_a_card_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderACardTabContainerScreen.
///
/// This class ensures that the OrderACardTabContainerController is created when the
/// OrderACardTabContainerScreen is first loaded.
class OrderACardTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderACardTabContainerController());
  }
}
