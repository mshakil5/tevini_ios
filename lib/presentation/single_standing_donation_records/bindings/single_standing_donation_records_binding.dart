import 'package:get/get.dart';

import '../controllers/single_standing_donation_records_controller.dart';

class SingleStandingDonationRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleStandingDonationRecordsController>(
      () => SingleStandingDonationRecordsController(),
    );
  }
}
