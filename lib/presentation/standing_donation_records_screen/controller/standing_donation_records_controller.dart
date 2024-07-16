
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/standingorder_record_model.dart';
import '../../../main.dart';
import '../../home_page/controller/home_controller.dart';
import '../../make_a_donation_screen/models/make_a_donation_model.dart';

class StandingDonationRecordsController extends GetxController {
  HomeController controller2 = Get.find();
  final switchValue = false.obs;
  final isSwitchValueList = [].obs;
  TextEditingController searchController = TextEditingController();
  late ApiClient _apiClient;
  RxList<StandingOrderRecordModel> standOrderRecordDataList =
  List<StandingOrderRecordModel>.empty(growable: true).obs;
  TextEditingController controllerFilter = TextEditingController();
  RxList<StandingOrderRecordModel> searchResult1 = List<StandingOrderRecordModel>.empty(growable: true).obs;
  @override
  void onClose() {
  super.onClose();
  searchController.dispose();
  }

  @override
  void onInit() async{
  _apiClient = ApiClient();
  await getStandingRecord();
   super.onInit();
  }


  /// Order List Search
  onSearchTextChangedStandingListSearch(String text) async {
  print('Check >>>> $text');
  searchResult1.clear();
  if (text.isEmpty) {
  return;
  }
  standOrderRecordDataList.forEach((searchValue) {
  if (searchValue.charityName.toLowerCase().contains(text.toLowerCase())) {
  searchResult1.add(searchValue);
  }
  });


  }

  Future getStandingRecord() async {
    print('StandingDonationRecordsController.getStandingRecord');
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
  apiUrl: ApiURL.getStandOrderRecordUrl,
  PARAM: {},
  );

  if (response != null) {
    standOrderRecordDataList.clear();
  print('HomeController.homeAllProductsCTR');
  final Map<String, dynamic> mapdata = response.data;
  print('HomeController.getDonationRecordCTR ${mapdata}');
  final list = (mapdata['response']['data'] as List)
      .map((x) => StandingOrderRecordModel.fromJson(x))
      .toList();




 // standOrderRecordDataList.value = list;

  list.forEach((stdDonor) {
    if(stdDonor.status=='1'){
      isSwitchValueList.add(true);
    }else{
      isSwitchValueList.add(false);
    }
    print('HomeController.onSearchTextChanged Id >>>> ${stdDonor.charityId}');

    String? charityName;
    if (controller2.makeADonationModelObj.value.isNotEmpty) {
      BeneficiaryGetAllCharityModel charity = controller2.makeADonationModelObj.value.firstWhere((BeneficiaryGetAllCharityModel element) =>
      element.id == int.parse(stdDonor.charityId.toString()),
          orElse: () => controller2.dummyData);
      charityName = charity.name;

      print('HomeController.getDonationRecordCTR ${charity.name}');
      print('HomeController.getDonationRecordCTR >> ${charity.id}');
      if(int.parse(stdDonor.charityId.toString())==int.parse(charity.id.toString())){
        print('match');
        standOrderRecordDataList.add(StandingOrderRecordModel(
            id:stdDonor.id,
            userId:stdDonor.userId,
            charityId:stdDonor.charityId,
            charityName:charity.name,
            amount:stdDonor.amount,
            currency:stdDonor.currency,
            anoDonation:stdDonor.anoDonation,
            standingOrder:stdDonor.standingOrder,
            // confirmDonation:searchValue.confirmDonation,
            charitynote:stdDonor.charitynote,
            mynote:stdDonor.mynote,
            notification:stdDonor.notification,
            status:stdDonor.status,
            updatedBy:stdDonor.updatedBy,
            createdBy:stdDonor.createdAt,
            createdAt:stdDonor.createdAt,
            updatedAt:stdDonor.updatedAt,
            payments: stdDonor.payments,
            numberPayments: stdDonor.numberPayments,
            paymentMade: stdDonor.paymentMade,
            starting: stdDonor.starting,
            interval: stdDonor.interval
        )
        );

      }else{
        print('not match ');
      }
    }else{
      print('else if ');
    }

  });
  standOrderRecordDataList= standOrderRecordDataList;


  } else {
  print('HomeController.homeAllProductsCTR');
  standOrderRecordDataList.value = [];
  }
  print(
  'HomeController.getDonationRecordCTR lng :: ${standOrderRecordDataList.length}');
  }

  Future getStandingRecordDetails(int standingId) async {
    print('standingId ::$standingId');
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
      apiUrl: ApiURL.getStandOrderRecordUrl+'/$standingId',
      PARAM: {},
    );

    if (response != null) {
      print('HomeController.homeAllProductsCTR');
      final Map<String, dynamic> mapdata = response.data;

      print('response :: ${mapdata}');
      if(mapdata['success']==true){
        print('StandingDonationRecordsController.getStandingRecordDetails ##');
        List<int> d=[1,5];
        Get.toNamed(AppRoutes.singleStandingDonationRecord,arguments:d );

      }

      print('HomeController.getDonationRecordCTR ${mapdata}');
      final list = (mapdata['response']['data'] as List)
          .map((x) => StandingOrderRecordModel.fromJson(x))
          .toList();




    } else {
      print('HomeController.homeAllProductsCTR');
      standOrderRecordDataList.value = [];
    }
    print('HomeController lng :: ${standOrderRecordDataList.length}');
  }

  switchOnOFFStandingDonation(int id) async {
   var token = await localStoreSRF.getString('token');
    print('switch ::${switchValue.value}');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "id": id.toString(),
        "status": switchValue.value ? '1' : '0',
      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.standingDonationOnOffUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
    } else {
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Contact submit has failed');
    }
  }
  }


