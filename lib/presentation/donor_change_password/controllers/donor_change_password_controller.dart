import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';
import '../../../routes/app_routes.dart';

class DonorChangePasswordController extends GetxController {

  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isShowPasswordConfirm = true.obs;
  late ApiClient _apiClient;
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    _apiClient = ApiClient();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;



  /// done
  Future changePasswordCtn() async {
    print('old password:: ${oldPassController.text}');
    print('new password :: ${newPassController.text}');
    print('confirm password:: ${confirmPassController.text}');

    if (newPassController.text == '' && confirmPassController.text == '') {
      return Helpers.snackbarForErorr(
          titleText: 'Error Alert',
          bodyText: 'fill up new password and confirm password');
    } else {
      if (newPassController.text != confirmPassController.text) {
        return Helpers.snackbarForErorr(
            titleText: 'Error Alert',
            bodyText: 'New Password and confirm password are not match');
      } else {
        print('MyProfileController.getUserProfileInfo');
        String? token = await localStoreSRF.getString('token');
        String? id = localStoreSRF.getString('id');
        final response = await _apiClient.connection(
          API_TYPE: 'POST',
          apiType: 'POST',
          REQUEST_TYPE: '',
          REQUEST_DATA: {
            //"charityid": id.toString(),
            "password": newPassController.text.toString(),
            "cpassword": confirmPassController.text.toString(),
          },
          customheader: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          apiUrl: ApiURL.updateProfileUrl,
          PARAM: {},
        );

        if (response != null) {
          final Map<String, dynamic> mapdata = response.data;
          var info = mapdata['response']['data'];
          Get.offNamedUntil(AppRoutes.signInScreen, (route) => false);
        }
      }
    }
  }

}
