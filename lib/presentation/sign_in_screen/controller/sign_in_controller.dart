import 'dart:convert';
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

import '../../../core/values/app_helper.dart';
import '../../../core/values/app_url.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/apiClient/repo.dart';
import '../../../data/cart_local_store.dart';
import '../../../data/models/home/dropdown_model.dart';
import '../../../main.dart';


class SignInController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isLoginRememberMe =false.obs;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignInModel> signInModelObj = SignInModel().obs;

  Rx<bool> isShowPassword = true.obs;

  late ApiClient _apiClient;

  ///Login Role
  Rx<DropdownModel?> chooseYourLoginRole= Rxn(null);
  Rx<List<DropdownModel>> chooseYourLoginRoleDropDownList = Rx([
    DropdownModel(itemText: 'Log in as Donor', itemValue: '1'),
    DropdownModel(itemText: 'Log in as Charity', itemValue: '2'),
  ]);

  @override
  void onInit() {
    _apiClient = ApiClient();
    // TODO: implement onInit
    super.onInit();
  }

  Future signInTap(BuildContext context) async {


    if(chooseYourLoginRole.value=='' ||chooseYourLoginRole.value==null){
      return Helpers.snackbarForErorr(
          titleText: 'Error Alert',
          bodyText: 'Please Select The Role');
    }else{

    if(chooseYourLoginRole.value!.itemValue=='1'){
      print('donar');

        ///donar
      if(emailController.text=='' && passwordController .text==''){
        return Helpers.snackbarForErorr(
            titleText: 'Error Alert',
            bodyText: 'Please Fill out this field');
      }


      final response = await _apiClient.connectionLogin(
        API_TYPE: 'LOGIN',
        apiType: 'POST',
        REQUEST_TYPE: '',
        REQUEST_DATA: {
          "email": emailController.text,
          "password": passwordController.text
        },

        apiUrl: ApiURL.loginUrl,
        PARAM: {},
      );
      if (response != null) {

        final Map<String, dynamic> myresponse = response.data;
        String token = myresponse["token"];
        String name = myresponse["name"]??'';

        String accNo = myresponse['data']["accountno"]??'';
        String balance = myresponse['data']["balance"]??'';
        int donorId = myresponse['data']["id"]??-1;
        print('accNo >>> $accNo');
        print('balance >>> $balance');
        print('donorId >>> $donorId');


        String email = myresponse['data']["email"]??'';

        String houseno = myresponse['data']["houseno"]??'';
        String street = myresponse['data']["street"]??'';
        String town = myresponse['data']["town"]??'';
        String postcode = myresponse['data']["postcode"]??'';
        String photo = myresponse['data']["photo"]??'';

        String address=houseno+' '+street+' '+town+' '+postcode;

        await localStoreSRF.setInt('donorId', donorId);
        await localStoreSRF.setString('name', name);
        await localStoreSRF.setString('token', token);
        await localStoreSRF.setString('accNo', accNo);
        await localStoreSRF.setString('email', email);
        await localStoreSRF.setString('address', address);
        await localStoreSRF.setString('userProfile', photo);


        await localStoreSRF.setString('balance', balance);
        Get.offNamedUntil(AppRoutes.homeContainerScreen, (route) => false);
      }
    }else{
      print('charity');

        /// Charity
      if(emailController.text=='' && passwordController .text==''){
        return Helpers.snackbarForErorr(
            titleText: 'Error Alert',
            bodyText: 'Please Fill out this field');
      }

      final response = await _apiClient.connectionLogin(
        API_TYPE: 'LOGIN',
        apiType: 'POST',
        REQUEST_TYPE: '',
        REQUEST_DATA: {
          "login": emailController.text,
          "password": passwordController.text
        },

        apiUrl: ApiURL.loginCharityUrl,
        PARAM: {},
      );
      if (response != null) {
        final Map<String, dynamic> myresponse = response.data;
        String token = myresponse["token"];
        String name = myresponse["name"]??'';
        int id = myresponse['data']["id"]??'';
        String accNo = myresponse['data']["acc_no"]??'';
        String balance = myresponse['data']["balance"]??'';
        String email = myresponse['data']["email"]??'';
        String number = myresponse['data']["number"]??'';

        await localStoreSRF.setString('name', name);
        await localStoreSRF.setString('token', token);
        await localStoreSRF.setString('id', id.toString());
        await localStoreSRF.setString('accNo', accNo);
        await localStoreSRF.setString('email', email);
        await localStoreSRF.setString('number', number);
        await localStoreSRF.setString('balance', balance);

        Get.offNamedUntil(AppRoutes.charityDashboard, (route) => false);
      }
    }
   }

  }

  roleChangeSignUp(){
    if(chooseYourLoginRole.value=='' ||chooseYourLoginRole.value==null){
      return Helpers.snackbarForErorr(
          titleText: 'Error Alert',
          bodyText: 'Please Select The Role');
    }else{
      if(chooseYourLoginRole.value!.itemValue=='1'){
        print('donor');
        Get.toNamed(AppRoutes.signUpScreen);
      }else{
        Get.toNamed(AppRoutes.charitySignUp);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }


}
