import '../controller/all_transaction_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AllTransactionScreen.
///
/// This class ensures that the AllTransactionController is created when the
/// AllTransactionScreen is first loaded.
class AllTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTransactionController());
  }
}
