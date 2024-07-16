



import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

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

import '../../../core/values/app_space.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../main.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../side_menu_draweritem/controller/side_menu_controller.dart';
import '../../side_menu_draweritem/side_menu_draweritem.dart';
import '../controllers/donor_change_password_controller.dart';

class DonorChangePasswordView extends GetView<DonorChangePasswordController> {
  SideMenuController drawerController = Get.put(SideMenuController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');

  @override
  Widget build(BuildContext context) {


    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        drawer: SideMenuDraweritem(),
        appBar:  CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              print('HomePage.build');
              _scaffoldKey.currentState?.openDrawer();
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
                    /*   Text('Acc N: 10101010',style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),*/
/*
                  CircleAvatar(
                    radius: 14,
                    child:Icon(Icons.person,size: 18,),),*/
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
              /*   Stack(
            alignment: Alignment.bottomRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgUserimage,
                height: 30.adaptSize,
                width: 30.adaptSize,
                radius: BorderRadius.circular(
                  15.h,
                ),
                alignment: Alignment.center,
              ),
              CustomImageView(
                svgPath: ImageConstant.imgCheckmark,
                height: 9.adaptSize,
                width: 9.adaptSize,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  left: 21.h,
                  top: 21.v,
                ),
              ),
            ],
          ),*/
            ),
          ],
        ),
        body:
        Form(
          // key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSpace.spaceH10,
                InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,)),

                AppSpace.spaceH10,

                AppSpace.spaceH10,
                Text(
                  "New Password",
                  style: theme.textTheme.titleMedium,
                ),
                AppSpace.spaceH6,



                /*CustomTextFormField(
                  //    fillColor:Colors.teal.shade50,

                  // textStyle: TextStyle(fontSize: 16),

                  controller: controller.newPassController,
                  hintText: "New Password",
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),*/
                Obx(() => CustomTextFormField(
                    controller: controller.newPassController,
                    hintText: "New Password",
                    //textStyle: TextStyle(fontSize: 15),
                    //  hintStyle: CustomTextStyles.tithintBlackA700,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                      onTap: () {
                        controller.isShowPassword.value = !controller.isShowPassword.value;
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            30.h, 11.v, 10.h, 11.v),
                        child:  controller.isShowPassword.value? Icon(Icons.visibility_off):Icon(Icons.visibility)

                        /*   CustomImageView(
                                                  svgPath: controller
                                                          .isShowPassword.value
                                                      ? ImageConstant.imgEye
                                                      : ImageConstant.imgEye)*/,
                      ),),
                    suffixConstraints:
                    BoxConstraints(maxHeight: 36.v),
                    validator: (value) {
                      if (value == null
                      //    || (!isValidPassword(value, isRequired: true))
                      ) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    obscureText:
                    controller.isShowPassword.value,
                    contentPadding: EdgeInsets.only(
                        left: 10.h, top: 9.v, bottom: 9.v))),

                AppSpace.spaceH10,
                Text(
                  "Confirm Password",
                  style: theme.textTheme.titleMedium,
                ),
                AppSpace.spaceH6,
                /*CustomTextFormField(

                  // textStyle: TextStyle(fontSize: 16),

                  controller: controller.confirmPassController,
                  hintText: "Confirm Password",
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),*/
                Obx(() => CustomTextFormField(
                    controller: controller.confirmPassController,
                    hintText: "Confirm Password",
                    //textStyle: TextStyle(fontSize: 15),
                    //  hintStyle: CustomTextStyles.tithintBlackA700,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                      onTap: () {
                        controller.isShowPasswordConfirm.value = !controller.isShowPasswordConfirm.value;
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            30.h, 11.v, 10.h, 11.v),
                        child:  controller.isShowPasswordConfirm.value? Icon(Icons.visibility_off):Icon(Icons.visibility)

                        /*   CustomImageView(
                                                  svgPath: controller
                                                          .isShowPassword.value
                                                      ? ImageConstant.imgEye
                                                      : ImageConstant.imgEye)*/,
                      ),),
                    suffixConstraints:
                    BoxConstraints(maxHeight: 36.v),
                    validator: (value) {
                      if (value == null
                      //    || (!isValidPassword(value, isRequired: true))
                      ) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    obscureText: controller.isShowPasswordConfirm.value,
                    contentPadding: EdgeInsets.only(
                        left: 10.h, top: 9.v, bottom: 9.v))),

                AppSpace.spaceH20,
                InkWell(
                  onTap: () {

                    controller.changePasswordCtn();
                    /* controller.getRegularIncomeDetailsByIdView(
                          model.id.toString());*/
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.touch_app_outlined,
                            color: Colors.white),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Change Password  ',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                        10.h,
                      ),
                    ),
                    //  margin: EdgeInsets.only(left: 2.h, top: 10.v,bottom: 10.v),
                  ),
                ),
                /*CustomElevatedButton(
                      width: Get.width / 1.5,
                      text:  'Submit ',
                      onTap: () async{
                        print('DonorChangePasswordView.build');
                        controller.changePasswordCtn();
                      },
                      alignment: Alignment.bottomCenter),
*/
              ],
            ),
          ),
        )

      // })




    );

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