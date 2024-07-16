import '../controller/get_pin_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetPinTabContainerScreen.
///
/// This class ensures that the GetPinTabContainerController is created when the
/// GetPinTabContainerScreen is first loaded.
class GetPinTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPinTabContainerController());
  }
}
