
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:tenvini/core/utils/pref_utils.dart';
import 'package:tenvini/presentation/home_page/controller/home_controller.dart';

import '../../data/apiClient/api_client.dart';
import '../network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(PrefUtils());
    //Get.put(HomeController());

    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
