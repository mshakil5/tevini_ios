import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:field_suggestion/box_controller.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/address_model.dart';
import '../../../data/models/home/dropdown_model.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../main.dart';
import 'package:http/http.dart' as http;

import '../../side_menu_draweritem/controller/side_menu_controller.dart';

class MyProfileController extends GetxController {
  late ApiClient _apiClient;
  final drawerController = Get.put(SideMenuController());
  //final profileKey = GlobalKey<FormState>();
  final  profileScaffold = new GlobalKey<ScaffoldState>();



  ///donation Slot
  Rx<DropdownModel?> chooseYourPersonTitle = Rxn(null);
  Rx<List<DropdownModel>> chooseYourPersonDropDownList = Rx([
    DropdownModel(itemText: 'Mr', itemValue: 'Mr'),
    DropdownModel(itemText: 'Mrs', itemValue: 'Mrs'),
  ]);

  Rx<ProfileInfoModel> profile = ProfileInfoModel().obs;
  RxBool isLoadingData=false.obs;
  RxBool isReadOnly=true.obs;
  final ImagePicker _picker = ImagePicker();
  final searchController = TextEditingController();

  final nameController = TextEditingController();

  final surnameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final housenumberController = TextEditingController();

  final streetoneController = TextEditingController();

  final townoneController = TextEditingController();

  final postcodeoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  final count=1.obs;

  var addressFirstLine = '';
  var profileImagePath = ''.obs;






  ///step 01
  Future<void> pickImage(ImageSource source) async {
    print('MyProfileController.pickImage  ${source}');


    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // Handle picked image


      print('Image picked: ${pickedFile.path}');

      if(source=='camera'){
        final result = await FlutterImageCompress.compressAndGetFile(
          pickedFile.path,
          pickedFile.path,
          minWidth: 800,
          minHeight: 600,
          quality: 70,
        );



        setProfileImage(result!.path);
      }else{
        setProfileImage(pickedFile.path);
      }

     // _uploadImage(pickedFile);
    }
    Get.back(); // Close the bottom sheet
  }

  /// image Finally Done step 02
  void setProfileImage(String imagePath) async{



    profileImagePath.value = imagePath;
    String? token = await localStoreSRF.getString('token');
    final response = await _apiClient.uploadProfileImage(
      profileImagePath: profileImagePath.value,
      tokenValue: token,
      apiUrl: ApiURL.updateProfileImageUrl,
      PARAM: {},

    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('mapdata $mapdata');
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: 'Profile update has successful!');
      await  getUserDetailsInfo();
    }
  }




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
   // dummyController.clear();
  }



  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;


  @override
  void dispose() {
    // TODO: implement dispose

    drawerController.onClose();
    searchController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    housenumberController.dispose();
    streetoneController.dispose();
    townoneController.dispose();
    postcodeoneController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    dummyController.clear();
    super.dispose();
  }

  @override
  void onClose() {

    super.onClose();
    searchController.clear();
    nameController.clear();
    surnameController.clear();
    phoneController.clear();
    emailController.clear();
    housenumberController.clear();
    streetoneController.clear();
    townoneController.clear();
    postcodeoneController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
  }

  @override
  void onInit() async{
    _apiClient = ApiClient();

    await getUserDetailsInfo();
    super.onInit();
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
      var info=mapdata['response']['data'];
      profile.value = ProfileInfoModel.fromJson(info);
      print('code :${profile.value.postcode.toString()}');
      print('profile name :${profile.value.name.toString()}');
      print('profile phone :${profile.value.phone.toString()}');
      print('profile  :${profile.value.toJson()}');
      nameController.text=profile.value.name.toString();
      surnameController.text=profile.value.surname.toString();
      phoneController.text=profile.value.phone.toString();
      emailController.text=profile.value.email.toString();
      housenumberController.text=profile.value.houseno.toString();
      countryTextController.text=profile.value.town.toString();
      streetoneController.text=profile.value.street.toString();
      postcodeTextController.text=profile.value.postcodeD.toString();
      // addressLineOneController.text=profile.value.address.toString();
      addressLineTwoController.text=profile.value.street.toString();
      addressLineThreeController.text=profile.value.addressThird.toString();

     // accNameController.text=profile.value.account_name.toString();
     // accNumberController.text=profile.value.account_number.toString();
     // accSoftCodeController.text=profile.value.account_sortcode.toString();

      print('post_code :: ${profile.value.postcode.toString()}');
    }

  }



  /// Update Profile
  Future updateUserProfileInfoUpdate() async {

    ProfileInfoModel proInfo = profile.value;


    var proName=nameController.value.text==''?proInfo.name:nameController.value.text;
    var surName=surnameController.value.text==''?proInfo.surname:surnameController.value.text;
    var proMail=proInfo.email;
    var proPhone=phoneController.value.text==''?proInfo.phone:phoneController.value.text;
    var proAddressOne=dummyController.value.text==''?proInfo.houseno.toString():dummyController.value.text;
    var proAddressTwo=
    //proInfo.addressTwo.toString();
    addressLineTwoController.value.text==''?proInfo.street:addressLineTwoController.value.text;
    var proAddressThird=
    // proInfo.addressThird.toString();
    addressLineThreeController.value.text==''?proInfo.address:addressLineThreeController.value.text;
    var proTown= countryTextController.value.text==''? proInfo.town :countryTextController.value.text;
    var proPostCode= postcodeTextController.value.text==''? proInfo.postcodeD:postcodeTextController.value.text;
    //var proAccName=accNameController.value.text==''?proInfo.accountno:accNameController.value.text;
    //var proAccNumber=accNumberController.value.text==''?proInfo.account_name:accNumberController.value.text;
    //var proAccSortCode=accSoftCodeController.value.text==''?proInfo.postcode:accSoftCodeController.value.text;

    print('proTown:${proTown}');
    print('proPostCode:${proPostCode}');
    print('proAddressOne:${proAddressOne}');
    print('proAddressOne:${proAddressOne}');


    String? id = localStoreSRF.getString('id');
    Map<String,dynamic> profileMap={

   /* $userdata->prefix_name= $request->prefix_name;
    $userdata->name= $request->name;
    $userdata->surname= $request->surname;
    $userdata->email= $request->email;
    $userdata->phone= $request->phone;
    $userdata->houseno= $request->houseno;
    $userdata->street= $request->street;
    $userdata->address_third_line = $request->address_third_line;
    $userdata->town= $request->town;
    $userdata->postcode= $request->postcode;*/

      "prefix_name": '',
      "name": proName,
      "surname": surName,
      "email": proMail,
      "phone":proPhone,
      "houseno":proAddressOne,
      "street":proAddressTwo,
      "address_third_line":proAddressThird,
      "town":proTown,
      "postcode":proPostCode,


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
      apiUrl: ApiURL.updateProfileUrl,
      PARAM: {},

    );

    if (response != null) {
      final Map<String, dynamic> mapdata = response.data;
      print('mapdata $mapdata');
      Helpers.snackbarForSucess(
          titleText: 'Successful Alert',
          bodyText: 'Profile update has successful!');
      clearController();

      await  getUserDetailsInfo();
    }else{
      Helpers.snackbarForErorr(
          titleText: 'Error Alert', bodyText: 'Profile update has Wrong.\n please try again');
    }

  }


/*
  /// Successful Image Upload Gallery but image issue
  Future<void> _uploadImage(_image) async {

    if (_image == null) {
      print('No image selected.');
      return;
    }
    String? token = await localStoreSRF.getString('token');
    var headToken={
      'Content-Type': 'multipart/form-data;',
      'Authorization': 'Bearer $token'
    };
    final url = 'https://www.tevini.co.uk/api/profile-image';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headToken);
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));


    var response = await request.send();
    print('response : ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      await getUserDetailsInfo();
    } else {
      print('Image upload failed with status code ${response.statusCode}');
    }
  }*/

}
