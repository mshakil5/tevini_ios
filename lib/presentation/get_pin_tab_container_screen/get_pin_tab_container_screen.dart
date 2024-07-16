import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/get_pin_tab_container_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/get_pin_page/get_pin_page.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class GetPinTabContainerScreen extends GetWidget<GetPinTabContainerController> {
  const GetPinTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
            leadingWidth: 43.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgFrameGray900,
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_order_a_card".tr)),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      height: 28.v,
                      width: 219.h,
                      margin: EdgeInsets.only(top: 23.v, right: 15.h),
                      child: TabBar(
                          controller: controller.tabviewController,
                          labelPadding: EdgeInsets.zero,
                          labelColor: appTheme.black900.withOpacity(0.2),
                          labelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Darker Grotesque',
                              fontWeight: FontWeight.w500),
                          unselectedLabelColor:
                              appTheme.black900.withOpacity(0.2),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Darker Grotesque',
                              fontWeight: FontWeight.w500),
                          indicator: BoxDecoration(
                              color: appTheme.green600,
                              borderRadius: BorderRadius.circular(6.h)),
                          tabs: [
                            Tab(child: Text("msg_order_card_details".tr)),
                            Tab(child: Text("lbl_get_pin".tr))
                          ])),
                  SizedBox(
                      height: 806.v,
                      child: TabBarView(
                          controller: controller.tabviewController,
                          children: [GetPinPage(), GetPinPage()]))
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
