import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/card_activation_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_checkbox_button.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CardActivationScreen extends GetWidget<CardActivationController> {
  CardActivationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,

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
            title: AppbarTitle(text: "lbl_card_activation".tr)),
        body: Form(
            key: _formKey,
            child: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 19.h, vertical: 23.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_card_activation".tr,
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 14.v),
                      Text("lbl_card_name".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.nameController,
                          hintText: "msg_card_display_name".tr,
                          validator: (value) {
                            if (!isText(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          }),
                      SizedBox(height: 18.v),
                      Text("lbl_card_number".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                          controller: controller.cardNumberController,
                          hintText: "lbl_pan".tr,
                          textInputAction: TextInputAction.done),
                      Obx(() => CustomCheckboxButton(
                          text: "msg_i_have_read_and".tr,
                          value: controller.ihavereadandacc.value,
                          margin: EdgeInsets.only(top: 19.v, right: 19.h),
                          onChange: (value) {
                            controller.ihavereadandacc.value = value;
                          })),
                      SizedBox(height: 21.v),
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

  onTapArrowleftone() {
    Get.back();
  }

}
