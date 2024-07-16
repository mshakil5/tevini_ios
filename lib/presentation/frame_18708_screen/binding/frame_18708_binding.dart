import '../controller/frame_18708_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame18708Screen.
///
/// This class ensures that the Frame18708Controller is created when the
/// Frame18708Screen is first loaded.
class Frame18708Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame18708Controller());
  }
}
