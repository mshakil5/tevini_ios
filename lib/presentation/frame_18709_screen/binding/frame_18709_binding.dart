import '../controller/frame_18709_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame18709Screen.
///
/// This class ensures that the Frame18709Controller is created when the
/// Frame18709Screen is first loaded.
class Frame18709Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame18709Controller());
  }
}
