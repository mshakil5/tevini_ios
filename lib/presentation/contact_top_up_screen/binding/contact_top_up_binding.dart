import '../controller/contact_top_up_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ContactTopUpScreen.
///
/// This class ensures that the ContactTopUpController is created when the
/// ContactTopUpScreen is first loaded.
class ContactTopUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactTopUpController());
  }
}
