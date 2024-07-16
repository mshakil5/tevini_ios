import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/values/app_helper.dart';
import '../../../../core/values/app_url.dart';
import '../../../../data/apiClient/api_client.dart';
import '../../../../data/models/donor_model.dart';
import '../../../../data/models/home/dashboard_model.dart';
import '../../../../main.dart';
import '../../../../presentation/make_a_donation_screen/models/make_a_donation_model.dart';

class CharityDashboardController extends GetxController {
  final pendingTransaction = '0'.obs;

  RxList<DonorModel> donorList =
      List<DonorModel>.empty(growable: true).obs;


  DonorModel dummyDonorData = DonorModel(
      id: 0,
      name: 'No name',
    email: 'address',
    );


  BeneficiaryGetAllCharityModel dummyData = BeneficiaryGetAllCharityModel(
    id: 0,
    name: 'No name',
    address: 'address',
    number: 'number',
    email: 'email@gmail.com',
    password: '***',
    bankStatement: '',
    town: 'town',
    postCode: 'postCode',
    accNo: 'accNo',
    balance: 'balance',
    pending: 'pending',
    status: 'status',
    updatedBy: 'updatedBy',
    createdBy: 'createdBy',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),


  );

  final count = 0.obs;
  late ApiClient _apiClient;

  final allCharityList = List<BeneficiaryGetAllCharityModel>.empty(growable: true).obs;


  RxList<Alltransaction> inTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> outTransactionsDataList =


      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> outTransactionsDataListSearch =

      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> pendingTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;
  @override
  void onInit() async{

    _apiClient = ApiClient();
    //await getBeneficiaryGetAllCharityCTR();
    charityDashboard();
    getAllDonor();
    getTransactionCharity();
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
   charityUrgentRequestPostBTN() async {
    String? id = localStoreSRF.getString('id');
    print('submitAddExternalDonationBTN id $id ');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "charity_id":id.toString(),

      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.urgentRequestUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);

    } else {
      Helpers.snackbarForErorr(
          titleText: ' Error Alert',
          bodyText: 'Urgent Request has Field');
    }
  }

  /// done
  Future getBeneficiaryGetAllCharityCTR() async {
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
      enableLoading: false,
    );

    if (response != null) {
      print(response.statusCode);
      print(response.data);
      final Map<String, dynamic> mapdata = response.data;
      print('mapdata ::${mapdata.toString()}');
      final list = (mapdata['data'] as List)
          .map((x) => BeneficiaryGetAllCharityModel.fromJson(x))
          .toList();
      allCharityList.value = list;
    } else {
      print('HomeController.getOrderVoucherBooksCTR');
      allCharityList.value = [];
    }

    print('charity Dashboard allCharityList Lng : ${allCharityList.length.toString()}');
  }


  /// done
  Future getTransactionCharity() async {

    String? token = await localStoreSRF.getString('token');
    String? id = await localStoreSRF.getString('id');
    print('CharityTransctionController.getTransactionCharity >> Id $id');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.charityTransactionUrl+'$id',
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      print('HomeController.getAllTransactionRecordCTR');
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getAllTransactionRecordCTR');

      final intransactions = (mapdata['intransactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();

      final outtransactions = (mapdata['outtransactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();


      final pendingTransactions =
      (mapdata['pending_transactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();


      int index=-1;
      outTransactionsDataList.forEach((searchValue) {
        index++;
        if (allCharityList.isNotEmpty) {

          BeneficiaryGetAllCharityModel charity =
          allCharityList.firstWhere((BeneficiaryGetAllCharityModel element) => int.parse(element.id.toString()) == int.parse(searchValue.charityId.toString()),
              orElse: () => dummyData);

          if(int.parse(searchValue.charityId.toString())==int.parse(charity.id.toString())){

            outTransactionsDataList[index].charityName=charity.name??'';
            print('ck Name :: ${outTransactionsDataList[index].charityName}');
          }
        }
      });
      //donationRecordDataList= donationRecordDataList1;



      inTransactionDataList.value = intransactions;
      outTransactionsDataList.value = outtransactions;
      pendingTransactionDataList.value = pendingTransactions;
    } else {
      print('HomeController.getStandOrderRecordCTR');

      inTransactionDataList.value = [];
      outTransactionsDataList.value = [];
      pendingTransactionDataList.value = [];
    }

    print('HomeCon.getStandOrderRecordCTR In  ${inTransactionDataList.length}');
    print('Hon. lng ${outTransactionsDataList.length}');
    print('.  Pending ${pendingTransactionDataList.length}');
  }

  /// Charity Dashboard

  /// done
  Future charityDashboard() async {
    String? token = await localStoreSRF.getString('token');
    String? id = await localStoreSRF.getString('id');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      enableLoading: false,
      apiUrl: ApiURL.getCharityDashboardUrl+id.toString(),
      PARAM: {},
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('CharityDashboardController.charityDashboard ${mapdata['pending_transactions']} ');
      if(mapdata['pending_transactions']==0){
      }else{
        pendingTransaction.value = mapdata['pending_transactions'];
      }

    }
    else {}
  }
  
  /// Get All Donor List
//getAllDonorUrl


  /// done
  Future getAllDonor() async {
    print('CharityDashboardController.getAllDonor List ');
    String? token = await localStoreSRF.getString('token');
    String? id = await localStoreSRF.getString('id');
    print('getAllDonorUrl URl ${ApiURL.getAllDonorUrl}');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getAllDonorUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      final list = (mapdata['data'] as List)
          .map((x) => DonorModel.fromJson(x))
          .toList();
      donorList.value = list;
    } else {
      print('CharityDashboardController.getAllDonor');
      donorList.value = [];
    }

    print('CharityDashboardController.getAllDonor ${donorList.length.toString()}');

  }


  ///Standing Filter
  List<Alltransaction> itemsBetweenDatesCharityTransaction({
    required List<Alltransaction> dates,
    required DateTime start,
    required DateTime end,
  }) {
    var dateFormat = DateFormat('y-MM-dd');

    var output = <Alltransaction>[];
    for (var i = 0; i < dates.length; i += 1) {
      var date = dateFormat.parse(dates[i].createdAt.toString(), true);
      if (date.compareTo(start) >= 0 && date.compareTo(end) <= 0) {
        output.add(dates[i]);
      }
    }
    return output;
  }
}
