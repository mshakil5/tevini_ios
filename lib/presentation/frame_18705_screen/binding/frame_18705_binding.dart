import '../controller/frame_18705_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame18705Screen.
///
/// This class ensures that the Frame18705Controller is created when the
/// Frame18705Screen is first loaded.
class Frame18705Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame18705Controller());
  }
}
