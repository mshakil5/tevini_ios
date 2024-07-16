import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'package:field_suggestion/box_controller.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_url.dart';
import '../../../data/apiClient/repo.dart';
import '../../../data/cart_local_store.dart';
import '../../../data/models/address_model.dart';
import '../../../data/models/home/dropdown_model.dart';
import '../../../main.dart';
import 'package:flutter/foundation.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/repo.dart';
import '../../../data/cart_local_store.dart';
import '../../../main.dart';

import 'package:http/http.dart' as http;
/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  TextEditingController yourcontactController = TextEditingController();

  TextEditingController yourhouseController = TextEditingController();


  TextEditingController yourtownController = TextEditingController();

  TextEditingController yourpostcodeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Rx<bool> agreementText = false.obs;

  ///donation Slot
  Rx<DropdownModel?> chooseYourPersonTitle = Rxn(null);
  Rx<List<DropdownModel>> chooseYourPersonDropDownList = Rx([
    DropdownModel(itemText: 'Mr', itemValue: 'Mr'),
    DropdownModel(itemText: 'Mrs', itemValue: 'Mrs'),
  ]);



  ///------------ Address --------------
  ///
  static const String _baseUrl = 'https://api.ideal-postcodes.co.uk';
  static const String _key = 'ak_lu3q2fx5XP10rIvksRD4uw1CHqKSM';

  var boxController = BoxController();

  var dummyController = TextEditingController();
  var addressLineOneController = TextEditingController();
  var addressLineTwoController = TextEditingController();
  var addressLineThreeController = TextEditingController();
  var countryTextController = TextEditingController();
  var postcodeTextController = TextEditingController();
  bool shouldSearch = true;

  returnEmptyFutureData() =>
      Future.delayed(Duration.zero).then((value) => <AddressModel>[]);

  Future<List<AddressModel>> searchAddress(query) async {
    print('query :$query');
    dynamic response;
    List<AddressModel> addressList = [];

    try {
      var headers = {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',

      };

      http.Response response = await http.get(
        Uri.parse('$_baseUrl/v1/autocomplete/addresses?api_key=$_key&&query=$query'),
        headers: headers,
      );

      print('RegisterController.searchAddress ${response.body}');
      //    response = await _repository.searchAddress(query);

      if (response.statusCode== 200) {
        final Map<String, dynamic> mapdata = json.decode(response.body);
        for (var data in mapdata['result']['hits']) {
          addressList.add(AddressModel.fromJson(data));

        }
        print('address lng :: ${addressList.toString()}');
        return addressList;
      }
      else {
        return addressList;
      }
    } catch (ex) {
      return addressList;
    }
  }

  Future getAndSetAddressDetails(endpoint) async {
    dynamic response;

    try {
      var url ='$_baseUrl$endpoint?api_key=$_key';
      var headers = {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',

      };

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      //response = await _repository.getAddressDetails(endpoint);

      print('RegisterController.getAndSetAddressDetails ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> mapdata = json.decode(response.body);
        // addressLineOneController.text = mapdata['result']['line_1'] ?? '';
        addressLineTwoController.text = mapdata['result']['line_2'] ?? '';
        addressLineThreeController.text = mapdata['result']['line_3'] ?? '';
        countryTextController.text = mapdata['result']['post_town'] ?? '';
        postcodeTextController.text = mapdata['result']['postcode'] ?? '';
      } else {
        clearController();
      }
    } catch (ex) {
      clearController();
    }
  }

  clearController() {
    addressLineOneController.clear();
    addressLineTwoController.clear();
    addressLineThreeController.clear();
    countryTextController.clear();
    postcodeTextController.clear();
    dummyController.clear();
  }




  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    yourcontactController.dispose();
    yourhouseController.dispose();
    yourtownController.dispose();
    yourpostcodeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future signUpTap(BuildContext context) async {
    final ProgressDialog progressDialog =
    DBHelper.loadingDialog(Get.overlayContext!);
    try {
      progressDialog.show();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      http.post(Uri.parse(ApiURL.registerUrl), body:  {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmpasswordController.text,
        'phone': yourcontactController.text,
        'houseno': yourhouseController.text,
        'street': streetController.text,
        'town': yourtownController.text,
        'passwordchk': '1',
        'notification':'1',
        'status': '0',
      }).then((response) async {
        progressDialog.hide();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration has been successful!')));
        //Get.offAllNamed(Routes.AUTHENTICATION);
        Get.back();
      });
    } catch (e) {
      progressDialog.hide();
      print(e.toString());
    }
  }
  dynamic registerController(
      {required Map rgMapBody, required BuildContext context}) async {
    final ProgressDialog progressDialog =
        DBHelper.loadingDialog(Get.overlayContext!);
    try {
      progressDialog.show();
      Repo()
          .registerRepo(rgMapBody: rgMapBody)
          .timeout(const Duration(seconds: 500))
          .then((value) {
        if (value) {
          progressDialog.hide();
          print('Registration has been successful!');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Registration has been successful!')));
          //Get.offAllNamed(Routes.AUTHENTICATION);
          Get.back();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration has Wrong!')));
        }
      }).onError((error, stackTrace) => null);

      nameController.clear();
      yourcontactController.clear();
      yourhouseController.clear();
      yourtownController.clear();
      yourpostcodeController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpasswordController.clear();
    } catch (e) {
      progressDialog.hide();
      if (kDebugMode) {
        print('RegisterController.registerController error:$e');
      }
    }
  }
}
