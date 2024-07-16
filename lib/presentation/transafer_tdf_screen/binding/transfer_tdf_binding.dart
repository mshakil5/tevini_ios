import '../controller/Transfer_tdf_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DonationRecordScreen.
///
/// This class ensures that the DonationRecordController is created when the
/// DonationRecordScreen is first loaded.
class transferTDFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferTDFController());
  }
}
