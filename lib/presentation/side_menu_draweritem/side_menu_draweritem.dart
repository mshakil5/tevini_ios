import 'dart:ffi';

import 'package:tenvini/presentation/order_voucher_books_screen/controller/order_voucher_books_controller.dart';

import '../../main.dart';
import 'controller/side_menu_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

class SideMenuDraweritem extends StatelessWidget {
  //SideMenuDraweritem(this.controller, {Key? key}) : super(key: key);
  SideMenuDraweritem( {Key? key}) : super(key: key);
  SideMenuController controller = Get.put(SideMenuController());

  //SideMenuController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    String? account =   localStoreSRF.getString('accNo');
    print('Is Empty  account  :: $account');

    if(account==''){
      return Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.v),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.customBorderLR80,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
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
             /* divLine(),
              drawerMenuItem(1, ImageConstant.imgCar, "lbl_make_a_donation2".tr),
              divLine(),
              drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer,
                  "msg_donation_records".tr),
              divLine(),
              drawerMenuItem(3, ImageConstant.imgFrameErrorcontainer16x16,
                  "msg_standing_order_records".tr),
              divLine(),
              drawerMenuItem(
                  4, ImageConstant.imgFrame16x16, "msg_order_voucher_books2".tr),
              divLine(),
              drawerMenuItem(5, ImageConstant.imgFrame1, "lbl_order_record".tr),
              divLine(),
              drawerMenuItem(
                  6, ImageConstant.imgTicket, "msg_waiting_vouchers".tr),
              divLine(),
              drawerMenuItem(7, ImageConstant.imgFrame2, "lbl_tevini_card".tr),
              divLine(),
              drawerMenuItem(
                  8, ImageConstant.imgFrame3, "msg_view_transactions2".tr),
              divLine(),
              drawerMenuItem(
                  9, ImageConstant.imgFrame4, "msg_maaser_calculator".tr),
              divLine(),
              drawerMenuItem(
                  10, ImageConstant.imgFrame5, "lbl_contact_top_up".tr),
              divLine(),
              drawerMenuItem(11, ImageConstant.imgFrame6, "lbl_profile".tr),*/
              divLine(),
              Spacer(),
              drawerMenuItem(12, ImageConstant.imgReply, "lbl_logout".tr),
              divLine(),


              Text('V- 1.0.0',style: TextStyle(fontSize: 14,color: Colors.teal,fontStyle: FontStyle.italic),),
              SizedBox(height: 50),
            ],
          ),
        ),
      );
    }else{
      return Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.v),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.customBorderLR80,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              drawerMenuItem(1, ImageConstant.imgCar, "lbl_make_a_donation2".tr),
              divLine(),
              drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer,
                  "msg_donation_records".tr),
              divLine(),
              drawerMenuItem(3, ImageConstant.imgFrameErrorcontainer16x16,
                  "msg_standing_order_records".tr),
              divLine(),
              drawerMenuItem(
                  4, ImageConstant.imgFrame16x16, "msg_order_voucher_books2".tr),
              divLine(),
              drawerMenuItem(5, ImageConstant.imgFrame1, "lbl_order_record".tr),
              divLine(),
              drawerMenuItem(
                  6, ImageConstant.imgTicket, "msg_waiting_vouchers".tr),
              divLine(),
             // drawerMenuItem(7, ImageConstant.imgFrame2, "lbl_tevini_card".tr),
            //  divLine(),
              drawerMenuItem(
                  8, ImageConstant.imgFrame3, "msg_view_transactions2".tr),
              divLine(),
              drawerMenuItem(
                  9, ImageConstant.imgFrame4, "msg_maaser_calculator".tr),
              divLine(),
              drawerMenuItem(
                  10, ImageConstant.imgFrame5, "lbl_contact_top_up".tr),
              divLine(),
              drawerMenuItem(
                  13, ImageConstant.imgFrame2, "Transfer To TDF"),
              divLine(),
              drawerMenuItem(11, ImageConstant.imgFrame6, "lbl_profile".tr),
              divLine(),
              drawerMenuItem(12, ImageConstant.imgReply, "lbl_logout".tr),
              divLine(),
              SizedBox(height: 10),

              Text('V- 1.0.0',style: TextStyle(fontSize: 14,color: Colors.teal,fontStyle: FontStyle.italic),)

            ],
          ),
        ),
      );
    }


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
          Get.offNamed(AppRoutes.homeContainerScreen);
        } else if (count == 1) {
          Get.back();
          Get.toNamed(AppRoutes.makeADonationOneScreen);
        } else if (count == 2) {
          Get.back();
          Get.toNamed(AppRoutes.donationRecordScreen,

          );
        } else if (count == 3) {
          Get.back();
          Get.toNamed(
            AppRoutes.standingDonationRecordsScreen,
          );
        } else if (count == 4) {
          Get.back();
          Get.delete<OrderVoucherBooksController>();
          OrderVoucherBooksController voucherCTN=Get.put(OrderVoucherBooksController());
          voucherCTN.textEditingControllers.clear();
          voucherCTN.initSQLController();
          voucherCTN.finalAmount.value=0.0;
          voucherCTN.isCheckCollection.value=false;
          voucherCTN.isCheckExpressDelivery.value=false;
          voucherCTN.totalOrderController.value.clear();
          voucherCTN.totalSummery.value=0.00;
          voucherCTN.total.value=0.00;

          Get.toNamed(AppRoutes.orderVoucherBooksScreen,
          );
        } else if (count == 5) {
          Get.back();
          Get.toNamed(AppRoutes.orderRecordScreen,
          );
        } else if (count == 6) {
          Get.back();
          Get.toNamed(AppRoutes.watingVoucherRecordsScreen,

          );
        } else if (count == 7) {
          Get.back();
          Get.toNamed(AppRoutes.updateCardholderScreen,
          );
        } else if (count == 8) {
          Get.back();
          Get.toNamed(
            AppRoutes.allTransactionScreen,
          );
        } else if (count == 9) {
          Get.back();
          Get.toNamed(
            AppRoutes.maaserCalculatorScreen,
          );
        } else if (count == 10) {
          Get.back();
          Get.toNamed(
            AppRoutes.contactTopUpScreen,
          );
        } else if (count == 11) {
          Get.back(closeOverlays: true);
          Get.toNamed(
            AppRoutes.myProfileScreen,
           // preventDuplicates: false

          );


        }
        else if (count == 13) {
          Get.back();
          Get.toNamed(
            AppRoutes.transferTDFScreen,
          );
        }
        else if (count == 12) {
           localStoreSRF.clear();
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
