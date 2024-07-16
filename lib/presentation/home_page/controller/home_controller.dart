import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/all_transaction_screen/models/all_transaction_model.dart';
import 'package:tenvini/presentation/donation_record_screen/models/donation_record_model.dart';
import 'package:tenvini/presentation/home_page/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../currency/model/currencies_model.dart';
import '../../../currency/model/rates_model.dart';
import '../../../currency/res/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/apiClient/repo.dart';
import '../../../data/models/await_confirmation_model.dart';
import '../../../data/models/donation_calculator_model.dart';
import '../../../data/models/donation_details_model.dart';
import '../../../data/models/home/dashboard_model.dart';
import '../../../data/models/standingorder_record_model.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../main.dart';
import '../../make_a_donation_screen/models/make_a_donation_model.dart';
import '../../my_profile_screen/controller/my_profile_controller.dart';
import '../../my_profile_screen/models/my_profile_model.dart';
import '../../order_record_screen/models/order_record_model.dart';
import '../../order_voucher_books_screen/models/order_voucher_books_model.dart';
import '../../standing_donation_records_screen/models/standing_donation_records_model.dart';
import '../../wating_voucher_records_screen/models/wating_voucher_records_model.dart';

import 'package:http/http.dart' as http;
class HomeController extends GetxController {

  final isAnimated = false.obs;
  final isBalanceShown = false.obs;
  final isBalance = true.obs;
  final isTDF=false.obs;

  Rx<ProfileInfoModel> getUserInfo = ProfileInfoModel().obs;
  final currentBalance='0.0'.obs;
  MyProfileController profile = Get.put(MyProfileController());
  late ApiClient _apiClient;
  TextEditingController searchController = TextEditingController();
  RxList<TransactionModel> leastTransaction =
      List<TransactionModel>.empty(growable: true).obs;
  RxList<OrderRecordModel> orderHistoryDataList =
      List<OrderRecordModel>.empty(growable: true).obs;
  RxList<DonationRecordModel> donationRecordDataList =
      List<DonationRecordModel>.empty(growable: true).obs;

  /// TDF

  final transferTDFList = List<DonationRecordModel>.empty(growable: true).obs;

  final donationRecordDataList1 = List<DonationRecordModel>.empty(growable: true).obs;

  final donationRecordDataDetailsList = List<DonationDetailsModel>.empty(growable: true).obs;

  RxList<DonationRecordModel> searchResult1 =
      List<DonationRecordModel>.empty(growable: true).obs;

  RxList<DonationCalculationModel> searchRegularIncome =
      List<DonationCalculationModel>.empty(growable: true).obs;


  RxList<StandingOrderRecordModel> standOrderRecordDataList =
      List<StandingOrderRecordModel>.empty(growable: true).obs;

  RxList<AwaitConfirmationModel> waitingVoucherRecordDataList =
      List<AwaitConfirmationModel>.empty(growable: true).obs;

  RxList<Alltransaction> allTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> inTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> tAmountTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> outTransactionsDataList =
      List<Alltransaction>.empty(growable: true).obs;
  RxList<Alltransaction> pendingTransactionDataList =
      List<Alltransaction>.empty(growable: true).obs;


  final count = 0.obs;
  final makeADonationModelObj = List<BeneficiaryGetAllCharityModel>.empty(growable: true).obs;

  RxList<DonationCalculationModel> donationCalculationList =
      List<DonationCalculationModel>.empty(growable: true).obs;
  RxList<DonationCalculationModel> donationCalculationListDetails =
      List<DonationCalculationModel>.empty(growable: true).obs;
  final pendingTransaction = '0'.obs;
  final thisTax = 0.obs;
  final lastTax = 0.obs;
  var profileInfoObject;

  final teviniDonation = '0.0'.obs;
  final otherDonation = '0.0'.obs;
  final availableDonation = '0.0'.obs;

  final switchValue = false.obs;
  final isSwitchValueList = [].obs;

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
  var startDate = DateTime.utc(2024, 01, 01);
  var endDate = DateTime.utc(2024, 01, 31);
  String? token;
  final loading = false.obs;

  ///-------- TDF Transfer -----

  late Future<RatesModel> ratesModel;
  late Future<Map> currenciesModel;
  TextEditingController tdfAccNumberController = TextEditingController();
  TextEditingController tdfAccToTransferController = TextEditingController();

  @override
  void onInit() async {
    token = await localStoreSRF.getString('token');
    _apiClient = ApiClient();
    await getUserDetailsInfo();
    await getBeneficiaryGetAllCharityCTR();
    //await firstSyncAPI();
   // await secondSyncAPI();
    allSync();

    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.clear();
    isSwitchValueList.clear();
  }


  allSync(){
    firstSyncAPI();
    secondSyncAPI();
  }

  /// Balance

  void changeState() async {
    isAnimated.value = true;
    isBalance.value = false;
    await Future.delayed(const Duration(milliseconds: 800),
          () => isBalanceShown.value = true
    );
    await Future.delayed(const Duration(seconds: 3),
            () => isBalanceShown.value = false);
    await Future.delayed(const Duration(milliseconds: 200),
            () => isAnimated.value = false);
    await Future.delayed(const Duration(milliseconds: 800),
            () => isBalance.value = true);
  }

  firstSyncAPI() async {
    await homeLatestTransactionsCTR();
    await getDonationRecordCTR();
    await getDonationCalculationCTR();
  }

  secondSyncAPI() async {
    await getDonationRecordDetailsCTR();
    await getAllTransactionRecordCTR();
   // await getWaitingVoucherRecordCTR();
   // await getStandOrderRecordCTR();
  }

  /// TDF TO Transfer & Currency Convert



  Future<RatesModel> fetchRates() async {
    try {
      var response = await http.get(Uri.parse(AppUrl.ratesUrl));
      if (response.statusCode == 200) {
        final ratesModel = ratesModelFromJson(response.body);
        return ratesModel;
      } else {
        print('Failed to fetch rates: ${response.statusCode}');
        print('Please switch on your mobile data and restart the app.');
        return Future.error(
            'Please switch on your mobile data and restart the app.');
      }
    } catch (e) {
      print('Error fetching rates: $e');
      print('Please switch on your mobile data and restart the app.');
      return Future.error(
          'Please switch on your mobile data and restart the app.');
    }
  }

  Future<Map> fetchCurrencies() async {
    try {
      var response = await http.get(Uri.parse(AppUrl.currenciesUrl));
      if (response.statusCode == 200) {
        final allCurrencies = allCurrenciesFromJson(response.body);
        return allCurrencies;
      } else {
        // Handle non-200 status code
        print('Failed to fetch currencies: ${response.statusCode}');
        print('Please switch on your mobile data and restart the app.');
        return Future.error(
            'Please switch on your mobile data and restart the app.');
      }
    } catch (e) {
      print('Error fetching currencies: $e');
      print('Please switch on your mobile data and restart the app.');
      return Future.error(
          'Please switch on your mobile data and restart the app.');
    }
  }

  Future tdfToTransferDonation() async {
    print('Url :: ${ApiURL.createTransferTDFUrl}');
    String? token = await localStoreSRF.getString('token');


    if(tdfAccNumberController.text=='' && tdfAccToTransferController.text==''){
          return Helpers.snackbarForErorr(
              titleText: 'Error Alert',
              bodyText: 'Please Fill out this field');
        }
         else if(double.parse(tdfAccToTransferController.value.text.toString())<18){
          return Helpers.snackbarForErorr(
              titleText: ' Required',
              bodyText: 'Minimum transfer is £18.00');

        }
        else {
          final response = await _apiClient.connection(
            API_TYPE: '',
            apiType: 'POST',
            REQUEST_TYPE: '',
            REQUEST_DATA: {
              "tdfamount": tdfAccToTransferController.text,
              "tdfaccount": tdfAccNumberController.text
            },
            customheader: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },

            apiUrl: ApiURL.createTransferTDFUrl,
            PARAM: {},
          );
          if (response != null) {
            tdfAccToTransferController.clear();
            tdfAccNumberController.clear();
            isTDF.value=false;
           await homeLatestTransactionsCTR();
            getUserDetailsInfo();
            //
        Helpers.snackbarForSucess(
                titleText: 'Successful Alert',
                bodyText: "TDF transferred successfully.");

          } else {
            tdfAccToTransferController.clear();
            tdfAccNumberController.clear();
            Helpers.snackbarForErorr(
                titleText: ' Error Alert',
                bodyText: 'TDF has Field');
          }
        }

  }



  /// 95%
  switchOnOFFStandingDonation(int id) async {

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

  onTapStartDateTime(context) async {
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,

            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle:TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      //setState(() {
      startDate = date;
      //   });

      // getPromotionApplicationApprovalList();
    }
  }

  onTapEndDateTime(context) async {
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,

            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle:TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      //  setState(() {
      endDate = date;
      //  });

      if (kDebugMode) {
        print('SupportServiceController.onTapEndDateTime');
        print('end Date :${endDate}');
      }

      // getPromotionApplicationApprovalList();
    }
  }

  onSearchTextChanged(String text) async {
    print('Check >>>> $text');
    searchResult1.clear();
    if (text.isEmpty) {
      return;
    }

    donationRecordDataList.forEach((searchValue) {

      if (searchValue.charityName!.toLowerCase().contains(text.toLowerCase())) {
        searchResult1.add(searchValue);
      }
    });


  }



  onSearchTextChangedRegularIncome(String text) async {
    print('Check >>>> $text');
    searchResult1.clear();
    if (text.isEmpty) {
      return;
    }

    donationCalculationListDetails.forEach((searchValue) {

      if (searchValue.incomeTitle.toLowerCase().contains(text.toLowerCase())) {
        searchRegularIncome.add(searchValue);
      }
    });


  }


  List<DonationRecordModel> itemsBetweenDates({
    required List<DonationRecordModel> dates,
    required DateTime start,
    required DateTime end,
  }) {
    var dateFormat = DateFormat('y-MM-dd');

    var output = <DonationRecordModel>[];
    for (var i = 0; i < dates.length; i += 1) {
      var date = dateFormat.parse(dates[i].updatedAt.toString(), true);
      if (date.compareTo(start) >= 0 && date.compareTo(end) <= 0) {
        output.add(dates[i]);
      }
    }
    return output;
  }

  ///Standing Filter
  List<StandingOrderRecordModel> itemsBetweenDatesStanding({
    required List<StandingOrderRecordModel> dates,
    required DateTime start,
    required DateTime end,
  }) {
    var dateFormat = DateFormat('y-MM-dd');

    var output = <StandingOrderRecordModel>[];
    for (var i = 0; i < dates.length; i += 1) {
      var date = dateFormat.parse(dates[i].createdAt.toString(), true);
      if (date.compareTo(start) >= 0 && date.compareTo(end) <= 0) {
        output.add(dates[i]);
      }
    }
    return output;
  }

  /// done
  Future homeLatestTransactionsCTR() async {
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
      apiUrl: ApiURL.getDashboardUrl,
      PARAM: {},
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;

      thisTax.value=mapdata['currentyramount'];
      lastTax.value=mapdata['totalamount'];
      print('thisTax');
      print(thisTax.value);
      print(thisTax.value);

      print('HomeController.homeLatestTransactionsCTR Dashoard  ::${mapdata.toString()} ');

      if(mapdata['pending_transactions']==0){
        ///
      }else{
        pendingTransaction.value = mapdata['pending_transactions'];
      }


      final list = (mapdata['tamount'] as List)
          .map((x) => TransactionModel.fromJson(x))
          .toList();
      leastTransaction.value = list;
      print('homeLatestTransactionsCTR  lng ${leastTransaction.length}');
    } else {

      leastTransaction.value = [];
    }
  }

  ///done + Searching
  Future getDonationRecordCTR() async {
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getDonationRecordUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      final list = (mapdata['response']['data'] as List)
          .map((x) => DonationRecordModel.fromJson(x))
          .toList();
      donationRecordDataList.value = list;

      int index=-1;
       donationRecordDataList.forEach((searchValue) {
         index++;
        if (makeADonationModelObj.isNotEmpty) {

          BeneficiaryGetAllCharityModel charity =
          makeADonationModelObj.firstWhere((BeneficiaryGetAllCharityModel element) => int.parse(element.id.toString()) == int.parse(searchValue.charityId.toString()),
              orElse: () => dummyData);

          if(int.parse(searchValue.charityId.toString())==int.parse(charity.id.toString())){

            donationRecordDataList[index].charityName=charity.name??'';
            print('ck Name :: ${donationRecordDataList[index].charityName}');
          }
        }
      });
      donationRecordDataList= donationRecordDataList1;
    } else {
      donationRecordDataList.value = [];
    }

    print(' getDonationRecordCTR lng :${donationRecordDataList.length}');
  }

  Future<void> reloadDataSyncFormHomeController()async{

      token = await localStoreSRF.getString('token');
    _apiClient = ApiClient();
    await getUserDetailsInfo();
    await getBeneficiaryGetAllCharityCTR();
    await firstSyncAPI();
    await secondSyncAPI();
  }

  ///done Details
  Future getDonationRecordDetailsCTR() async {
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getDonationRecordDetailsUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      debugPrint('HomeController.getDonationRecordCTR ${response.statusCode}');
      final list = (mapdata['response']['data'] as List).map((x) => DonationDetailsModel.fromJson(x)).toList();
      donationRecordDataDetailsList.value = list;
    } else {
      donationRecordDataDetailsList.value = [];
    }
    print('HomeCon.getDonationRecordCTR lng: ${donationRecordDataList.length}');
  }

  /// done + Searching
  Future getStandOrderRecordCTR() async {
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
      enableLoading: false,
    );

    if (response != null) {

      final Map<String, dynamic> mapData = response.data;
      print('HomeController.getDonationRecordCTR ${mapData}');
      final list = (mapData['response']['data'] as List)
          .map((x) => StandingOrderRecordModel.fromJson(x))
          .toList();

      list.forEach((stdDonor) {
        if(stdDonor.status=='1'){
          isSwitchValueList.add(true);
        }else{
          isSwitchValueList.add(false);
        }
        print('HomeController.onSearchTextChanged Id >>>> ${stdDonor.charityId}');

        String? charityName;
        if (makeADonationModelObj.isNotEmpty) {
          BeneficiaryGetAllCharityModel charity = makeADonationModelObj.firstWhere((BeneficiaryGetAllCharityModel element) =>
          element.id == int.parse(stdDonor.charityId.toString()),
              orElse: () => dummyData);
          charityName = charity.name;
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
      donationRecordDataList= donationRecordDataList1;


    } else {
      print('HomeController.getStandOrderRecordCTR');
      standOrderRecordDataList.value = [];
    }
    print('HomeCon.getStandOrderRecordCTR ${standOrderRecordDataList.length}');
  }


  /// done
  Future getAllTransactionRecordCTR() async {
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getTransactionViewUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getAllTransactionRecordCTR');
      final alltransactions = (mapdata['response']['alltransactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();

      final intransactions = (mapdata['response']['intransactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();

      final tamount = (mapdata['response']['tamount'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();

      final outtransactions = (mapdata['response']['outtransactions'] as List)
          .map((x) => Alltransaction.fromJson(x))
          .toList();

      final pendingTransactions =
          (mapdata['response']['pending_transactions'] as List)
              .map((x) => Alltransaction.fromJson(x))
              .toList();
      allTransactionDataList.value = alltransactions;
      inTransactionDataList.value = intransactions;
      tAmountTransactionDataList.value = tamount;
      outTransactionsDataList.value = outtransactions;
      pendingTransactionDataList.value = pendingTransactions;
    } else {
      print('HomeController.getStandOrderRecordCTR');
      allTransactionDataList.value = [];
      inTransactionDataList.value = [];
      tAmountTransactionDataList.value = [];
      outTransactionsDataList.value = [];
      pendingTransactionDataList.value = [];
    }
    print('HomeCon.getStandOrderRecordCTR ALL  ${allTransactionDataList.length}');
    print('HomeCon.getStandOrderRecordCTR In  ${inTransactionDataList.length}');
    print('Hon.getStdOrderRecordCTR lng ${tAmountTransactionDataList.length}');
  }


  /// done
  Future getBeneficiaryGetAllCharityCTR() async {
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
      final Map<String, dynamic> mapdata = response.data;
      final list = (mapdata['data'] as List)
          .map((x) => BeneficiaryGetAllCharityModel.fromJson(x))
          .toList();
      makeADonationModelObj.value = list;
    } else {
      print('HomeController.getOrderVoucherBooksCTR');
      makeADonationModelObj.value = [];
    }

    print('HomeCon Benei Lng : ${makeADonationModelObj.length.toString()}');
  }

  /// done
  Future getDonationCalculationCTR() async {
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getDonationCalculatorUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;



      teviniDonation.value = mapdata['tevini_donation'];
      otherDonation.value = mapdata['otherdonation'];
      var avi = mapdata['availabledonation'];
      availableDonation.value = avi.toString();

      print('teviniDonation >>> ${teviniDonation.value}');

      final list = (mapdata['donor_cals'] as List)
          .map((x) => DonationCalculationModel.fromJson(x))
          .toList();
      donationCalculationList.value = list;
      donationCalculationListDetails.value=list;
    } else {
      donationCalculationList.value = [];
      donationCalculationListDetails.value = [];
    }

    print(' ${donationCalculationList.length.toString()}');
  }

  /// done
  Future getUserDetailsInfo() async {

    print('MyProfileController.getUserProfileInfo');
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
      apiUrl: ApiURL.getUserProfileUrl,
      PARAM: {},
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getUserDetailsInfo >> ${mapdata.toString()}');
      var info=mapdata['response']['data'];
      getUserInfo.value = ProfileInfoModel.fromJson(info);
      localStoreSRF.setString('balance',getUserInfo.value.balance??'');
   //   String bal=localStoreSRF.getString('balance')??'';
     // currentBalance.value=bal;

      String? balance= mapdata['response']['data']['balance'];
      localStoreSRF.setString('balance',balance??'0.00');
      String bal=localStoreSRF.getString('balance')??'0.00';
      currentBalance.value=bal;
      print('currentBalance :${currentBalance}');
      print('currentBalance :${currentBalance}');
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
