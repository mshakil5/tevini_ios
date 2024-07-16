import 'controller/app_navigation_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: SizedBox(
            width: 375.h,
            child: Column(children: [
              Container(
                  decoration: AppDecoration.fillWhiteA,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 10.v),
                            child: Text("lbl_app_navigation".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 20.fSize,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400)))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text("msg_check_your_app_s".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: appTheme.blueGray40001,
                                    fontSize: 16.fSize,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400)))),
                    SizedBox(height: 5.v),
                    Divider(
                        height: 1.v,
                        thickness: 1.v,
                        color: appTheme.black900)
                  ])),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          decoration: AppDecoration.fillWhiteA,
                          child: Column(children: [
                            GestureDetector(
                                onTap: () {
                                  onTapSplashSecreen();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_splash_secreen".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapSignIn();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text("lbl_sign_in2".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapForgetPassword();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_forget_password".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapSignUp();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text("lbl_sign_up2".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapHomeContainer();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_home_container".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapOrderACardTabContainer();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_order_a_card_tab".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapOrderACardOne();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_order_a_card_one".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapUpdateCardholder();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_update_cardholder"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMobileVerification();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_mobile_verification"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapCardActivation();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_card_activation".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapGetPINTabContainer();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_get_pin_tab_container"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapGetPinandChangethePin();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_get_pin_and_change"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapChangeCardStatus();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_change_card_status"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMakeADonation();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_make_a_donation".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMakeADonationOne();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_make_a_donation".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapDonationRecord();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_donation_record".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapStandingDonationRecords();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_standing_donation"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapFrame18706();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_frame_18706".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapFrame18705();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_frame_18705".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapOrdervoucherbooks();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_order_voucher_books2"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapOrderRecord();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_order_record".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapWatingVoucherRecords();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_wating_voucher_records"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapFrame18708();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_frame_18708".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapAllTransaction();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_all_transaction".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMoneyIn();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text("lbl_money_in".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMoneyOut();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_money_out".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapPendingtransaction();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_pending_transaction"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMaasercalculator();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "msg_maaser_calculator"
                                                      .tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapContactTopUp();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_contact_top_up".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapMyprofile();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_my_profile".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapNotification();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_notification".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ]))),
                            GestureDetector(
                                onTap: () {
                                  onTapFrame18709();
                                },
                                child: Container(
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Column(children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.h,
                                                  vertical: 10.v),
                                              child: Text(
                                                  "lbl_frame_18709".tr,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          appTheme.black900,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w400)))),
                                      SizedBox(height: 5.v),
                                      Divider(
                                          height: 1.v,
                                          thickness: 1.v,
                                          color: appTheme.blueGray40001)
                                    ])))
                          ]))))
            ])));
  }

  /// Navigates to the splashSecreenScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the splashSecreenScreen.
  onTapSplashSecreen() {
    Get.toNamed(
      AppRoutes.splashSecreenScreen,
    );
  }

  /// Navigates to the signInScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signInScreen.
  onTapSignIn() {
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }

  /// Navigates to the forgetPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the forgetPasswordScreen.
  onTapForgetPassword() {
    Get.toNamed(
      AppRoutes.forgetPasswordScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signUpScreen.
  onTapSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the homeContainerScreen.
  onTapHomeContainer() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Navigates to the orderACardTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the orderACardTabContainerScreen.
  onTapOrderACardTabContainer() {
    Get.toNamed(
      AppRoutes.orderACardTabContainerScreen,
    );
  }

  /// Navigates to the orderACardOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the orderACardOneScreen.
  onTapOrderACardOne() {
    Get.toNamed(
      AppRoutes.orderACardOneScreen,
    );
  }

  /// Navigates to the updateCardholderScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the updateCardholderScreen.
  onTapUpdateCardholder() {
    Get.toNamed(
      AppRoutes.updateCardholderScreen,
    );
  }

  /// Navigates to the mobileVerificationScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the mobileVerificationScreen.
  onTapMobileVerification() {
    Get.toNamed(
      AppRoutes.mobileVerificationScreen,
    );
  }

  /// Navigates to the cardActivationScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the cardActivationScreen.
  onTapCardActivation() {
    Get.toNamed(
      AppRoutes.cardActivationScreen,
    );
  }

  /// Navigates to the getPinTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the getPinTabContainerScreen.
  onTapGetPINTabContainer() {
    Get.toNamed(
      AppRoutes.getPinTabContainerScreen,
    );
  }

  /// Navigates to the getPinAndChangeThePinScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the getPinAndChangeThePinScreen.
  onTapGetPinandChangethePin() {
    Get.toNamed(
      AppRoutes.getPinAndChangeThePinScreen,
    );
  }

  /// Navigates to the changeCardStatusScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the changeCardStatusScreen.
  onTapChangeCardStatus() {
    Get.toNamed(
      AppRoutes.changeCardStatusScreen,
    );
  }

  /// Navigates to the makeADonationScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the makeADonationScreen.
  onTapMakeADonation() {
    Get.toNamed(
      AppRoutes.makeADonationScreen,
    );
  }

  /// Navigates to the makeADonationOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the makeADonationOneScreen.
  onTapMakeADonationOne() {
    Get.toNamed(
      AppRoutes.makeADonationOneScreen,
    );
  }

  /// Navigates to the donationRecordScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the donationRecordScreen.
  onTapDonationRecord() {
    Get.toNamed(
      AppRoutes.donationRecordScreen,
    );
  }

  /// Navigates to the standingDonationRecordsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the standingDonationRecordsScreen.
  onTapStandingDonationRecords() {
    Get.toNamed(
      AppRoutes.standingDonationRecordsScreen,
    );
  }

  /// Navigates to the frame18706Screen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the frame18706Screen.
  onTapFrame18706() {
    Get.toNamed(
      AppRoutes.frame18706Screen,
    );
  }

  /// Navigates to the frame18705Screen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the frame18705Screen.
  onTapFrame18705() {
    Get.toNamed(
      AppRoutes.frame18705Screen,
    );
  }

  /// Navigates to the orderVoucherBooksScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the orderVoucherBooksScreen.
  onTapOrdervoucherbooks() {
    Get.toNamed(
      AppRoutes.orderVoucherBooksScreen,
    );
  }

  /// Navigates to the orderRecordScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the orderRecordScreen.
  onTapOrderRecord() {
    Get.toNamed(
      AppRoutes.orderRecordScreen,
    );
  }

  /// Navigates to the watingVoucherRecordsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the watingVoucherRecordsScreen.
  onTapWatingVoucherRecords() {
    Get.toNamed(
      AppRoutes.watingVoucherRecordsScreen,
    );
  }

  /// Navigates to the frame18708Screen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the frame18708Screen.
  onTapFrame18708() {
    Get.toNamed(
      AppRoutes.frame18708Screen,
    );
  }

  /// Navigates to the allTransactionScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the allTransactionScreen.
  onTapAllTransaction() {
    Get.toNamed(
      AppRoutes.allTransactionScreen,
    );
  }

  /// Navigates to the moneyInScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the moneyInScreen.
  onTapMoneyIn() {
    Get.toNamed(
      AppRoutes.moneyInScreen,
    );
  }

  /// Navigates to the moneyOutScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the moneyOutScreen.
  onTapMoneyOut() {
    Get.toNamed(
      AppRoutes.moneyOutScreen,
    );
  }

  /// Navigates to the pendingTransactionScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the pendingTransactionScreen.
  onTapPendingtransaction() {
    Get.toNamed(
      AppRoutes.pendingTransactionScreen,
    );
  }

  /// Navigates to the maaserCalculatorScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the maaserCalculatorScreen.
  onTapMaasercalculator() {
    Get.toNamed(
      AppRoutes.maaserCalculatorScreen,
    );
  }

  /// Navigates to the contactTopUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the contactTopUpScreen.
  onTapContactTopUp() {
    Get.toNamed(
      AppRoutes.contactTopUpScreen,
    );
  }

  /// Navigates to the myProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the myProfileScreen.
  onTapMyprofile() {
    Get.toNamed(
      AppRoutes.myProfileScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the notificationScreen.
  onTapNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the frame18709Screen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the frame18709Screen.
  onTapFrame18709() {
    Get.toNamed(
      AppRoutes.frame18709Screen,
    );
  }
}
