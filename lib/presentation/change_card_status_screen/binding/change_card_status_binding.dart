import '../controller/change_card_status_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChangeCardStatusScreen.
///
/// This class ensures that the ChangeCardStatusController is created when the
/// ChangeCardStatusScreen is first loaded.
class ChangeCardStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeCardStatusController());
  }
}
