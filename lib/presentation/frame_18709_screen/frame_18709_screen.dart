import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/frame_18709_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Frame18709Screen extends GetWidget<Frame18709Controller> {
  const Frame18709Screen({Key? key})
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
        title: AppbarSubtitle1(
          text: "lbl_income_amount".tr,
          margin: EdgeInsets.only(left: 16.h),
        ),
        actions: [
          AppbarSubtitle(
            text: "lbl_status".tr,
            margin: EdgeInsets.only(
              left: 11.h,
              top: 8.v,
              right: 4.h,
            ),
          ),
          AppbarSubtitle(
            text: "lbl_action".tr,
            margin: EdgeInsets.only(
              left: 48.h,
              top: 8.v,
              right: 15.h,
            ),
          ),
        ],
        styleType: Style.bgFill,
      ),
      body: SizedBox(
        width: 272.h,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
            SizedBox(height: 8.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_250".tr,
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
          left: 48.h,
          right: 8.h,
          bottom: 5.v,
        ),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text(
                "lbl_250".tr,
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
