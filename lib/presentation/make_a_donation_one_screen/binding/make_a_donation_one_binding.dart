import '../controller/make_a_donation_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MakeADonationOneScreen.
///
/// This class ensures that the MakeADonationOneController is created when the
/// MakeADonationOneScreen is first loaded.
class MakeADonationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeADonationOneController());
  }
}
