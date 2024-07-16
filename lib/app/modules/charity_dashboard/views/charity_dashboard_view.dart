import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/values/app_space.dart';

import '../../../../main.dart';
import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../widgets/app_bar/appbar_image.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_outlined_button.dart';
import '../controllers/charity_dashboard_controller.dart';

class CharityDashboardView extends GetView<CharityDashboardController> {
  final GlobalKey<ScaffoldState> charityKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String? name = localStoreSRF.getString('name');
    String? accNo = localStoreSRF.getString('accNo');
    String? balance = localStoreSRF.getString('balance');
    String? id = localStoreSRF.getString('id');
    String? userProfile = localStoreSRF.getString('userProfile');

    return Scaffold(
      key: charityKey,
      drawer: charity_drawer(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('CharityDashboardView.build');
            charityKey.currentState?.openDrawer();

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
          InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.charityProfile);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:12,
                      backgroundColor: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomImageView(
                          placeHolder: ImageConstant.imgHolder,
                          url: ImageConstant.imageProfilePath+'${userProfile}',
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Text(
                      name.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
      body:  Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: 5, horizontal: 15),
          //decoration: AppDecoration.fillPrimary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, ${name}",
                style: CustomTextStyles.titleLargeBlackA700,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_account_balance".tr,
                   style: CustomTextStyles.titleLargeBlackA700,
                  ),

                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        balance.toString()+' GBP',
                        style: CustomTextStyles.displaySmallBlackA700,
                      ),

                      Obx(() => Text("Pending Balance: ${ controller.pendingTransaction.value.toString() } GBP",style: CustomTextStyles.headlineSmallMedium,),)
                      
                    ],
                  ),

                ],
              ),


              AppSpace.spaceH20,
              CustomOutlinedButton(
                width: 200,

                buttonStyle: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.teal)),
                buttonTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(
                    20.h,
                  ),
                ),
                onTap: () {
                  controller.charityUrgentRequestPostBTN();

                },
                //width: 200.h,
                height: 45.h,
                text: "URGENT REQUEST",
              ),

            ],
          ),
        ),
      ),
    );
  }

  charity_drawer(){
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderLR80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              alignment: Alignment.center,
              imagePath: ImageConstant.imgNewlogo12,
              color: Colors.teal,
              height: 39.v,

              width: 132.h,
              margin: EdgeInsets.only(left: 26.h),
            ),
            SizedBox(height: 20),
            drawerMenuItem(0, ImageConstant.imgNavhome, "Dashboard".tr),
            divLine(),
            drawerMenuItem(1, ImageConstant.imgCar, "Transaction"),
            divLine(),
            drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer,"Link"),
            divLine(),
            drawerMenuItem(3, ImageConstant.imgFrameErrorcontainer, "Profile"),
            divLine(),
            drawerMenuItem(12, ImageConstant.imgReply, "lbl_logout".tr),
            divLine(),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
  divLine(){
    return SizedBox(
      height: 2.v,

      child: Divider(
        indent: 20,
        endIndent: 10,


      ),
    );
  }

  drawerMenuItem(int count, String imagePath, String title) {
    return InkWell(
      onTap: () {
        print('SideMenuDraweritem.drawerMenuItem $title');
        if (count == 0) {
          Get.back();
          Get.toNamed(AppRoutes.charityDashboard,
          );
        } else if (count == 1) {
          Get.back();
          Get.toNamed(AppRoutes.charityGetTransaction);


        } else if (count == 2) {
          Get.back();
          Get.toNamed(AppRoutes.charityLink,

          );
        }

        else if(count==3){
          Get.back();
          Get.toNamed(AppRoutes.charityProfile);

          /// profile
        }
        else if (count == 12) {
          Get.offNamedUntil(AppRoutes.signInScreen, (route) => false);

        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 17.h, top: 5.v, bottom: 5.v),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal.shade50,
              child: CustomImageView(
                svgPath: imagePath, //ImageConstant.imgFrame5,
                height: 22.adaptSize,
                width: 22.adaptSize,
                color: Colors.black,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 2.v,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                title,
                style: CustomTextStyles.headlineSmallMedium1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
