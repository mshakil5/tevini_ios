import 'controller/change_card_status_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ChangeCardStatusScreen extends GetWidget<ChangeCardStatusController> {
  const ChangeCardStatusScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:
        CustomAppBar(
            height: 40,
            leadingWidth: 40,
            leading: AppbarImage(
                svgPath: ImageConstant.imgFrameGray900,
                margin: EdgeInsets.only(left: 19.h, bottom: 2.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "msg_change_card_status".tr)),
     /*   CustomAppBar(
            height: 26.v,
            leadingWidth: 43.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleft,
                margin: EdgeInsets.only(left: 19.h, bottom: 2.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "msg_change_card_status".tr)),*/
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 23.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("msg_change_card_status".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 12.v),
                  Text("lbl_status".tr, style: theme.textTheme.titleMedium),
                  SizedBox(height: 3.v),
                  CustomTextFormField(
                      controller: controller.selectController,
                      hintText: "lbl_select".tr,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 7.v),
                  Text("msg_status_updated_to".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 21.v),
                  CustomOutlinedButton(
                      decoration: BoxDecoration(color:  theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                      ),
                      width: 100.h, text: "lbl_submit".tr),
                  SizedBox(height: 5.v)
                ])),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
