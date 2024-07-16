import 'package:get/get.dart';

import '../controllers/tivini_card_webview_controller.dart';

class TiviniCardWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TiviniCardWebViewController>(
      () => TiviniCardWebViewController(),
    );
  }
}
