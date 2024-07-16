import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/values/app_space.dart';
import '../../data/models/home/dropdown_model.dart';
import '../../main.dart';
import '../../widgets/custom_checkbox_button.dart';
import 'controller/sign_in_controller.dart';
import 'package:tenvini/core/app_export.dart';

import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends GetWidget<SignInController> {
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:

      SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [

              SizedBox(
                  height: 670.v,
                  width: double.maxFinite,
                  child:
                  Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 146.h, vertical: 120.v),
                            decoration: AppDecoration.fillPrimary,
                            child: CustomImageView(
                                color: Colors.white,
                                imagePath: ImageConstant.imgNewlogo12,
                                height: 41.v,
                                width: 136.h))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 28.h, right: 28.h, bottom: 10.v, top: 10.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.h, vertical: 10.v),
                            decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder12),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Welcome",
                                          style: theme.textTheme.headlineMedium)),
                                  Text("Log in",
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 10.v),
                                  donationPercentageDropDown(context),
                                  SizedBox(height: 5.v),
                                  Text("lbl_email".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 3.v),
                                  CustomTextFormField(
                                    //textStyle: TextStyle(fontSize: 15),
                                    controller: controller.emailController,
                                    hintText: "msg_enter_your_email".tr,
                                    hintStyle:
                                        CustomTextStyles.labelLargeErrorContainer,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {

                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18.v),
                                  Text("lbl_password".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 3.v),
                                  Obx(() => CustomTextFormField(
                                      controller: controller.passwordController,
                                      hintText: "lbl_password".tr,
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

                                  /// Login Remember Me
                                 Align(
                                   alignment: Alignment.centerRight,
                                   child:
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Expanded(
                                         child:
                                         Obx(
                                               () => CustomCheckboxButton(
                                             //text: "msg_set_up_a_standing".tr,
                                             value: controller.isLoginRememberMe.value,
                                             onChange: (value) async{
                                               /// role 1 =Donor  // 2 =charity
                                             String role =controller.chooseYourLoginRole.value!.itemValue;
                                             await localStoreSRF.setString('loginRole', role);
                                               print('MakeADonationOneScreen.build >>> ${value}');
                                               if(controller.isLoginRememberMe.value==true){
                                                 /// Store Data Remember status
                                                 await localStoreSRF.setBool('loginRememberStatus', false);
                                                 controller.isLoginRememberMe.value = false;
                                               }else{

                                                 await localStoreSRF.setBool('loginRememberStatus', true);

                                                 controller.isLoginRememberMe.value = true;

                                               }

                                               print('ck ');
                                               print(localStoreSRF.getBool('loginRememberStatus'));
                                              },
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 8,
                                         child: Column(
                                           mainAxisSize: MainAxisSize.max,
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                               "Remember me ",
                                               style: CustomTextStyles
                                                   .labelLargeTear500,
                                             ),

                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),

                                  AppSpace.spaceH10,
                                  InkWell(
                                    onTap: () {

                                      FocusManager.instance.primaryFocus?.unfocus();
                                      Get.toNamed(AppRoutes.forget_password);
                                    },
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("msg_forgot_your_password".tr,
                                            style: CustomTextStyles
                                                .labelLargeTear500)),
                                  ),
                                  SizedBox(height: 67.v)
                                ]))),
                    CustomElevatedButton(
                        width: Get.width / 1.5,
                        text: "lbl_sign_in".tr,
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            print('SignInController.signInTap');
                            controller.signInTap(context);
                            FocusManager.instance.primaryFocus?.unfocus();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        alignment: Alignment.bottomCenter)
                  ])),
              AppSpace.spaceH14,
             /*  Text("lbl_or".tr,
                  style: CustomTextStyles.titleMediumPrimaryContainer),
              AppSpace.spaceH6,
              InkWell(
                onTap: () {

                 controller.roleChangeSignUp() ;
                },
                child: Text("msg_apply_for_an_account".tr,
                    style: CustomTextStyles.titleMediumPrimaryContainer),
              ),
              AppSpace.spaceH6,*/
            ]),
          ),
        ),
      ),
    );
  }


  /// Login Play role
  donationPercentageDropDown(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,

              border: Border.all(color: Colors.grey.shade200)
              //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
              ),
          child: DropdownButtonHideUnderline(
            child:
            new Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child:
            DropdownButton<DropdownModel?>(

              hint: const Text('Please Select'),
              value: controller.chooseYourLoginRole.value,
              isExpanded: true,
              items: controller.chooseYourLoginRoleDropDownList.value
                  .map((e) => DropdownMenuItem<DropdownModel>(
                      value: e, child: Text(e.itemText,)))
                  .toList(),
              onChanged: (v) {
                controller.chooseYourLoginRole.value = v;
              },
            ),
          ),),
        ));
    //);
  }
}
