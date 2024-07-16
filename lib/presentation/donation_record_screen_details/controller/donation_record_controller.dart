import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/donation_record_screen/models/donation_record_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';

/// A controller class for the DonationRecordScreen.
///
/// This class manages the state of the DonationRecordScreen, including the
/// current donationRecordModelObj
class DonationRecordDetailsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  late ApiClient  _apiClient;
  TextEditingController searchController1 = TextEditingController();
  RxList<DonationRecordModel> donationRecordList = List<DonationRecordModel>.empty(growable: true).obs;
 // Rx<DonationRecordModel> donationRecordModelObj = DonationRecordModel().obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    _apiClient=ApiClient();
    print('DonationRecordController.onInit ??????????????????????????');
    await getDonationRecordCTR();
    super.onInit();
  }
  Future getDonationRecordCTR() async {
    String? token = await localStoreSRF.getString('token');
       final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getOrderHistoryUrl,
      PARAM: {},
    );



    if (response != null) {
      print('HomeController.homeAllProductsCTR');
      final Map<String, dynamic> mapdata = response.data;
      print('test');
      final list = (mapdata['response']['data'] as List).map((x) => DonationRecordModel.fromJson(x)).toList();
      donationRecordList.value = list;
    } else {
      print('HomeController.homeAllProductsCTR');
      donationRecordList.value = [];
    }
  }
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    searchController1.dispose();
  }
}
