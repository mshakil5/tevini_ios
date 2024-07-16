import '../controller/wating_voucher_records_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WatingVoucherRecordsScreen.
///
/// This class ensures that the WatingVoucherRecordsController is created when the
/// WatingVoucherRecordsScreen is first loaded.
class WatingVoucherRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WatingVoucherRecordsController());
  }
}
