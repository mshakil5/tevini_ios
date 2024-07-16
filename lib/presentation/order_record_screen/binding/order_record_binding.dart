import '../controller/order_record_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderRecordScreen.
///
/// This class ensures that the OrderRecordController is created when the
/// OrderRecordScreen is first loaded.
class OrderRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderRecordController());
  }
}
