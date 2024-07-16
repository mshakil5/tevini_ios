import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/splash_secreen_screen/models/splash_secreen_model.dart';

/// A controller class for the SplashSecreenScreen.
///
/// This class manages the state of the SplashSecreenScreen, including the
/// current splashSecreenModelObj
class SplashSecreenController extends GetxController {
  Rx<SplashSecreenModel> splashSecreenModelObj = SplashSecreenModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(
        AppRoutes.signInScreen,
      );
    });
  }
}
