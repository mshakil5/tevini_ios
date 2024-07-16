/*
import '../card_activation_screen/card_activation_screen.dart';
import 'controller/order_a_card_controller.dart';
import 'models/order_a_card_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OrderACardPage extends StatelessWidget {
  OrderACardPage({Key? key}) : super(key: key);

  OrderACardController controller =
      Get.put(OrderACardController(OrderACardModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: mediaQueryData.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 20.v,
                  right: 15.h,
                ),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage1,
                      height: 223.v,
                      width: 398.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                    ),
                    SizedBox(height: 21.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_credit_profile_id".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_54".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_account_number".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_235223152151253".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_profile_name".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_shakil".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_available_balance".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_02".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_card_status".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          "lbl_ordered".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Text(
                            "lbl_last_updated".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Text(
                          "msg_2023_08_28_19_23_32".tr,
                          style: CustomTextStyles.titleLargeMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.v),
                    CustomElevatedButton(
                      onTap: () {
                        print('OrderACardPage.build');
                        Get.toNamed(AppRoutes.getPinAndChangeThePinScreen);
                      },
                      height: 40.v,
                      text: "lbl_card_activation".tr,
                      buttonStyle: CustomButtonStyles.fillGreen,
                      buttonTextStyle: CustomTextStyles.titleMediumBlack900,
                    ),
                    SizedBox(height: 20.v),
                    SizedBox(
                      width: 398.h,
                      child: Text(
                        "msg_the_tevini_prepaid".tr,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: CustomTextStyles.titleMediumMedium_2.copyWith(
                          height: 1.44,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../main.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/order_a_card_controller.dart';

class OrderACardPage extends GetView<OrderACardController> {

  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> orderACardKeyGlobalKey =
      new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? address = localStoreSRF.getString('address');
  String? userProfile = localStoreSRF.getString('userProfile');

  @override
  Widget build(BuildContext context) {

    var webViewCont = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..runJavaScript('window.scrollTo(0, 300)')
      ..scrollTo(0, 400)
      ..getScrollPosition()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            controller.isLoading.value = true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith('https://www.tevini.co.uk/user/card-service')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.tevini.co.uk/user/card-service'));

    /// IOS

    return Scaffold(
        key: orderACardKeyGlobalKey,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              orderACardKeyGlobalKey.currentState?.openDrawer();
            },
            margin: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              right: 0.v,
              bottom: 11.v,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Acc No: $accNo',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CustomImageView(
                        placeHolder: ImageConstant.imgHolder,
                        url: ImageConstant.imageProfilePath + '${userProfile}',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Text(
                    name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
              color: Colors.orangeAccent.shade100.withOpacity(0.2),
              margin: EdgeInsets.symmetric(vertical: 0),
              child: Obx(() => controller.isLoading.value == true
                  ? WebViewWidget(controller: webViewCont)
                  : Center(
                      child: CircularProgressIndicator(),
                    ))),
        ));
  }
}
