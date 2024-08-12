import 'package:get/get.dart';
import 'package:tenvini/app/modules/tivini_card_viewweb/controllers/donation_webview_controller.dart';

class DonationWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonationWebViewController>(
      () => DonationWebViewController(),
    );
  }
}
