import '../controller/make_a_donation_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MakeADonationScreen.
///
/// This class ensures that the MakeADonationController is created when the
/// MakeADonationScreen is first loaded.
class MakeADonationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeADonationController());
  }
}
