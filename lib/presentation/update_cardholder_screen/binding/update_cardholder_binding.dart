import '../controller/update_cardholder_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UpdateCardholderScreen.
///
/// This class ensures that the UpdateCardholderController is created when the
/// UpdateCardholderScreen is first loaded.
class UpdateCardholderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateCardholderController());
  }
}
