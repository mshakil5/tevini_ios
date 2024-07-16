import '../controller/card_activation_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CardActivationScreen.
///
/// This class ensures that the CardActivationController is created when the
/// CardActivationScreen is first loaded.
class CardActivationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardActivationController());
  }
}
