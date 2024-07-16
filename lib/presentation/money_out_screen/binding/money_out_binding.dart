import '../controller/money_out_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MoneyOutScreen.
///
/// This class ensures that the MoneyOutController is created when the
/// MoneyOutScreen is first loaded.
class MoneyOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoneyOutController());
  }
}
