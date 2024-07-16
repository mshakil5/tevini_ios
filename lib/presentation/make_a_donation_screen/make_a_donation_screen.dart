import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/make_a_donation_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_checkbox_button.dart';
import 'package:tenvini/widgets/custom_drop_down.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MakeADonationScreen extends GetWidget<MakeADonationController> {
  const MakeADonationScreen({Key? key}) : super(key: key);

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
            title: AppbarTitle(text: "lbl_make_a_donation".tr)),
        body:
        Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 25.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("msg_make_a_donation_standing".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 11.v),
                  Text("lbl_account_balance".tr,
                      style: theme.textTheme.titleLarge),
                  Text("lbl_0_00_gbp".tr,
                      style: theme.textTheme.displaySmall),
                  SizedBox(height: 13.v),
                  Text("lbl_beneficiary".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 2.v),
                  CustomDropDown(
                      icon: Container(
                          margin:
                              EdgeInsets.fromLTRB(30.h, 12.v, 10.h, 12.v),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdown)),
                      hintText: "msg_select_an_option".tr,
                    //  items: controller.makeADonationModelObj.value,
                      onChanged: (value) {
                       // controller.onSelected(value);
                      }),
                  SizedBox(height: 18.v),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_amount".tr,
                                          style:
                                              theme.textTheme.titleMedium),
                                      SizedBox(height: 3.v),
                                      CustomTextFormField(
                                          controller:
                                              controller.amountController,
                                          hintText: "lbl_00_00".tr)
                                    ]))),
                        Padding(
                            padding: EdgeInsets.only(left: 16.h, top: 32.v),
                            child: Text("lbl_gbp".tr,
                                style:
                                    CustomTextStyles.headlineSmallMedium))
                      ]),
                  SizedBox(height: 15.v),
                  Obx(() => CustomCheckboxButton(
                      text: "msg_make_this_an_anonymous".tr,
                      value: controller.makethisananony.value,
                      onChange: (value) {
                        controller.makethisananony.value = value;
                      })),
                  SizedBox(height: 17.v),
                  SizedBox(
                      width: 385.h,
                      child: Text("msg_please_note_that".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium!
                              .copyWith(height: 1.44))),
                  SizedBox(height: 19.v),
                  Obx(() => CustomCheckboxButton(
                      text: "msg_set_up_a_standing".tr,
                      value: controller.setupastandingo.value,
                      onChange: (value) {
                        controller.setupastandingo.value = value;
                      })),
                  SizedBox(height: 13.v),
                  Obx(() => CustomCheckboxButton(
                      text: "msg_i_confirm_that_this".tr,
                      isExpandedText: true,
                      value: controller.iconfirmthatthi.value,
                      onChange: (value) {
                        controller.iconfirmthatthi.value = value;
                      })),
                  SizedBox(height: 20.v),
                  Text("msg_notes_to_charity".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 2.v),
                  CustomTextFormField(
                      controller: controller.frameOneController,
                      hintText: "msg_write_your_notes".tr,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 23.v)),
                  SizedBox(height: 19.v),
                  Text("lbl_my_notes".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 2.v),
                  CustomTextFormField(
                      controller: controller.writeyourController,
                      hintText: "msg_write_your_notes2".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 23.v)),
                  SizedBox(height: 24.v),
                  CustomOutlinedButton(
                      decoration: BoxDecoration(color:  theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                      ),
                      width: 153.h, text: "lbl_make_a_donation".tr),
                  SizedBox(height: 5.v)
                ])),
    );
  }

  onTapArrowleftone() {
    Get.back();
  }
}
