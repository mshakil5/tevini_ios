import '../controller/maaser_calculator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MaaserCalculatorScreen.
///
/// This class ensures that the MaaserCalculatorController is created when the
/// MaaserCalculatorScreen is first loaded.
class MaaserCalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MaaserCalculatorController());
  }
}
