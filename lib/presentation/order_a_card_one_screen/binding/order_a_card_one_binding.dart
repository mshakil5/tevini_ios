import '../controller/order_a_card_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderACardOneScreen.
///
/// This class ensures that the OrderACardOneController is created when the
/// OrderACardOneScreen is first loaded.
class OrderACardOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderACardOneController());
  }
}
