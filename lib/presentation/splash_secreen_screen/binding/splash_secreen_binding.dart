import '../controller/splash_secreen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashSecreenScreen.
///
/// This class ensures that the SplashSecreenController is created when the
/// SplashSecreenScreen is first loaded.
class SplashSecreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashSecreenController());
  }
}
