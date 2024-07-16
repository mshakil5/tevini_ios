import '../controller/frame_18706_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame18706Screen.
///
/// This class ensures that the Frame18706Controller is created when the
/// Frame18706Screen is first loaded.
class Frame18706Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame18706Controller());
  }
}
