import '../controller/mobile_verification_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MobileVerificationScreen.
///
/// This class ensures that the MobileVerificationController is created when the
/// MobileVerificationScreen is first loaded.
class MobileVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobileVerificationController());
  }
}
