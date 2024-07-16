import '../controller/standing_donation_records_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StandingDonationRecordsScreen.
///
/// This class ensures that the StandingDonationRecordsController is created when the
/// StandingDonationRecordsScreen is first loaded.
class StandingDonationRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StandingDonationRecordsController());
  }
}
