import '../controller/pending_transaction_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PendingTransactionScreen.
///
/// This class ensures that the PendingTransactionController is created when the
/// PendingTransactionScreen is first loaded.
class PendingTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingTransactionController());
  }
}
