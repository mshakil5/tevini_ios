


import 'dart:convert';

import 'package:field_suggestion/box_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_helper.dart';
import '../../../../core/values/app_url.dart';
import '../../../../data/apiClient/api_client.dart';
import '../../../../data/models/address_model.dart';
import '../../../../data/models/user_profile_model.dart';
import '../../../../main.dart';


import 'package:http/http.dart' as http;

class CharityProfileController extends GetxController {
  late ApiClient _apiClient;

  Rx<ProfileInfoModel> profile = ProfileInfoModel().obs;
  RxBool isLoadingData=false.obs;
  RxBool isReadOnly=true.obs;


  TextEditingController searchController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController surnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController housenumberController = TextEditingController();

  TextEditingController streetoneController = TextEditingController();

  TextEditingController townoneController = TextEditingController();

  TextEditingController postcodeoneController = TextEditingController();

  TextEditingController accNameController = TextEditingController();

  TextEditingController accNumberController = TextEditingController();

  TextEditingController accSoftCodeController = TextEditingController();

  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  final count=1.obs;



  ///------------ Address --------------
  ///
  static const String _baseUrl = 'https://api.ideal-postcodes.co.uk';
  static const String _key = 'ak_lu3q2fx5XP10rIvksRD4uw1CHqKSM';

  var boxController = BoxController();

  var dummyController = TextEditingController();
  var addressLineOneController = TextEditingController();
  var addressFirstLine = '';
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
        dummyController.text = mapdata['result']['line_1'] ?? '';
        print(' first Line :: ${addressFirstLine}');
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
    //dummyController.clear();
  }



  @override
  void onClose() {

    super.onClose();
    searchController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    housenumberController.dispose();
    streetoneController.dispose();
    townoneController.dispose();
    postcodeoneController.dispose();
    accNameController.dispose();
    accNameController.dispose();
    accNumberController.dispose();
    accSoftCodeController.dispose();
    dummyController.dispose();
  }

  @override
  void onInit() async{
    _apiClient = ApiClient();

    await getCharityDetailsInfo();
    super.onInit();
  }
  /// done
  Future getCharityDetailsInfo() async {
    print('CharityProfileController.getCharityDetailsInfo');
    String? token = await localStoreSRF.getString('token');
    String? id = localStoreSRF.getString('id');
    final response = await _apiClient.connection(
      API_TYPE: 'GET',
      apiType: 'GET',
      REQUEST_TYPE: '',
      REQUEST_DATA: {},
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.getCharityProfileUrl+id.toString(),
      PARAM: {},
    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      var info=mapdata['data'];
      profile.value = ProfileInfoModel.fromJson(info);
      print('code :${profile.value.postcode.toString()}');
      print('profile name :${profile.value.name.toString()}');
      print('profile phone :${profile.value.phone.toString()}');
      print('profile  :${profile.value.toJson()}');
      nameController.text=profile.value.name.toString();
      surnameController.text=profile.value.surname.toString();
      phoneController.text=profile.value.number.toString();
      emailController.text=profile.value.email.toString();
      housenumberController.text=profile.value.houseno.toString();
      countryTextController.text=profile.value.town.toString();
      streetoneController.text=profile.value.street.toString();
      postcodeTextController.text=profile.value.postcode.toString();
     // addressLineOneController.text=profile.value.address.toString();
      addressLineTwoController.text=profile.value.addressTwo.toString();
      addressLineThreeController.text=profile.value.addressThird.toString();

      accNameController.text=profile.value.account_name.toString();
      accNumberController.text=profile.value.account_number.toString();
      accSoftCodeController.text=profile.value.account_sortcode.toString();

      print('post_code :: ${profile.value.postcode.toString()}');
    }
  }

  /// Update Profile
  Future updateCharityProfileUpdate() async {

    ProfileInfoModel proInfo = profile.value;

    var proName=nameController.value.text==''?proInfo.name:nameController.value.text;
    var proPhone=phoneController.value.text==''?proInfo.phone:phoneController.value.text;
    var proAddressOne=dummyController.value.text==''?proInfo.address:dummyController.value.text;
    var proAddressTwo=
    //proInfo.addressTwo.toString();
    addressLineTwoController.value.text==''?proInfo.addressTwo:addressLineTwoController.value.text;
    var proAddressThird=
   // proInfo.addressThird.toString();
    addressLineThreeController.value.text==''?proInfo.address:addressLineThreeController.value.text;
    var proTown= countryTextController.value.text==''? proInfo.town :countryTextController.value.text;
    var proPostCode= postcodeTextController.value.text==''? proInfo.postcode:postcodeTextController.value.text;
    var proAccName=accNameController.value.text==''?proInfo.accountno:accNameController.value.text;
    var proAccNumber=accNumberController.value.text==''?proInfo.account_name:accNumberController.value.text;
    var proAccSortCode=accSoftCodeController.value.text==''?proInfo.postcode:accSoftCodeController.value.text;


    print('proTown:${proTown}');
    print('proPostCode:${proPostCode}');
    print('proAddressOne:${proAddressOne}');
    print('proAddressOne:${proAddressOne}');
    String? id = localStoreSRF.getString('id');
    Map<String,dynamic> profileMap={
      "charityid": id,
      "name": proName,
      "phone":proPhone,
      "address_first_line":proAddressOne,
      "address_second_line":proAddressTwo,
      "address_third_line":proAddressThird,
      "town":proTown,
      "postcode":proPostCode,
      "account_name":proAccName,
      "account_number":proAccNumber,
      "account_sortcode":proAccSortCode,

    };

    print('MyProfileController.getUserProfileInfo');
    String? token = await localStoreSRF.getString('token');

    final response = await _apiClient.connectionNew(
      API_TYPE: 'POST',
      apiType: 'POST',
      REQUEST_TYPE: '',
      REQUEST_DATA: profileMap,
      customheader: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      apiUrl: ApiURL.updateCharityProfileUrl,
      PARAM: {},

    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: 'Profile update has successful!');

      clearController();

     await  getCharityDetailsInfo();
    }else{
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Profile update has Wrong.\n please try again');
    }

  }


}