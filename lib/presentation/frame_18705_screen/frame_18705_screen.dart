import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/frame_18705_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Frame18705Screen extends GetWidget<Frame18705Controller> {
  const Frame18705Screen({Key? key})
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
                text: "lbl_standing_order".tr,
              ),
              AppbarSubtitle1(
                text: "lbl_charity_note".tr,
                margin: EdgeInsets.only(left: 48.h),
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
        width: 378.h,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
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
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
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
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "lbl_no".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 33.h,
                      top: 3.v,
                    ),
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
                  Spacer(
                    flex: 57,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
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
          left: 46.h,
          right: 14.h,
          bottom: 5.v,
        ),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Spacer(
              flex: 57,
            ),
            Text(
              "lbl_confirm".tr,
              style: CustomTextStyles.labelLargeGreen600,
            ),
          ],
        ),
      ),
    );
  }
}
