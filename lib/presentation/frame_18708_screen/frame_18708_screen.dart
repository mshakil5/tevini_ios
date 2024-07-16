import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/frame_18708_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Frame18708Screen extends GetWidget<Frame18708Controller> {
  const Frame18708Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 32.v,
        title: Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Row(
            children: [
              AppbarSubtitle1(
                text: "lbl_note".tr,
              ),
              AppbarSubtitle1(
                text: "lbl_amount".tr,
                margin: EdgeInsets.only(left: 48.h),
              ),
            ],
          ),
        ),
        actions: [
          AppbarSubtitle(
            text: "lbl_status".tr,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 8.v,
              right: 4.h,
            ),
          ),
          AppbarSubtitle(
            text: "lbl_action".tr,
            margin: EdgeInsets.only(
              left: 48.h,
              top: 8.v,
              right: 20.h,
            ),
          ),
        ],
        styleType: Style.bgFill,
      ),
      body: SizedBox(
        width: 307.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 1.h,
                bottom: 8.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrame18733,
                    height: 16.v,
                    width: 38.h,
                    margin: EdgeInsets.only(
                      left: 43.h,
                      top: 2.v,
                      bottom: 2.v,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 16.h,
          right: 13.h,
          bottom: 5.v,
        ),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text(
                "lbl_transaction".tr,
                style: theme.textTheme.labelLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 36.h,
                top: 1.v,
              ),
              child: Text(
                "lbl_no".tr,
                style: theme.textTheme.labelLarge,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text(
                "lbl_confirm".tr,
                style: CustomTextStyles.labelLargeGreen600,
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgFrame18733,
              height: 16.v,
              width: 38.h,
              margin: EdgeInsets.only(
                left: 43.h,
                bottom: 2.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
