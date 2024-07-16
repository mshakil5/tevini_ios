

import 'dart:ffi';

import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/presentation/home_page/home_page.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_image_1.dart';
import 'package:tenvini/widgets/app_bar/appbar_searchview_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_bottom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/address_model.dart';
import '../../../../data/models/user_profile_model.dart';
import '../../../../main.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../controllers/charity_profile_controller.dart';

class CharityProfileView extends GetView<CharityProfileController> {

  final GlobalKey<ScaffoldState> profileScaffoldKey = new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');
  @override
  Widget build(BuildContext context) {


    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        key: profileScaffoldKey,
        drawer: charity_drawer(),
        appBar:  CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              print('HomePage.build');
              profileScaffoldKey.currentState?.openDrawer();
            },
            margin: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              right: 0.v,
              bottom: 11.v,
            ),
          ),

          centerTitle: true,
          title: Text('Acc No: $accNo',style: TextStyle(fontSize: 18,color: Colors.white),),

        ),
        body:

        Obx((){
          ProfileInfoModel userProfile= controller.profile.value;
          String profileImagePath=userProfile.photo.toString();

          return  Form(
            // key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 2.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    SizedBox(
                      height: 100.v,
                      width: 100.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius:100,
                            backgroundColor: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomImageView(
                                placeHolder: ImageConstant.imgHolder,
                                url: ImageConstant.imageProfilePath+'${profileImagePath}',
                                //    imagePath: ImageConstant.imgImage14,
                                height: 126.v,
                                width: 120.h,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                         /* CustomImageView(
                            svgPath: ImageConstant.imgShare,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                          ),*/
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
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
                                  "lbl_name".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(

                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.nameController,
                                  hintText: "lbl_name".tr,
                                  validator: (value) {
                                    if (!isText(value)) {
                                      return "Please enter valid text";
                                    }
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
                                  "lbl_phone".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(
                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.phoneController,
                                  hintText: "lbl_phone".tr,
                                  textInputType: TextInputType.phone,
                                  validator: (value) {
                                    if (!isValidPhone(value)) {
                                      return "Please enter valid phone number";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.v),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_email".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(

                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: true,
                                  //controller.isReadOnly.value,

                                  controller: controller.emailController,
                                  hintText: "lbl_email".tr,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value, isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),



                    ///------------ finder Address ------

                    Text(
                      "Address First Line",
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpace.spaceH6,


                    controller.isReadOnly.value?
                    CustomTextFormField(

                      fillColor: Colors.teal.shade50,//:Colors.white10,
                      isReadOnly: true,
                      //controller.isReadOnly.value,

                      controller: controller.dummyController,
                      hintText: controller.profile.value.address.toString()??'',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "";
                        }
                        return null;
                      },
                    ):
                    FieldSuggestion<AddressModel>.network(
                      inputDecoration: InputDecoration(

                        fillColor: controller.isReadOnly.value ?
                        Colors.teal.shade50 :Colors.white10,

                        filled: true,


                          hintText:  controller.profile.value.address??'',
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
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(
                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly:true,
                                  //controller.isReadOnly.value,

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
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(
                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly:true,
                                  //controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.addressLineThreeController,
                                  hintText: "Address Third Line",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    ///--------- End -------------

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
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(
                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: true,
                                  //controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.countryTextController,
                                  hintText: "lbl_town".tr,
                                  textInputType: TextInputType.text,
                                  validator: (value) {
                                    if (!isNumeric(value)) {
                                      return "Please enter valid number";
                                    }
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
                                  "lbl_postcode2".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(
                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly:true,
                                  //controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.postcodeTextController,
                                  hintText: "lbl_postcode2".tr,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 5.v),
                    Padding(
                      padding: EdgeInsets.only(right: 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account Name",
                            style: theme.textTheme.titleLarge,
                          ),
                          AppSpace.spaceH6,
                          CustomTextFormField(
                            fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                            isReadOnly: controller.isReadOnly.value,


                            controller: controller.accNameController,
                            hintText: "Account Name",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v),
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
                                  "Account Number",
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(

                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.accNumberController,
                                  hintText: "Account Number",
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
                                  "Account Sortcode",
                                  style: theme.textTheme.titleLarge,
                                ),
                                AppSpace.spaceH6,
                                CustomTextFormField(

                                  fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                  isReadOnly: controller.isReadOnly.value,

                                  width: 185.h,
                                  controller: controller.accSoftCodeController,
                                  hintText: "Account Sortcode",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSpace.spaceH20,
                    CustomElevatedButton(
              
                        width: Get.width / 1.5,
                        text:  controller.isReadOnly.value? ' Edit Profile': 'Update Profile',
                        onTap: () async{


                          if(controller.isReadOnly.value==true){
                            print('MyProfileScreen.build if  ${controller.isReadOnly.value}');
                            controller.isReadOnly.value=false;
                          }else{
                           await controller.updateCharityProfileUpdate();
                            controller.isReadOnly.value=true;
                          }

                              /// Update Code

                        },
                        alignment: Alignment.bottomCenter),
                    AppSpace.spaceH10,
                    CustomElevatedButton(

                        width: Get.width / 1.5,
                        text:  "Change Password",
                        onTap: () {
                          /// Update Code
                          Get.toNamed(AppRoutes.chariyChangePassword);
                        },
                        alignment: Alignment.bottomCenter),
                    AppSpace.spaceH20,
              
                  ],
                ),
              ),
            ),
          );
        })



    );
  }

  charity_drawer(){
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderLR80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              alignment: Alignment.center,
              imagePath: ImageConstant.imgNewlogo12,
              color: Colors.teal,
              height: 39.v,

              width: 132.h,
              margin: EdgeInsets.only(left: 26.h),
            ),
            SizedBox(height: 20),
            drawerMenuItem(0, ImageConstant.imgNavhome, "Dashboard".tr),
            divLine(),
            drawerMenuItem(1, ImageConstant.imgCar, "Transaction"),
            divLine(),
            drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer,"Link"),
            divLine(),
            drawerMenuItem(3, ImageConstant.imgFrameErrorcontainer, "Profile"),
            divLine(),
            drawerMenuItem(12, ImageConstant.imgReply, "lbl_logout".tr),
            divLine(),
            SizedBox(height: 10),



          ],
        ),
      ),
    );
  }
  divLine(){
    return SizedBox(
      height: 2.v,

      child: Divider(
        indent: 20,
        endIndent: 10,


      ),
    );
  }

  drawerMenuItem(int count, String imagePath, String title) {
    return InkWell(
      onTap: () {
        print('SideMenuDraweritem.drawerMenuItem $title');
        if (count == 0) {
          Get.back();
          Get.toNamed(AppRoutes.charityDashboard,
          );
        } else if (count == 1) {
          Get.back();
          Get.toNamed(AppRoutes.charityGetTransaction);


        } else if (count == 2) {
          Get.back();
          Get.toNamed(AppRoutes.charityLink,

          );
        }

        else if(count==3){
          Get.back();
          Get.toNamed(AppRoutes.charityProfile);

          /// profile
        }
        else if (count == 12) {
          Get.offNamedUntil(AppRoutes.signInScreen, (route) => false);

        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 17.h, top: 5.v, bottom: 5.v),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal.shade50,
              child: CustomImageView(
                svgPath: imagePath, //ImageConstant.imgFrame5,
                height: 22.adaptSize,
                width: 22.adaptSize,
                color: Colors.black,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 2.v,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                title,
                style: CustomTextStyles.headlineSmallMedium1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}