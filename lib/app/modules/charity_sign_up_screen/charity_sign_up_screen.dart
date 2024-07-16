import 'dart:convert';

import 'package:field_suggestion/field_suggestion.dart';
import 'package:tenvini/core/values/app_space.dart';

import '../../../data/models/address_model.dart';
import '../../../data/models/home/dropdown_model.dart';
import 'controller/charity_sign_up_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/custom_checkbox_button.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CharitySignUpScreen extends GetWidget<CharitySignUpController> {
  CharitySignUpScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 1150.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 2.v),
                              decoration: AppDecoration.fillPrimary,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [


                                    Container(

                                      padding: EdgeInsets.symmetric(horizontal: 146.h, vertical: 100.v),
                                      decoration: AppDecoration.fillPrimary,
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgNewlogo12,
                                          height: 41.v,
                                          color: Colors.white,
                                          width: 136.h),
                                    ),
                                    SizedBox(height: 14.v)
                                  ]))),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 20.h,
                            right: 20.h,
                            bottom: 10.v,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 10.v,
                          ),
                          decoration: AppDecoration.outlineGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Form(
                            key: controller.signUpFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "msg_create_an_account_charity".tr,
                                    style: theme.textTheme.headlineMedium,
                                  ),
                                ),

                                /// ------- Charity Info
                                Text(
                                  " Charity info",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 3.v),
                                Divider(height: 5,thickness: 3,),
                                SizedBox(height: 3.v),
                                Text(
                                  "Charity Name",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 3.v),
                                CustomTextFormField(
                               //   textStyle: TextStyle(fontSize: 15),
                                  controller: controller.nameController,
                                  hintText: "lbl_your_full_name".tr,
                                  hintStyle:
                                      CustomTextStyles.labelLargeErrorContainer,
                                  validator: (value) {
                                    if (!isText(value)) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  },
                                ),
                                AppSpace.spaceH6,
                                Text(
                                  "Charity Number",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 3.v),
                                CustomTextFormField(
                                //  textStyle: TextStyle(fontSize: 15),
                                  controller: controller.yourcontactController,
                                  hintText: "msg_your_contact_number".tr,
                                  hintStyle:
                                      CustomTextStyles.labelLargeErrorContainer,
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (!isNumeric(value)) {
                                      return "Please enter valid number";
                                    }
                                    return null;
                                  },
                                ),
                                AppSpace.spaceH6,


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex:7,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.h),
                                        child:  Text('Upload copy of bank statement for varification',style: TextStyle(color: Colors.teal,fontSize: 10),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child:  Icon(Icons.upload,color: Colors.teal,),
                                      ),
                                    ),
                                  ],
                                ),

                                /// ----- Charity Address
                                Text(
                                  " Address",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 3.v),
                                Divider(height: 5,thickness: 3,),
                                SizedBox(height: 3.v),
                                ///------------ finder Address ------

                                Text(
                                  "Address First Line",
                                  style: theme.textTheme.titleMedium,
                                ),
                                AppSpace.spaceH6,

                                FieldSuggestion<AddressModel>.network(
                                  inputDecoration: InputDecoration(

                                    fillColor: Colors.white10,

                                    filled: true,


                                    hintText:  "Auto finder address",
                                    hintStyle:  CustomTextStyles.tithintBlackA700,
                                    //    prefixIcon: prefix,
                                    // prefixIconConstraints: prefixConstraints,
                                    //suffixIcon: suffix,
                                    //  suffixIconConstraints: suffixConstraints,
                                    isDense: true,
                                    contentPadding:  EdgeInsets.all(9.h),
                                    // fillColor: appTheme.teal50, //old appTheme.gray200,
                                    // filled: filled,



                                    border:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.h),
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.onPrimaryContainer,
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.h),
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.onPrimaryContainer,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder:
                                    OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.h),
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.onPrimaryContainer,
                                        width: 1,
                                      ),
                                    ),


                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  future: (input) => controller.shouldSearch
                                      ? controller.addressLineOneController.text.length > 1
                                      ? controller.searchAddress(input)
                                      : controller.returnEmptyFutureData()
                                      : controller.returnEmptyFutureData(),
                                  textController:controller.addressLineOneController,
                                  boxController: controller.boxController,
                                  sizeByItem: 20,

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter address!';
                                    }
                                    return null;
                                  },
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState != ConnectionState.done) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final result = snapshot.data ?? [];
                                    return
                                      ListView.builder(
                                        itemCount: result.length,

                                        itemBuilder: (context, index) {
                                          //  print('result lng : ${snapshot.data}');
                                          return GestureDetector(
                                            onTap: () {
                                              controller.shouldSearch = false;
                                              controller.addressLineOneController.text = result[index].suggestion!;

                                              FocusScope.of(context).unfocus();
                                              controller.boxController.close?.call();
                                              controller.shouldSearch = true;

                                              /// get address details and set data to text fields
                                              if (result[index].urls != null &&
                                                  result[index].urls!.udprn != null) {
                                                controller.getAndSetAddressDetails(
                                                    result[index].urls!.udprn!);
                                              }
                                            },
                                            child: Card(
                                                elevation: 0.2,
                                                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(result[index].suggestion!,style: TextStyle(color: Colors.black),),
                                                )),
                                          );
                                        },
                                      );
                                  },
                                ),

                                AppSpace.spaceH6,

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address Second Line",
                                              style: theme.textTheme.titleMedium,
                                            ),
                                            SizedBox(height: 3.v),
                                            CustomTextFormField(
                                              fillColor: Colors.white10,
                                              isReadOnly: true,
                                              width: 185.h,
                                              controller: controller.addressLineTwoController,
                                              hintText: "Address Second Line".tr,
                                              textInputType: TextInputType.text,
                                              validator: (value) {

                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address Third Line",
                                              style: theme.textTheme.titleMedium,
                                            ),
                                            SizedBox(height: 3.v),
                                            CustomTextFormField(
                                              fillColor: Colors.white10,

                                              width: 185.h,
                                              controller: controller.addressLineThreeController,
                                              hintText: "Address Third Line",
                                              isReadOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                /// Town post
                                AppSpace.spaceH6,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_town".tr,
                                              style: theme.textTheme.titleMedium,
                                            ),
                                            SizedBox(height: 3.v),
                                            CustomTextFormField(
                                              //   textStyle: TextStyle(fontSize: 15),
                                              controller: controller.countryTextController,
                                              hintText: "lbl_your_town".tr,
                                              hintStyle:
                                              CustomTextStyles.labelLargeErrorContainer,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "lbl_post_code".tr,
                                              style: theme.textTheme.titleMedium,
                                            ),
                                            SizedBox(height: 3.v),
                                            CustomTextFormField(
                                              //  textStyle: TextStyle(fontSize: 15),
                                              controller: controller.postcodeTextController,
                                              hintText: "lbl_your_post_code".tr,
                                              hintStyle:
                                              CustomTextStyles.labelLargeErrorContainer,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ///--------- End -------------



                                AppSpace.spaceH6,


                                /// ------------ Credentials
                                ///
                                Text(
                                  " Credentials",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 3.v),
                                Divider(height: 5,thickness: 3,),
                                SizedBox(height: 3.v),
                                Text(
                                  "lbl_email".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 3.v),
                                CustomTextFormField(
                               //   textStyle: TextStyle(fontSize: 15),
                                  controller: controller.emailController,
                                  hintText: "msg_your_email_address".tr,
                                  hintStyle:
                                      CustomTextStyles.labelLargeErrorContainer,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                ),
                                AppSpace.spaceH6,
                                Text(
                                  "lbl_password".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 3.v),
                                Obx(
                                  () => CustomTextFormField(
                                 //   textStyle: TextStyle(fontSize: 15),
                                    controller: controller.passwordController,
                                    hintText: "lbl_password".tr,
                                    hintStyle: CustomTextStyles
                                        .labelLargeErrorContainer,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 11.v, 10.h, 11.v),
                                        child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye,
                                        ),
                                      ),
                                    ),
                                    suffixConstraints: BoxConstraints(
                                      maxHeight: 36.v,
                                    ),
                                    validator: (value) {
                                     /* if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "Please enter valid password";
                                      }*/
                                      return null;
                                    },
                                    obscureText:
                                        controller.isShowPassword.value,
                                    contentPadding: EdgeInsets.only(
                                      left: 10.h,
                                      top: 9.v,
                                      bottom: 9.v,
                                    ),
                                  ),
                                ),
                               AppSpace.spaceH6,
                                Text(
                                  "msg_confirm_password".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 3.v),
                                Obx(
                                  () => CustomTextFormField(
                                  //  textStyle: TextStyle(fontSize: 15),
                                    controller:
                                        controller.confirmpasswordController,
                                    hintText: "msg_confirm_password".tr,
                                    hintStyle: CustomTextStyles
                                        .labelLargeErrorContainer,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword1.value =
                                            !controller.isShowPassword1.value;
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 11.v, 10.h, 11.v),
                                        child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword1.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye,
                                        ),
                                      ),
                                    ),
                                    suffixConstraints: BoxConstraints(
                                      maxHeight: 36.v,
                                    ),
                                    validator: (value) {
                                     /* if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "Please enter valid password";
                                      }*/
                                      return null;
                                    },
                                    obscureText:
                                        controller.isShowPassword1.value,
                                    contentPadding: EdgeInsets.only(
                                      left: 10.h,
                                      top: 9.v,
                                      bottom: 9.v,
                                    ),
                                  ),
                                ),
                                AppSpace.spaceH6,
                                Obx(
                                  () => CustomCheckboxButton(
                                    text: "msg_i_agree_to_the_terms".tr,
                                    value: controller.agreementText.value,
                                    margin: EdgeInsets.only(
                                      top: 11.v,
                                      right: 0.h,
                                      bottom: 20.v,
                                    ),
                                    textStyle: CustomTextStyles
                                        .titleMediumPrimaryContainer,
                                    onChange: (value) {
                                      controller.agreementText.value = value;
                                    },
                                  ),
                                ),
                                AppSpace.spaceH20,
                              ],
                            ),
                          ),
                        ),
                      ),

                      CustomElevatedButton(
                        width: 262.h,
                        text: "lbl_sign_up".tr,
                        alignment: Alignment.bottomCenter,
                        onTap: (){
                          if (controller.signUpFormKey.currentState!.validate()) {

                           // controller.signUpTap(context);

                            // Get.toNamed(AppRoutes.homeContainerScreen,);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                AppSpace.spaceH10,
                Text(
                  "lbl_or".tr,
                  style: CustomTextStyles.titleMediumPrimaryContainer,
                ),
               AppSpace.spaceH10,
                InkWell(
                  onTap: (){

                    Get.back();


                  },
                  child: Text(
                    "msg_login_with_existing".tr,
                    style: CustomTextStyles.titleMediumPrimaryContainer,
                  ),
                ),
               AppSpace.spaceH20
              ],
            ),
          ),
        ),
      ),
    );
  }
  onTapArrowleftone() {
    Get.back();
  }

  /// DropDown Donation Slot
  personTitleDropDown() {
    return Obx(() => Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200)
        //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DropdownModel?>(
          hint: const Text('Please Select'),
          value: controller.chooseYourPersonTitle.value,
          isExpanded: true,
          items: controller.chooseYourPersonDropDownList.value
              .map((e) => DropdownMenuItem<DropdownModel>(
              value: e, child: Text(e.itemText)))
              .toList(),
          onChanged: (v) {
            controller.chooseYourPersonTitle.value = v;
          },
        ),
      ),
    ));
    //);
  }

}
