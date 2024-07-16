import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/order_a_card_one_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class OrderACardOneScreen extends GetWidget<OrderACardOneController> {
  OrderACardOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    SideMenuController drawerController = Get.put(SideMenuController());
    return Scaffold(
      key: _formKey,
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
            title: AppbarTitle(text: "msg_update_card_holder2".tr)),
        body: Form(
            key: _formKey,
            child: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 19.h, vertical: 23.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_first_name".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.firstNameController,
                          hintText: "lbl_shakil".tr),
                      SizedBox(height: 18.v),
                      Text("lbl_last_name".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.lastNameController,
                          hintText: "lbl_muhammad".tr),
                      SizedBox(height: 18.v),
                      Text("lbl_email".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.emailController,
                          hintText: "msg_kazimushakil0123_gmail_com".tr,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          }),
                      SizedBox(height: 18.v),
                      Text("lbl_mobile".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.frameOneController,
                          hintText: "msg_440125845866452".tr),
                      SizedBox(height: 18.v),
                      Text("lbl_date_of_birth".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 7.v),
                          decoration: AppDecoration.fillTeal.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.roundedBorder4),
                          child: Text("lbl_07_30_2023".tr,
                              style: CustomTextStyles.labelLargeGray900)),
                      SizedBox(height: 18.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_house_number".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 3.v),
                                          CustomTextFormField(
                                              width: 185.h,
                                              controller:
                                                  controller.aController,
                                              hintText: "lbl_5a".tr)
                                        ]))),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_city".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 2.v),
                                          CustomTextFormField(
                                              width: 185.h,
                                              controller:
                                                  controller.cityController,
                                              hintText: "lbl_london".tr)
                                        ])))
                          ]),
                      SizedBox(height: 18.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_post_code".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 3.v),
                                          CustomTextFormField(
                                              width: 185.h,
                                              controller: controller
                                                  .n156ppController,
                                              hintText: "lbl_n15_6pp".tr)
                                        ]))),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_country".tr,
                                              style: theme
                                                  .textTheme.titleMedium),
                                          SizedBox(height: 2.v),
                                          CustomTextFormField(
                                              width: 185.h,
                                              controller: controller
                                                  .countryController,
                                              hintText: "lbl_england".tr)
                                        ])))
                          ]),
                      SizedBox(height: 18.v),
                      Text("lbl_address".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.addressController,
                          hintText: "msg_holmdale_terrace".tr,
                          textInputAction: TextInputAction.done),
                      SizedBox(height: 24.v),
                      CustomOutlinedButton(
                          decoration: BoxDecoration(color:  theme.colorScheme.error,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          width: 100.h, text: "lbl_submit".tr),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
