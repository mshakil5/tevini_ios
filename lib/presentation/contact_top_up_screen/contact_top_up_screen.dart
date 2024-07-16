import 'dart:convert';

//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:tenvini/core/values/app_space.dart';

import '../../main.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/contact_top_up_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ContactTopUpScreen extends GetWidget<ContactTopUpController> {
  ContactTopUpScreen({Key? key}) : super(key: key);
  String? name = localStoreSRF.getString('name');
  String? accNo =  localStoreSRF.getString('accNo');
  String? email =  localStoreSRF.getString('email');
  String? userProfile = localStoreSRF.getString('userProfile');
  final GlobalKey<ScaffoldState> contactTopUpScaffoldKey = new GlobalKey<ScaffoldState>();
  SideMenuController drawerController = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: contactTopUpScaffoldKey ,
        resizeToAvoidBottomInset: true,
      drawer: SideMenuDraweritem(),
        appBar:
        CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {

              contactTopUpScaffoldKey.currentState?.openDrawer();

            },
            margin: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              right: 0.v,
              bottom: 11.v,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Acc No: $accNo',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*CircleAvatar(
                      radius: 14,
                      child: Icon(
                        Icons.person,
                        size: 18,
                      ),
                    ),*/

                    CircleAvatar(
                      radius:12,
                      backgroundColor: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomImageView(
                          placeHolder: ImageConstant.imgHolder,
                          url: ImageConstant.imageProfilePath+'${userProfile}',
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Text(name.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
              key: controller.formKey,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 19.h, right: 19.h, bottom: 5.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_contact_top_up".tr, style: theme.textTheme.headlineSmall),
                        SizedBox(height: 11.v),
                        Text("lbl_full_name".tr, style: theme.textTheme.titleMedium),
                        SizedBox(height: 3.v),
                        CustomTextFormField(
                         // textStyle: TextStyle(fontSize: 16),

                          isReadOnly: true,
                            controller: controller.fullNameController,
                            hintText: controller.name
                            ),
                        SizedBox(height: 14.v),
                        Text("lbl_email_address".tr,
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 3.v),
                        CustomTextFormField(
                          //  textStyle: TextStyle(fontSize: 16),

                            isReadOnly: true,
                            controller: controller.emailController,
                            hintText: controller.email,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value,
                                      isRequired: true))) {
                                return "Please enter valid email";
                              }
                              return null;
                            }),
                        SizedBox(height: 15.v),
                        Text("lbl_subject".tr,
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 2.v),
                        CustomTextFormField(
                           // textStyle: TextStyle(fontSize: 16),

                            controller: controller.subjectoneController,
                            hintText: "lbl_subject".tr),
                        SizedBox(height: 15.v),
                        Text("lbl_message".tr,
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 2.v),
                        CustomTextFormField(
                           // textStyle: TextStyle(fontSize: 16),

                            controller: controller.messageController,
                            hintText: "lbl_message".tr,
                            textInputAction: TextInputAction.done,
                            maxLines: 4,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 12.v)),
                        SizedBox(height: 24.v),

                        CustomOutlinedButton(
                          alignment: Alignment.center,
                          buttonStyle: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                          buttonTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            borderRadius: BorderRadius.circular(
                              20.h,
                            ),
                          ),
                          onTap: () {
                            //controller.contactSubmit();
                            //  Get.toNamed(AppRoutes.makeADonationOneScreen);
                          },
                          //width: 200.h,
                          height: 45.h,
                          text: "lbl_submit".tr,
                        ),
                      /*  CustomOutlinedButton(
                          onTap: ()=>
                              controller.contactSubmit(),
                            decoration: BoxDecoration(color:  theme.colorScheme.error,
                              borderRadius: BorderRadius.circular(
                                3.h,
                              ),
                            ),
                            width: 100.h, text: "lbl_submit".tr),*/
                        SizedBox(height: 24.v),
                        Container(
                            width: 390.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 4.v),
                            decoration: AppDecoration.fillTeal.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder4),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 7.v),
                                  Text("msg_phone_07490_956".tr,
                                      style: CustomTextStyles
                                          .headlineMediumSemiBold_1),
                                  SizedBox(height: 3.v),
                                  Text("msg_email_info_tevini_co_uk".tr,
                                      style: CustomTextStyles
                                          .headlineMediumSemiBold_1)
                                ])),
                        SizedBox(height: 27.v),
                        Text("msg_top_up_your_account".tr,
                            style: CustomTextStyles
                                .headlineMediumSemiBold_1),
                        Container(
                            width: 344.h,
                            margin:
                                EdgeInsets.only(top: 4.v, right: 45.h),
                            child: Text("msg_to_top_your_account".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeGray900
                                    .copyWith(height: 1.27))),
                        Container(
                            width: 311.h,
                            margin:
                                EdgeInsets.only(top: 8.v, right: 78.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_1_transfer_funds2".tr,
                                      style: CustomTextStyles
                                          .titleLargeGray90022_1),
                                  TextSpan(
                                      text: "msg_tevini_ltd_sort".tr,
                                      style: CustomTextStyles
                                          .titleMediumMedium_1
                                          .copyWith(height: 1.44))
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 12.v),
                        SizedBox(
                            width: 144.h,
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_2_send_a_cheque".tr,
                                      style: CustomTextStyles
                                          .titleLargeGray90022_1),
                                  TextSpan(
                                      text: "msg_payable_to_tevini".tr,
                                      style: CustomTextStyles
                                          .titleMediumMedium_1
                                          .copyWith(height: 1.44))
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 10.v),
                        Text("msg_3_top_up_using".tr,
                            style: CustomTextStyles.titleLargeGray90022),
                        SizedBox(height: 19.v),


                        /// Stripe Payment getway
                        Text("**Please note that if you are topping up your account using a credit/debit card there will be an additional fee of 2% on top of the standard 5% commission fee alternatively you can top up by transfer to the following: Tevini Ltd S/C 40-52-40 A/C 00024463.",
                            style: theme.textTheme.titleMedium),

                        AppSpace.spaceH10,
                        ///

/*
                        Text("Top Up Amount",
                            style: theme.textTheme.titleLarge),
                        AppSpace.spaceH10,
                        CustomTextFormField(
                          //  textStyle: TextStyle(fontSize: 16),

                            controller: controller.topUpPaymentController,
                            hintText: "£",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v)),
                        AppSpace.spaceH10,

                        Text("Name on Card",
                            style: theme.textTheme.titleLarge),
                        AppSpace.spaceH10,
                        CustomTextFormField(
                          //  textStyle: TextStyle(fontSize: 16),

                            controller: controller.cardNameHolderController,
                            hintText: "",
                            textInputAction: TextInputAction.done,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 12.v),
                        ),*/
                        AppSpace.spaceH20,
                        CustomOutlinedButton(
                          alignment: Alignment.center,
                          buttonStyle: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                          buttonTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            borderRadius: BorderRadius.circular(
                              20.h,
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.tiviniCardWebView);
                        //   controller.makePayment(context);
                            //  Get.toNamed(AppRoutes.makeADonationOneScreen);
                          },
                          //width: 200.h,
                          height: 45.h,
                          text: "lbl_top_up_account".tr,
                        ),

                        AppSpace.spaceH30,
                        AppSpace.spaceH30

                      ])),),
        ),
    );
  }
}
