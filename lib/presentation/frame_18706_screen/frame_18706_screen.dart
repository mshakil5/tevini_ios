import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/frame_18706_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Frame18706Screen extends GetWidget<Frame18706Controller> {
  const Frame18706Screen({Key? key})
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
                text: "lbl_start_date".tr,
                margin: EdgeInsets.only(bottom: 1.v),
              ),
              AppbarSubtitle1(
                text: "lbl_charity_note".tr,
                margin: EdgeInsets.only(
                  left: 48.h,
                  top: 1.v,
                ),
              ),
            ],
          ),
        ),
        actions: [
          AppbarSubtitle(
            text: "lbl_note".tr,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 8.v,
              right: 4.h,
            ),
          ),
          AppbarSubtitle(
            text: "lbl_view".tr,
            margin: EdgeInsets.only(
              left: 47.h,
              top: 8.v,
              right: 4.h,
            ),
          ),
          AppbarSubtitle(
            text: "lbl_status".tr,
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
        width: 426.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 42,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "msg_test_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 22.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 42,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "msg_test_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 22.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 67,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 1.h,
                bottom: 9.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 5.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_01_05_2023".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Spacer(
                    flex: 42,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "msg_test_transaction".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 22.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_view".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 49.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_confirm".tr,
                      style: CustomTextStyles.labelLargeGreen600,
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
          left: 15.h,
          right: 15.h,
          bottom: 5.v,
        ),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "lbl_01_05_2023".tr,
              style: theme.textTheme.labelLarge,
            ),
            Spacer(
              flex: 57,
            ),
            Text(
              "lbl_no".tr,
              style: theme.textTheme.labelLarge,
            ),
            Spacer(
              flex: 42,
            ),
            Text(
              "msg_test_transaction".tr,
              style: theme.textTheme.labelLarge,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.h),
              child: Text(
                "lbl_view".tr,
                style: theme.textTheme.labelLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 49.h),
              child: Text(
                "lbl_confirm".tr,
                style: CustomTextStyles.labelLargeGreen600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
