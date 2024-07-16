import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/get_pin_and_change_the_pin_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class GetPinAndChangeThePinScreen
    extends GetWidget<GetPinAndChangeThePinController> {
  const GetPinAndChangeThePinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
            height: 26.v,
            leadingWidth: 43.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgFrameGray900,
                margin: EdgeInsets.only(left: 19.h, bottom: 2.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "msg_get_pin_and_change".tr)),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 23.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("msg_get_pin_and_change".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 6.v),
                  Text("msg_click_eye_button".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 16.v),
                  Text("msg_pin_maximum_4_digit".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 2.v),
                  CustomTextFormField(
                      controller: controller.pinController,
                      hintText: "lbl_pin".tr),
                  SizedBox(height: 18.v),
                  Text("lbl_card_number".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 3.v),
                  CustomTextFormField(
                      controller: controller.cardNumberController,
                      hintText: "lbl_pan".tr,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 24.v),
                  CustomOutlinedButton(
                    onTap: (){
                      //Get.toNamed(AppRoutes.ChangeCardStatusScreen);
                      Get.toNamed(AppRoutes.changeCardStatusScreen);
                    },
                      decoration: BoxDecoration(color:  theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                      ),
                      width: 100.h, text: "lbl_submit".tr),
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
