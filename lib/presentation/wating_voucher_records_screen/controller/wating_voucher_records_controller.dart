import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/wating_voucher_records_screen/models/wating_voucher_records_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/await_confirmation_model.dart';
import '../../../main.dart';

/// A controller class for the WatingVoucherRecordsScreen.
///
/// This class manages the state of the WatingVoucherRecordsScreen, including the
/// current watingVoucherRecordsModelObj
class WatingVoucherRecordsController extends GetxController {
  TextEditingController searchController = TextEditingController();


  RxList<AwaitConfirmationModel> waitingVoucherRecordDataList =
      List<AwaitConfirmationModel>.empty(growable: true).obs;
  late ApiClient _apiClient;
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  @override
  void onInit() async{
    _apiClient = ApiClient();
   await getWaitingVoucherRecordCTR();
    super.onInit();
  }

  /// done Pending  Todo List
  Future getWaitingVoucherRecordCTR() async {
   var token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getWaitingVoucherRecordUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;

      final list = (mapdata['response']['data'] as List)
          .map((x) => AwaitConfirmationModel.fromJson(x))
          .toList();
      waitingVoucherRecordDataList.value =list;
    } else {
      waitingVoucherRecordDataList.value = [];
    }

   print('Await :: ${waitingVoucherRecordDataList.length}');
  }

  /// Awaiting Cancel
  awaitingVoucherCancelCTR(String voucherId,String charityId) async {
    String? id = localStoreSRF.getString('id');
    print('WatingVoucherRecordsController.awaitingVoucherCancelCTR id $id');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "charity_id":charityId.toString(),
        "voucher_id":voucherId.toString(),

      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },

      apiUrl: ApiURL.awaitingVoucherCancelUrl,
      PARAM: {},
    );

    if (response != null) {
      await getWaitingVoucherRecordCTR();
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);

    } else {
      Helpers.snackbarForErorr(
          titleText: ' Error Alert',
          bodyText: 'Awaiting Voucher has Field');
    }
  }


  /// Awaiting Confirm
  awaitingVoucherConfirmCTR(String voucherId,String charityId) async {
    String? id = localStoreSRF.getString('id');
    print('WatingVoucherRecordsController.awaitingVoucherConfirmCTR id $id');

    print('vouId :: $voucherId');
    print('charityId :: $charityId');
    String? token = await localStoreSRF.getString('token');
    print('url :: ${ApiURL.awaitingVoucherConfirmUrl}');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "charity_id":charityId.toString(),
        "voucher_id":voucherId.toString(),
      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.awaitingVoucherConfirmUrl,
      PARAM: {},
    );

    if (response != null) {
      await getWaitingVoucherRecordCTR();
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);

    } else {
      Helpers.snackbarForErorr(
          titleText: ' Error Alert',
          bodyText: 'Awaiting Voucher has Field');
    }
  }


}
