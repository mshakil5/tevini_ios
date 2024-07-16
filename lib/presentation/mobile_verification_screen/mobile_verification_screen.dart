import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/mobile_verification_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MobileVerificationScreen extends GetWidget<MobileVerificationController> {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
            leadingWidth: 43.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgFrameGray900,
                margin: EdgeInsets.only(left: 19.h, bottom: 1.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "msg_mobile_verification".tr)),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 23.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("msg_mobile_verification".tr,
                      style: theme.textTheme.headlineSmall),
                  Container(
                      width: 351.h,
                      margin: EdgeInsets.only(top: 16.v, right: 38.h),
                      child: Text("msg_input_the_code_we".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumRed500
                              .copyWith(height: 1.44))),
                  SizedBox(height: 16.v),
                  Text("lbl_code".tr, style: theme.textTheme.titleMedium),
                  SizedBox(height: 3.v),
                  CustomTextFormField(
                      controller: controller.codeoneController,
                      hintText: "lbl_code".tr,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 24.v),
                  Row(children: [
                    CustomOutlinedButton(
                        decoration: BoxDecoration(color:  theme.colorScheme.error,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                        width: 100.h, text: "lbl_submit".tr),
                    CustomElevatedButton(
                        height: 35.v,
                        width: 108.h,
                        text: "lbl_re_send".tr,
                        margin: EdgeInsets.only(left: 16.h),
                        buttonStyle: CustomButtonStyles.fillOnError,
                        buttonTextStyle: theme.textTheme.titleSmall!)
                  ]),
                  SizedBox(height: 5.v)
                ])));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
