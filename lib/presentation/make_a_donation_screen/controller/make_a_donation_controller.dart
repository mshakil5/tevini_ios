import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/make_a_donation_screen/models/make_a_donation_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../main.dart';

/// A controller class for the MakeADonationScreen.
///
/// This class manages the state of the MakeADonationScreen, including the
/// current makeADonationModelObj
class MakeADonationController extends GetxController {
  TextEditingController amountController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  TextEditingController writeyourController = TextEditingController();


  RxList<BeneficiaryGetAllCharityModel> makeADonationModelObj =
      List<BeneficiaryGetAllCharityModel>.empty(growable: true).obs;
  Rx<bool> makethisananony = false.obs;

  Rx<bool> setupastandingo = false.obs;

  Rx<bool> iconfirmthatthi = false.obs;

  SelectionPopupModel? selectedDropDownValue;

  late ApiClient _apiClient;
  @override
  void onInit() {
    // TODO: implement onInit
    _apiClient = ApiClient();
    getBeneficiaryGetAllCharityCTR();
    super.onInit();
  }

  /// done
  Future getBeneficiaryGetAllCharityCTR() async {
    print('HomeController.getOrderVoucherBooksCTR');
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
      apiUrl: ApiURL.getAllCharityUrl,
      PARAM: {},
    );

    if (response != null) {

      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getOrderVoucherBooksCTR');
      final list = (mapdata['response']['data'] as List)
          .map((x) => BeneficiaryGetAllCharityModel.fromJson(x))
          .toList();
      makeADonationModelObj.value = list;
    } else {
      print('HomeController.getOrderVoucherBooksCTR');
      makeADonationModelObj.value = [];
    }

    print('HomeController.getOrderVoucherBooksCTR ${makeADonationModelObj.length.toString()}');
  }

  @override
  void onClose() {
    super.onClose();
    amountController.dispose();
    frameOneController.dispose();
    writeyourController.dispose();
  }

  /*onSelected(dynamic value) {
    for (var element in makeADonationModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    BeneficiaryGetAllCharityModel.dropdownItemList.refresh();
  }*/
}
