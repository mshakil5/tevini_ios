import 'package:intl/intl.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/values/app_helper.dart';
import 'package:tenvini/presentation/make_a_donation_one_screen/models/make_a_donation_one_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/home/dropdown_model.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../main.dart';
import '../../donation_record_screen/controller/donation_record_controller.dart';
import '../../home_page/controller/home_controller.dart';
import '../../make_a_donation_screen/models/make_a_donation_model.dart';
import '../../standing_donation_records_screen/controller/standing_donation_records_controller.dart';
import '../make_a_donation_one_screen.dart';


class MakeADonationOneController extends GetxController {
  HomeController controller2 = Get.find();
  StandingDonationRecordsController standingController = Get.put(StandingDonationRecordsController());

  //HomeController recordDonationController = Get.find();

  final currentBalance='0.0'.obs;
final selectedItem=''.obs;




  Rx<ProfileInfoModel> getUpdateInfo = ProfileInfoModel().obs;
  Rx<BeneficiaryGetAllCharityModel>? selectedScriptCategory ;

  final totalAmount = 0.0.obs;
  TextEditingController amountController = TextEditingController();

  TextEditingController paymentsoneController = TextEditingController();

  TextEditingController londonController = TextEditingController();

  TextEditingController mmddyyyyController = TextEditingController();

  TextEditingController monthlyController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  TextEditingController frameoneoneController = TextEditingController();

  TextEditingController writeyourController = TextEditingController();

  Rx<MakeADonationOneModel> makeADonationOneModelObj =
      MakeADonationOneModel().obs;

  ///intervalDropDown
  Rx<DropdownModel?> StrselectedClientType = Rxn(null);
  Rx<List<DropdownModel>> scriptClientTypeDropDownList1 = Rx([
    DropdownModel(itemText: 'Monthly', itemValue: '1'),
    DropdownModel(itemText: 'Every 3 Month', itemValue: '3'),
    DropdownModel(itemText: 'Every 6 Month', itemValue: '6'),
    DropdownModel(itemText: 'Yearly', itemValue: '12')
  ]);

  ///standingPaymentsDropDown
  Rx<DropdownModel?> selectPayments = Rxn(null);
  Rx<List<DropdownModel>> selectedPaymentList = Rx([
    DropdownModel(itemText: 'Fixed number of payments', itemValue: '1'),
    DropdownModel(itemText: 'Continuous payments', itemValue: '3'),
  ]);

  Rx<bool> makeAnonymous = false.obs;
  Rx<bool> isConfirm = false.obs;

  String? mmddyy = '';

  Rx<bool> setUpStandingOr = false.obs;
  final isClearDropdown = true.obs;

  SelectionPopupModel? selectedDropDownValue;
  final startDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .obs;
  DateTime endDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  final benifiID = 0.obs;
  late ApiClient _apiClient;

  RxList<BeneficiaryGetAllCharityModel> makeADonationModelObj =
      List<BeneficiaryGetAllCharityModel>.empty(growable: true).obs;
  @override
  void onInit()async {
    _apiClient = ApiClient();
    await getUserDetailsInfo();
    //  getBeneficiaryGetAllCharityCTR();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    amountController.dispose();
    paymentsoneController.dispose();
    londonController.dispose();
    mmddyyyyController.dispose();
    monthlyController.dispose();
    frameOneController.dispose();
    frameoneoneController.dispose();
    writeyourController.dispose();
  }

  String getFormatedDate(DateTime date) =>
      DateFormat('dd-MMM-yyyy').format(date);

  /// Picker Start
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
      initialDate: startDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      startDate.value = date;
    }
  }

  /// Picker End
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
      endDate = date;
    }
  }

  onSelected(dynamic value) {
    for (var element in makeADonationOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    makeADonationOneModelObj.value.dropdownItemList.refresh();
  }

  /// done
  Future getBeneficiaryGetAllCharityCTR() async {
    print('MakeADonationOneController.getBeneficiaryGetAllCharityCTR');
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
      print('MakeADonationOneController.getBeneficiaryGetAllCharityCTR');
      final list = (mapdata['data'] as List)
          .map((x) => BeneficiaryGetAllCharityModel.fromJson(x))
          .toList();
      makeADonationModelObj.value = list;
    } else {
      print('MakeADonationOneController.getBeneficiaryGetAllCharityCTR');
      makeADonationModelObj.value = [];
    }

    print(
        'HomeController.getOrderVoucherBooksCTR ${makeADonationModelObj.length.toString()}');
  }

  /// STEP -01
  makeBtn() {
    FocusManager.instance.primaryFocus?.unfocus();
    print('MakeADonationOneController.makeBtn');
    if (benifiID.value == 0) {
      Get.snackbar('Alert', 'Please select beneficiary field.',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    //  Please accept condition.
    //Please fill amount field.
    else if (amountController.text == '') {
      Get.snackbar('Alert', 'Please fill amount field',
          colorText: Colors.white, backgroundColor: Colors.red);
    } else if (isConfirm.value == false) {
      Get.snackbar('Alert', 'Please accept condition',
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      print('MakeADonationOneScreen.build');
      setUpStandingOr.value == true ? standingBTN() : makeADonationBTN();
    }
  }

  /// STEP -02 finally done
  makeADonationBTN() async {
    Map<String, String> makeDonationMap = {
      "charity_id": benifiID.value.toString(),
      "amount": amountController.text.toString(),
      "ano_donation": makeAnonymous.value.toString(),
      "standard": setUpStandingOr.value.toString(),
      "c_donation": isConfirm.value.toString(),
      "charitynote": frameoneoneController.text.toString(),
      "mynote": writeyourController.text.toString(),
      "payments_type": "1",
    };

    print('MakeADonationOneController.makeADonationBTN body $makeDonationMap');

    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.connection(
      API_TYPE: 'MAKE',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: makeDonationMap,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.makeDonationUrl,
      PARAM: {},
    );

    if (response != null) {
      // localStoreSRF.setString('balance','');
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);

      amountController.clear();
      frameoneoneController.clear();
      writeyourController.clear();
      benifiID.value = 0;
      isConfirm.value = false;
      makeAnonymous.value = false;
      selectPayments.value = null;
      startDate.value = DateTime.now();
      isClearDropdown.value=false;
      /// balance update
      await getUserDetailsInfo();
      await controller2.getDonationRecordCTR();


     // await recordDonationController.getDonationRecordCTR();

//Get.offNamedUntil(AppRoutes.homeContainerScreen, (route) => false);
    } else {
      Helpers.snackbarForSucess(
          titleText: 'Error Alert', bodyText: 'Donation insert has failed');
    }
  }

  /// STEP -03
  standingBTN() async {
    print(StrselectedClientType.value);
    print(selectPayments.value);
    if (selectPayments.value == null) {
      Get.snackbar('Alert', 'Please Select Payments ',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    if (StrselectedClientType.value == null) {
      Get.snackbar('Alert', 'Please Select Internal',
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    Map<String, String> standingMap = {
      "charity_id": benifiID.value.toString(),
      "amount": amountController.text.toString(),
      "ano_donation": makeAnonymous.value.toString(),
      "standard": setUpStandingOr.value.toString(),
      "c_donation": isConfirm.value.toString(),
      "charitynote": frameoneoneController.text.toString(),
      "mynote": writeyourController.text.toString(),

      "payments_type": "1",
      "currency": "GBP",
      "number_payments": selectPayments.value!.itemValue.toString(),
      "interval": StrselectedClientType.value!.itemValue.toString(),
      "starting": DateFormat('yyyy-MM-dd').format(startDate.value)
      ,
    };

    print('MakeADonationOneController.standingBTN Body ${standingMap}');
    String? token = await localStoreSRF.getString('token');

    final response = await _apiClient.connection(
      API_TYPE: 'STANDING',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: standingMap,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.standingDonationUrl,
      PARAM: {},
    );

    if (response != null) {
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: response.data['response']['message']);
      amountController.clear();
      frameoneoneController.clear();
      writeyourController.clear();
      benifiID.value = 0;
      isConfirm.value = false;
      makeAnonymous.value = false;
      selectPayments.value = null;
      londonController.text='0.0';
      scriptClientTypeDropDownList1.value.clear();
      selectedPaymentList.value.clear();
      startDate.value = DateTime.now();
      setUpStandingOr.value=false;
      isClearDropdown.value=false;

      /// balance update
      await getUserDetailsInfo();
      await standingController.getStandingRecord();

    } else {
      Helpers.snackbarForSucess(
          titleText: 'Error Alert',
          bodyText: 'Standing order insert has failed');
    }
  }

  Future<List<BeneficiaryGetAllCharityModel>> getData() async {
    List<BeneficiaryGetAllCharityModel> data = controller2.makeADonationModelObj;
    return data;
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
       String? balance= mapdata['response']['data']['balance'];
      localStoreSRF.setString('balance',balance??'0.00');
      String bal=localStoreSRF.getString('balance')??'0.00';
      currentBalance.value=bal;
      print('currentBalance :${currentBalance}');
    }

  }
}
