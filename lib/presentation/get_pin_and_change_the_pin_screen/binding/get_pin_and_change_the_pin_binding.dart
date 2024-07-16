import '../controller/get_pin_and_change_the_pin_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetPinAndChangeThePinScreen.
///
/// This class ensures that the GetPinAndChangeThePinController is created when the
/// GetPinAndChangeThePinScreen is first loaded.
class GetPinAndChangeThePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPinAndChangeThePinController());
  }
}
