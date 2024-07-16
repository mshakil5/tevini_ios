import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/maaser_calculator_screen/models/maaser_calculator_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/donationCalculationStoreModel.dart';
import '../../../data/models/donation_calculator_model.dart';
import '../../../data/models/donation_details_model.dart';
import '../../../data/models/home/dropdown_model.dart';
import '../../../main.dart';
import '../../home_page/controller/home_controller.dart';
import '../maaser_calculator_screen.dart';

class MaaserCalculatorController extends GetxController {
  HomeController controller2 = Get.find();
  final initValBool = true.obs;
  TextEditingController controllerFilter = TextEditingController();
  TextEditingController incomeoneController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController chooseoptionController = TextEditingController();

  TextEditingController descriptiononeController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController dateController1 = TextEditingController();

  TextEditingController incomethreeController = TextEditingController();

  TextEditingController chooseoptionController1 = TextEditingController();

  TextEditingController frameoneoneController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  Rx<MaaserCalculatorModel> maaserCalculatorModelObj =
      MaaserCalculatorModel().obs;


  RxList<DonationCalculationModel> donationCalculationList =
      List<DonationCalculationModel>.empty(growable: true).obs;

  RxList<DonationCalculationModel> donationCalculationListSame =
      List<DonationCalculationModel>.empty(growable: true).obs;

  final startDateList = [].obs;
  DateTime startDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime startDateAddIncome = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String startDateMMDDYYYY='mm/dd/yyyy';


  ///donation Percentage
  Rx<DropdownModel?> chooseYourDonationPercentage = Rxn(null);
  Rx<DropdownModel?> chooseYourDonationPercentageOneOff = Rxn(null);
  Rx<List<DropdownModel>> chooseYourDonationPercentageDropDownList = Rx([
    DropdownModel(itemText: 'Donation Percentage ', itemValue: '0'),
    DropdownModel(itemText: '10%', itemValue: '10'),
    DropdownModel(itemText: '20%', itemValue: '20'),
  ]);

  ///donation Slot
  Rx<DropdownModel?> chooseYourDonationSlotPercentage = Rxn(null);
  Rx<List<DropdownModel>> chooseYourDonationSlotDropDownList = Rx([
    DropdownModel(itemText: 'Weekly', itemValue: '7'),
    DropdownModel(itemText: 'Monthly', itemValue: '30'),
  ]);

  final switchValue = true.obs;

  final isSwitchValueList = [].obs;
  late ApiClient _apiClient;
  RxList<DonationDetailsModel> donationRecordDataDetailsList =
      List<DonationDetailsModel>.empty(growable: true).obs;


  /// View ById Last Part

  RxList<DonationDetailsModel> donationRecordDataDetailsListById =
      List<DonationDetailsModel>.empty(growable: true).obs;

  RxList<DonationCalculationStoreModel> maaserCalculatorStore =
      List<DonationCalculationStoreModel>.empty(growable: true).obs;

  final inputController1 = TextEditingController();
  List<TextEditingController> incomeCont = [];
  List<TextEditingController> descriptionCont = [];

  final inputController = TextEditingController();

  /// %
  final DonationPercentageDropDownList = [].obs;
  DropdownModel? DonationPercentageDropDownObj;

  ///slot
  final DonationSlotDropDownList = [].obs;
  DropdownModel? DonationSlotDropDownListObj;


  ///------------------------ Last Part -----------
  RxList<DonationCalculationModel> donationCalculationListDetails =
      List<DonationCalculationModel>.empty(growable: true).obs;
  final teviniDonation = '0.0'.obs;
  final otherDonation = '0.0'.obs;
  final availableDonation = '0.0'.obs;
  RxList<DonationCalculationModel> searchRegularIncome =
      List<DonationCalculationModel>.empty(growable: true).obs;

  @override
  void onInit()async {
    print('MaaserCalculatorController.onInit >>>>>>');
    _apiClient = ApiClient();
    await getRegularIncomeDonationDetailsWithSwitch();
    await getDonationCalculationCTR();

    initLoadDonationCalculation();
    await getDonationRecordDetailsCTR();
    super.onInit();
  }


  initLoadDonationCalculation() {
    donationCalculationList.forEach((model) {
      final incomeCnt = TextEditingController(text: model.incomeAmount.toString());
      final descriptionCnt = TextEditingController(text: model.incomeTitle.toString());

      DonationPercentageDropDownObj = chooseYourDonationPercentageDropDownList
          .value.firstWhere((element1) => element1.itemValue.toString() == model.donationPercentage.toString());

      DonationSlotDropDownListObj = chooseYourDonationSlotDropDownList.value
          .firstWhere(
              (element1) => element1.itemValue.toString() == model.incomeSlot);

      DonationSlotDropDownList.add(DonationSlotDropDownListObj);
      DonationPercentageDropDownList.add(DonationPercentageDropDownObj);

      incomeCont.add(incomeCnt);
      descriptionCont.add(descriptionCnt);
      startDateList.add(model.startDate);


    });
  }

  @override
  void onClose() {
    super.onClose();
    incomeoneController.dispose();
    chooseoptionController.dispose();
    descriptiononeController.dispose();
    amountController.dispose();
    frameOneController.dispose();
    dateController.dispose();
    dateController1.dispose();
    incomethreeController.dispose();
    chooseoptionController1.dispose();
    frameoneoneController.dispose();
    descriptionController.dispose();
    searchController.dispose();
  }

  String getFormatedDate(DateTime date) =>
      DateFormat('dd-MMM-yyyy').format(date);

  // yyyy-MM-dd

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
      startDate = date;



    }
  }

  /// Date Picker Add your Income Date
  onTapStartDateTimeAddIncomeDate(context) async {
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
      initialDate: startDateAddIncome,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      startDateAddIncome = date;
    }
  }

  onTapStartDateTimeList(context, int index) async {
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
      initialDate: startDateList[index],
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      //setState(() {
      startDateList[index] = date;
      donationCalculationList[index].startDate=date;

      //   });

      // getPromotionApplicationApprovalList();
    }
  }

  /// One off Income  done
  submitAddIncomeBTN() async {
    FocusManager.instance.primaryFocus?.unfocus();
    print('ostart_date :: ${startDate}');
    print('oincome_amount :: ${incomeoneController.text}');
    print('oincome_title :: ${descriptiononeController.text}');
    print('odonation_percentage :: ${startDate}');

    if(chooseYourDonationPercentageOneOff.value!.itemValue=='0'){
      return Get.snackbar(
          'One off Income Alert', 'Please Choose your Percentage',
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    if (incomeoneController.text == '') {
      return Get.snackbar(
          'One off Income Alert', 'Please Enter the Income Amount',
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    if (descriptiononeController.text == '') {
      return Get.snackbar('Alert', 'Please Enter The Description',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    if (chooseYourDonationPercentageOneOff.value == '' ||
        chooseYourDonationPercentageOneOff.value == null ) {
      return Get.snackbar('One off Income Alert', 'Please Select the option',
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    Map<String, String> oneOffBodyMap = {
      "ostart_date": DateFormat('yyyy-MM-dd').format(startDate),
      "oincome_amount": incomeoneController.text.toString(),
      "oincome_title": descriptiononeController.text.toString(),
      "odonation_percentage":
          chooseYourDonationPercentageOneOff.value!.itemValue.toString(),
    };
    print('MaaserCalculatorController.submitAddIncomeBTN Map :$oneOffBodyMap');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: oneOffBodyMap,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.oneOffDonationUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
      incomeoneController.clear();
      descriptiononeController.clear();
      chooseYourDonationPercentageOneOff.value = null;
     await  getDonationRecordDetailsCTR();
     await  controller2.getDonationCalculationCTR();

    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'One off income has failed');
      incomeoneController.clear();
      descriptiononeController.clear();
      chooseYourDonationPercentageOneOff.value = null;
    }
  }

  ///done Details  submitAddIncomeBTN Details
  Future getDonationRecordDetailsCTR() async {
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
      apiUrl: ApiURL.getDonationRecordDetailsUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      print('HomeController.homeAllProductsCTR');
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getDonationRecordCTR ${mapdata}');
      final list = (mapdata['response']['data'] as List)
          .map((x) => DonationDetailsModel.fromJson(x))
          .toList();
      donationRecordDataDetailsList.value = list;
    } else {
      print('HomeController.homeAllProductsCTR');
      donationRecordDataDetailsList.value = [];
    }

  }

  /// Add External Donation
  submitAddExternalDonationBTN() async {
    print('submitAddExternalDonationBTN ');

    if (amountController.text == '') {
      return Get.snackbar(
          'Add External Alert', 'Please Enter the Donation Amount',
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    if (frameOneController.text == '') {
      return Get.snackbar('Add External Alert', 'Please Enter The Description',
          colorText: Colors.white, backgroundColor: Colors.red);
    }


    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "donation_date": DateFormat('yyyy-MM-dd').format(startDate).toString(),
        "d_amount": amountController.value.text.toString(),
        "d_title": frameOneController.value.text.toString(),
      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.otherExternalDonationUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
      amountController.clear();
      frameOneController.clear();
      await  controller2.getDonationCalculationCTR();

    } else {
      Helpers.snackbarForErorr(
          titleText: ' Error Alert',
          bodyText: 'Add External Donation has failed');
      amountController.clear();
      frameOneController.clear();
    }
  }

  /// Update & Add Regular Income Donation
  submitUpdateAddRegularIncomeDonation() async {
    FocusManager.instance.primaryFocus?.unfocus();

  donationCalculationList.forEach((element) {

    if(element.id.toString()=="null"){
      maaserCalculatorStore.add(DonationCalculationStoreModel(
          startDate: element.startDate.toString(),
          incomeAmount: element.incomeAmount.toString(),
          incomeTitle: element.incomeTitle.toString(),
          incomeSlot: element.incomeSlot.toString(),
          donationPercentage: element.donationPercentage,
         // donorcalId: element.id.toString()
      ));
    }else{
      maaserCalculatorStore.add(DonationCalculationStoreModel(
          startDate: element.startDate.toString(),
          incomeAmount: element.incomeAmount.toString(),
          incomeTitle: element.incomeTitle.toString(),
          incomeSlot: element.incomeSlot.toString(),
          donationPercentage: element.donationPercentage,
          donorcalId: element.id.toString()
      ));
    }

    });


    Map<String, dynamic> calculatorMap = {
      "alldata": jsonEncode(maaserCalculatorStore),
    };

    print('maaserCalculatorStore ${jsonEncode(maaserCalculatorStore)}');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connectionNew(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: calculatorMap,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.donationCalculatorAddUpdateUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
      donationCalculationList.clear();
      maaserCalculatorStore.clear();
      incomeCont.clear();
      descriptionCont.clear();
      startDateList.clear();
      DonationSlotDropDownList.clear();
      DonationPercentageDropDownList.clear();

      await getDonationCalculationCTR();
      initLoadDonationCalculation();
    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(
          titleText: 'Error Alert',
          bodyText: 'donation calculator update has failed');
    }
  }

  submitRegularIncomeBTN() async {
    print('oincome_amount :: ${incomeoneController.text}');
    print('odonation_percentage :: ${startDate}');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: '',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: {
        "ostart_date": startDate.toString(),
        "oincome_amount": incomeoneController.text,
        "oincome_title": descriptiononeController.text,
        "odonation_percentage": "10",

        /// static
      },
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.oneOffDonationUrl,
      PARAM: {},
    );

    if (response != null) {
      // localStoreSRF.setString('balance','');
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
      // Get.offNamedUntil(AppRoutes.homeContainerScreen, (route) => false);
    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Contact submit has failed');
    }
  }

  /// 95%
  switchOnOFFStandingDonation(int id) async {
    String? token = await localStoreSRF.getString('token');
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
      apiUrl: ApiURL.regularIncomeDonationOnOffUrl,
      PARAM: {},
    );

    if (response != null) {
      // localStoreSRF.setString('balance','');
      await getDonationCalculationCTR();
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
    } else {
      print('ContactTopUpController.contactSubmit');
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Contact submit has failed');
    }
  }


  /// done
  Future getDonationCalculationCTR() async {
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
      apiUrl: ApiURL.getDonationCalculatorUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;

      final list = (mapdata['donor_cals'] as List)
          .map((x) => DonationCalculationModel.fromJson(x))
          .toList();
      donationCalculationList.value = list;

    } else {
      donationCalculationList.value = [];

    }

    print(' ${donationCalculationList.length.toString()}');
  }


  ///done DREGULAR INCOME DONATION DETAILS: View  /// Todo list
  Future getRegularIncomeViewByIdDetailsCTR() async {
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
      apiUrl: ApiURL.getDonationRecordDetailsUrl,
      PARAM: {},
      enableLoading: false,
    );

    if (response != null) {
      print('HomeController.homeAllProductsCTR');
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getDonationRecordCTR ${mapdata}');
      final list = (mapdata['response']['data'] as List)
          .map((x) => DonationDetailsModel.fromJson(x))
          .toList();
      donationRecordDataDetailsList.value = list;
    } else {
      print('HomeController.homeAllProductsCTR');
      donationRecordDataDetailsList.value = [];
    }

  }

  /// done Last Part List  Last part Final
  Future getRegularIncomeDonationDetailsWithSwitch() async {
    print('MaaserCalculatorController.getRegularIncomeDonationDetailsWithSwitch');
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
      donationCalculationListDetails.value=list;
    } else {

      donationCalculationListDetails.value = [];
    }

    print('lng :::: Adnan :: ${donationCalculationListDetails.length}');
  }

  /// done Last Part  View  /// Next
  Future getRegularIncomeDetailsByIdView(String id) async {
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
      apiUrl: ApiURL.donationDetailsByIdUrl+'$id',
      PARAM: {},
      enableLoading: true,
    );

    if (response != null) {
      print('HomeController.homeAllProductsCTR');
      final Map<String, dynamic> mapdata = response.data;
      print('HomeController.getDonationRecordCTR ${mapdata}');
      final list = (mapdata['response']['data'] as List)
          .map((x) => DonationDetailsModel.fromJson(x))
          .toList();
      donationRecordDataDetailsListById.value = list;

       Get.toNamed(AppRoutes.donationRecordDetailsScreen,arguments: donationRecordDataDetailsListById);


    } else {
      print('HomeController.homeAllProductsCTR');
      donationRecordDataDetailsList.value = [];
    }

  }
  /// done Last Part  View  Search
  onSearchTextChangedRegularIncome(String text) async {
    print('Check >>>> $text');
    searchRegularIncome.clear();
    if (text.isEmpty) {
      return;
    }

    donationCalculationListDetails.forEach((searchValue) {

      if (searchValue.incomeTitle.toLowerCase().contains(text.toLowerCase())) {
        searchRegularIncome.add(searchValue);
      }
    });


  }

}



