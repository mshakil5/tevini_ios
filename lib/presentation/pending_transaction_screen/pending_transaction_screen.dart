import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/pending_transaction_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_icon_button.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class PendingTransactionScreen extends GetWidget<PendingTransactionController> {
  const PendingTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    SideMenuController drawerController = Get.put(SideMenuController());
    return Scaffold(
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
            leadingWidth: 43.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgFrameGray900,
                margin: EdgeInsets.only(left: 19.h, bottom: 1.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            title: Container(
                height: 25.580002.v,
                width: 172.5.h,
                margin: EdgeInsets.only(left: 52.h),
                child: Stack(alignment: Alignment.topLeft, children: [
                  AppbarTitle(
                      text: "msg_view_transactions".tr,
                      margin: EdgeInsets.only(left: 63.h, top: 3.v)),
                  AppbarSubtitle2(
                      text: "msg_pending_transaction".tr,
                      margin: EdgeInsets.only(right: 99.h, bottom: 14.v))
                ]))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 23.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text("msg_view_transactions".tr,
                          style: theme.textTheme.headlineSmall)),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h, top: 22.v),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_date_from".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 3.v),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h,
                                                  vertical: 6.v),
                                              decoration: AppDecoration
                                                  .fillTeal
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5.v),
                                                        child: Text(
                                                            "lbl_mm_dd_yyyy"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelLargeGray900)),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcoutlinedaterange,
                                                        height:
                                                            16.adaptSize,
                                                        width: 16.adaptSize,
                                                        margin:
                                                            EdgeInsets.only(
                                                                left: 92.h,
                                                                top: 3.v,
                                                                bottom:
                                                                    3.v))
                                                  ]))
                                        ]))),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_date_to".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 3.v),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h,
                                                  vertical: 6.v),
                                              decoration: AppDecoration
                                                  .fillTeal
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5.v),
                                                        child: Text(
                                                            "lbl_mm_dd_yyyy"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelLargeGray900)),
                                                    InkWell(
                                                      onTap: ()async{
                                                        final DateTime? date = await showDatePicker(
                                                          builder: (context, child) {
                                                            return Theme(
                                                              data: Theme.of(context).copyWith(
                                                                colorScheme: ColorScheme.light(
                                                                  primary: Colors.teal, // header background color
                                                                  onPrimary: Colors.black, // header text color
                                                                  onSurface: Colors.black,

                                                                ),
                                                                textButtonTheme: TextButtonThemeData(
                                                                  style: TextButton.styleFrom(
                                                                    textStyle:TextStyle(fontSize: 16),
                                                                    //fixedSize: Size.square(14.3),
                                                                    foregroundColor: Colors.teal, // button text color
                                                                  ),
                                                                ),
                                                              ),
                                                              child: child!,
                                                            );
                                                          },
                                                          barrierColor: Colors.teal.withOpacity(0.8),
                                                          context: context,
                                                         // initialDate: startDate.value,
                                                          firstDate: DateTime(2000),
                                                          lastDate: DateTime(2050),
                                                        );
                                                        if (date != null) {
                                                          /* setState(() {
        _countryArrivalDateController.text = getDate(date);
        });*/
                                                        }
                                                      },
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgIcoutlinedaterange,
                                                          height:
                                                              16.adaptSize,
                                                          width: 16.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 92.h,
                                                                  top: 3.v,
                                                                  bottom:
                                                                      3.v)),
                                                    )
                                                  ]))
                                        ])))
                          ])),
                  CustomOutlinedButton(
                      decoration: BoxDecoration(color:  theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                      ),
                      width: 101.h,
                      text: "lbl_search".tr,
                      margin: EdgeInsets.only(left: 2.h, top: 24.v)),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomOutlinedButton(
                                height: 24.v,
                                width: 38.h,
                                text: "lbl_copy".tr,
                                buttonStyle: CustomButtonStyles
                                    .outlineOnPrimaryContainer,
                                buttonTextStyle: CustomTextStyles
                                    .labelLargeErrorContainerSemiBold),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.h, vertical: 1.v),
                                decoration:
                                    AppDecoration.outlineOnPrimaryContainer,
                                child: Text("lbl_excel".tr,
                                    style: CustomTextStyles
                                        .labelLargeErrorContainerSemiBold)),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.h, vertical: 1.v),
                                decoration:
                                    AppDecoration.outlineOnPrimaryContainer,
                                child: Text("lbl_pdf".tr,
                                    style: CustomTextStyles
                                        .labelLargeErrorContainerSemiBold)),
                            CustomOutlinedButton(
                                height: 24.v,
                                width: 36.h,
                                text: "lbl_print".tr,
                                buttonStyle: CustomButtonStyles
                                    .outlineOnPrimaryContainerLR4,
                                buttonTextStyle: CustomTextStyles
                                    .labelLargeErrorContainerSemiBold)
                          ])),
                  Container(
                      height: 34.v,
                      width: 392.h,
                      margin: EdgeInsets.only(left: 2.h, top: 24.v),
                      child:
                          Stack(alignment: Alignment.centerLeft, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 92.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.h,
                                              vertical: 7.v),
                                          decoration:
                                              AppDecoration.outlineWhiteA,
                                          child: Text("lbl_money_in".tr,
                                              style: theme
                                                  .textTheme.labelMedium)),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 2.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 27.h,
                                              vertical: 7.v),
                                          decoration:
                                              AppDecoration.outlineWhiteA,
                                          child: Text("lbl_money_out".tr,
                                              style: theme
                                                  .textTheme.labelMedium))
                                    ]))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 21.h, vertical: 8.v),
                                decoration: AppDecoration.outlineWhiteA,
                                child: Text("lbl_all_transaction".tr,
                                    style: theme.textTheme.labelMedium))),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 7.v),
                                decoration: AppDecoration.fillOnError,
                                child: Text("msg_pending_transaction".tr,
                                    style: CustomTextStyles
                                        .labelMediumWhiteA700)))
                      ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h, top: 24.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 3.v),
                      decoration: AppDecoration.fillOnError,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 4.v, bottom: 1.v),
                                child: Text("lbl_date".tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                                padding: EdgeInsets.only(top: 4.v),
                                child: Text("lbl_description".tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 4.v, bottom: 1.v),
                                child: Text("lbl_voucher_no".tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 4.v, bottom: 1.v),
                                child: Text("lbl_amount".tr,
                                    style: theme.textTheme.titleSmall))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 2.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 5.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_08_01_2023".tr,
                                    style: theme.textTheme.labelLarge)),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, top: 3.v),
                                child: Text("lbl_transaction".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 3.v),
                                child: Text("lbl_25452325".tr,
                                    style: theme.textTheme.labelLarge)),
                            Spacer(flex: 59),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 3.v, right: 5.h),
                                child: Text("lbl_10_20".tr,
                                    style:
                                        CustomTextStyles.labelLargeGray900))
                          ])),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(58.h, 24.v, 58.h, 5.v),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                    height: 32.adaptSize,
                                    width: 32.adaptSize,
                                    padding: EdgeInsets.all(11.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowleftPrimarycontainer)),
                                Container(
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 5.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: Text("lbl_1".tr,
                                        style: CustomTextStyles
                                            .labelLargeWhiteA700)),
                                Container(
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 5.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer1
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: Text("lbl_2".tr,
                                        style: CustomTextStyles
                                            .labelLargePrimaryContainer)),
                                Container(
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 5.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer1
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: Text("lbl_3".tr,
                                        style: CustomTextStyles
                                            .labelLargePrimaryContainer)),
                                Container(
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 3.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer1
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: Text("lbl".tr,
                                        style: CustomTextStyles
                                            .labelLargePrimaryContainer)),
                                Container(
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 5.v),
                                    decoration: AppDecoration
                                        .outlinePrimaryContainer1
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: Text("lbl_08".tr,
                                        style: CustomTextStyles
                                            .labelLargePrimaryContainer)),
                                CustomIconButton(
                                    height: 32.adaptSize,
                                    width: 32.adaptSize,
                                    margin: EdgeInsets.only(left: 6.h),
                                    padding: EdgeInsets.all(11.h),
                                    child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowright))
                              ])))
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
