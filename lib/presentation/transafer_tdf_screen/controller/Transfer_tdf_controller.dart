import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/donation_record_screen/models/donation_record_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';
import '../models/transction_tdf_model.dart';

/// A controller class for the DonationRecordScreen.
///
/// This class manages the state of the DonationRecordScreen, including the
/// current donationRecordModelObj
class TransferTDFController extends GetxController {
  TextEditingController searchController = TextEditingController();
  late ApiClient  _apiClient;
  TextEditingController searchController1 = TextEditingController();
  RxList<TranscationTdfModel> transferTDFList = List<TranscationTdfModel>.empty(growable: true).obs;

  TextEditingController controllerFilterTDF = TextEditingController();

  RxList<TranscationTdfModel> tdfSearching =
      List<TranscationTdfModel>.empty(growable: true).obs;


  @override
  void onInit() async{
    // TODO: implement onInit
    _apiClient=ApiClient();
    print('ApiURL.transferTDFUrl :: ${ApiURL.transferTDFUrl}');
    print('ApiURL.transferTDFUrl :: ${ApiURL.getOrderHistoryUrl}');
    print('TransferTDFController.onInit');
    await getTransferToTDFCTR();
    super.onInit();
  }
  Future getTransferToTDFCTR() async {
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
      apiUrl: ApiURL.transferTDFUrl,
      PARAM: {},
    );



    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('TDF :: $mapdata');
      final list = (mapdata['response']['data'] as List).map((x) => TranscationTdfModel.fromJson(x)).toList();
      transferTDFList.value = list;
    } else {
      print('TransferTDFController.getDonationRecordCTR');
      transferTDFList.value = [];
    }
  }


  onSearchTextChangedTDF(String text) async {
    print('Check >>>> $text');
    tdfSearching.clear();
    if (text.isEmpty) {
      return;
    }

    transferTDFList.forEach((tdfValue) {

      if (tdfValue.tdfaccount.toLowerCase().contains(text.toLowerCase())) {
        tdfSearching.add(tdfValue);
      }
    });


  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    searchController1.dispose();
  }
}
