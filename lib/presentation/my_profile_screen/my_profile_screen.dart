import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'dart:io';
import '../../data/models/address_model.dart';
import '../../data/models/home/dropdown_model.dart';
import '../../data/models/user_profile_model.dart';
import '../../main.dart';
import '../../widgets/custom_elevated_button.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/my_profile_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/presentation/home_page/home_page.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_image_1.dart';
import 'package:tenvini/widgets/app_bar/appbar_searchview_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_bottom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends GetView<MyProfileController> {
   String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');

  @override
  Widget build(BuildContext context) {

    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: controller.profileScaffold,
      drawer: SideMenuDraweritem(),
      appBar:  CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            controller.profileScaffold.currentState?.openDrawer();
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
        actions: [
          Container(

              margin: EdgeInsets.symmetric(horizontal: 10),
              child:  Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Text(name.toString(),style: TextStyle(color: Colors.white),),
                ],
              )
          ),
        ],
      ),
      body: Obx((){
            ProfileInfoModel userProfile= controller.profile.value;
            String profileImagePath=userProfile.photo.toString();

          return  Form(
              // key: controller.profileKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 2.v,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      AppSpace.spaceH6,
                      SizedBox(
                        height: 126.v,
                        width: 120.h,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                  
                            Obx(() => controller.profileImagePath.value.isEmpty
                                ?  CircleAvatar(
                        radius:100,
                        backgroundColor: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomImageView(
                            placeHolder: ImageConstant.imgHolder,
                            url: ImageConstant.imageProfilePath+'${profileImagePath}',
                            //    imagePath: ImageConstant.imgImage14,
                            height: 110.v,
                            width: 110.h,
                            alignment: Alignment.center,
                          ),
                        ),
                      )
                                :  CircleAvatar(
                        radius:100,
                        backgroundColor: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.file(File(controller.profileImagePath.value),height: 110.v,width: 110.h,alignment: Alignment.center,)),
                        ),
                      ),
                  
                            //Image.file(File(controller.profileImagePath.value))),
                  
                    /*        CircleAvatar(
                        radius:100,
                              backgroundColor: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomImageView(
                                  placeHolder: ImageConstant.imgHolder,
                                  url: ImageConstant.imageProfilePath+'${profileImagePath}',
                          //    imagePath: ImageConstant.imgImage14,
                                  height: 110.v,
                                  width: 110.h,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),*/
                            CustomImageView(
                              onTap: (){
                                showModalBottomSheet(
                  
                                  barrierColor: Colors.teal.withOpacity(0.5),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      child: Wrap(
                                        children: <Widget>[
                                         /* ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Take Photo'),
                                            onTap: () => controller.pickImage(ImageSource.camera),
                                          ),*/
                                          ListTile(
                  
                                            leading: Icon(Icons.image),
                                            title: Text('Choose from Gallery',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
                                            trailing: Icon(Icons.touch_app_outlined),
                                            onTap: () =>controller. pickImage(ImageSource.gallery),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                print('MyProfileScreen.build Camera');
                            },
                              svgPath: ImageConstant.imgShare,
                              height: 25.adaptSize,
                              width: 30.adaptSize,
                            ),
                          ],
                        ),
                      ),
                      AppSpace.spaceH10,

                      Padding(
                        padding: EdgeInsets.only(right: 0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 3.v),
                            personTitleDropDown(),
                          ],
                        ),
                      ),

                      AppSpace.spaceH10,
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
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: controller.isReadOnly.value,
                                   // textStyle: TextStyle(fontSize: 16),
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
                                    "lbl_surname".tr,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: controller.isReadOnly.value,
                                  //  textStyle: TextStyle(fontSize: 16),
                                    width: 185.h,
                                    controller: controller.surnameController,
                                    hintText: "lbl_surname".tr,
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
                        ],
                      ),
                      AppSpace.spaceH10,
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
                                    "lbl_phone".tr,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: controller.isReadOnly.value,
                                   // textStyle: TextStyle(fontSize: 16),
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_email".tr,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: true,
                                    //controller.isReadOnly.value,
                                  //  textStyle: TextStyle(fontSize: 16),
                                    width: 185.h,
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
                      AppSpace.spaceH10,



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
                        hintText: controller.profile.value.houseno.toString()??'',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "";
                          }
                          return null;
                        },
                      ):
                      FinderAddress(controller:controller,),
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

                      /// old Skip

                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_house_number".tr,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: controller.isReadOnly.value,
                                  //  textStyle: TextStyle(fontSize: 16),
                                    width: 185.h,
                                    controller: controller.housenumberController,
                                    hintText: "lbl_house_number".tr,
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
                                    "lbl_street".tr,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    fillColor: controller.isReadOnly.value ?Colors.teal.shade50:Colors.white10,
                                    isReadOnly: controller.isReadOnly.value,
                                   // textStyle: TextStyle(fontSize: 16),
                                    width: 185.h,
                                    controller: controller.streetoneController,
                                    hintText: "lbl_street".tr,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                     */

                      AppSpace.spaceH10,
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
                     AppSpace.spaceH10,
                      CustomElevatedButton(
                  
                          width: Get.width / 1.5,
                          text:  controller.isReadOnly.value? ' Edit Profile': 'Update Profile',
                          onTap: () async{
                  
                  
                            if(controller.isReadOnly.value==true){
                              print('MyProfileScreen.build if  ${controller.isReadOnly.value}');
                              controller.isReadOnly.value=false;
                          }else{
                              await controller.updateUserProfileInfoUpdate();
                              controller.isReadOnly.value=true;
                            }
                  
                             // controller.isReadOnly.value=false;
                  
                            /* if (controller.formKey.currentState!.validate()) {
                        print('SignInController.signInTap');
                        controller.signInTap(context);
                        FocusManager.instance.primaryFocus?.unfocus();
                        FocusScope.of(context).unfocus();
                      }*/
                          },
                          alignment: Alignment.bottomCenter),
                     AppSpace.spaceH10,
                       CustomElevatedButton(
                  
                          width: Get.width / 1.5,
                          text:  'Change Password',
                          onTap: () async{
                            Get.toNamed(AppRoutes.donorChangePassword);
                          },
                          alignment: Alignment.bottomCenter),
                      AppSpace.spaceH20,

                      AppSpace.spaceH50,
                      AppSpace.spaceH50,
                      AppSpace.spaceH50,
                      AppSpace.spaceH50,



                    ],
                  ),
                ),
              ),
            );
          }),);




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

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }



  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      default:
        return DefaultWidget();
    }
  }



}

class FinderAddress extends StatelessWidget {
  MyProfileController controller;
   FinderAddress({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return datww();
  }
  datww(){
    return   FieldSuggestion<AddressModel>.network(
      inputDecoration: InputDecoration(

        fillColor: controller.isReadOnly.value ?
        Colors.teal.shade50 :Colors.white10,

        filled: true,


        hintText:  controller.profile.value.houseno??'',
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
    );

  }
}




