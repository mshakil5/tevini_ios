import '../controller/money_in_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MoneyInScreen.
///
/// This class ensures that the MoneyInController is created when the
/// MoneyInScreen is first loaded.
class MoneyInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoneyInController());
  }
}
