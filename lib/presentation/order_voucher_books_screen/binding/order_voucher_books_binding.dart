import '../controller/order_voucher_books_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderVoucherBooksScreen.
///
/// This class ensures that the OrderVoucherBooksController is created when the
/// OrderVoucherBooksScreen is first loaded.
class OrderVoucherBooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderVoucherBooksController());
  }
}
