import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/order_record_screen/models/order_record_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';

/// A controller class for the OrderRecordScreen.
///
/// This class manages the state of the OrderRecordScreen, including the
/// current orderRecordModelObj
class OrderRecordController extends GetxController {
  TextEditingController searchController = TextEditingController();
  late ApiClient _apiClient;
 // Rx<OrderRecordModel> orderRecordModelObj = OrderRecordModel().obs;
  RxList<OrderRecordModel> orderHistoryDataList =
      List<OrderRecordModel>.empty(growable: true).obs;
  TextEditingController controllerFilter = TextEditingController();
  RxList<OrderRecordModel> searchResult1 = List<OrderRecordModel>.empty(growable: true).obs;
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  @override
  void onInit() async{
    _apiClient = ApiClient();
    await getOrderHistoryCTR();
    // TODO: implement onInit
    super.onInit();
  }


  /// Order List Search
  onSearchTextChangedOrderListSearch(String text) async {
    print('Check >>>> $text');
    searchResult1.clear();
    if (text.isEmpty) {
      return;
    }
    orderHistoryDataList.forEach((searchValue) {
      if (searchValue.orderId.contains(text)) {
        searchResult1.add(searchValue);
      }
    });


  }


  Future getOrderHistoryCTR() async {
    print('HomeController.getOrderHistoryCTR >>>>>>>>>>>>>>>>>>>>>>>');
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
      print('HomeController.getDonationRecordCTR ${mapdata}');
      final list = (mapdata['response']['data'] as List)
          .map((x) => OrderRecordModel.fromJson(x))
          .toList();
      orderHistoryDataList.value = list;
    } else {
      print('HomeController.homeAllProductsCTR');
      orderHistoryDataList.value = [];
    }
    print(
        'HomeController.getDonationRecordCTR lng :: ${orderHistoryDataList.length}');
  }
}
