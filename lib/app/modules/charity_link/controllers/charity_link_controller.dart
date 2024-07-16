import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_helper.dart';
import '../../../../core/values/app_url.dart';
import '../../../../data/apiClient/api_client.dart';
import '../../../../main.dart';

class CharityLinkController extends GetxController {
  //TODO: Implement CharityLinkController
  final GlobalKey<ScaffoldState> charityKeyLink = new GlobalKey<ScaffoldState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final amountController = TextEditingController();
  late ApiClient _apiClient;
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

  /// Urgent Request
  charitySendALinkSubmit() async {
    if (nameController.text.toString() == '' &&
        mailController.text.toString() == '' &&
        amountController.text.toString() == '') {
      return Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Please Select Field');
    } else {
      String? id = localStoreSRF.getString('id');
      String? token = await localStoreSRF.getString('token');
      final response = await _apiClient.connection(
        API_TYPE: '',
        apiType: 'POST',
        REQUEST_TYPE: '',
        REQUEST_DATA: {
          "charity_id": id.toString(),
          "name": nameController.text.toString(),
          "email": mailController.text.toString(),
          "amount": amountController.text.toString()
        },
        customheader: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        apiUrl: ApiURL.charityCreateLinkUrl,
        PARAM: {},
      );

      if (response != null) {
        nameController.clear();
        mailController.clear();
        amountController.clear();
        Helpers.snackbarForSucess(
            titleText: 'Successful Alert',
            bodyText: response.data['response']['message']);
      } else {
        Helpers.snackbarForErorr(
            titleText: ' Error Alert', bodyText: 'Send A Link has Field');
      }
    }
  }
}
