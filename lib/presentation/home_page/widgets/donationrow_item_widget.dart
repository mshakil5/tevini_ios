import 'package:intl/intl.dart';

import '../../../data/models/home/dashboard_model.dart';
import '../controller/home_controller.dart';
import '../models/donationrow_item_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DonationrowItemWidget extends StatelessWidget {
  DonationrowItemWidget(
    this.donationrowItemModelObj, {Key? key,}) : super(key: key);

  TransactionModel donationrowItemModelObj;
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.outlineGray200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 3.v),
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillIndigo,
            child: CustomImageView(
              svgPath: ImageConstant.imgFrameRed500,
            ),
          ),
          Container(
            height: 70.v,

            margin: EdgeInsets.only(left: 12.h),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      /*Text(
                        'Testing charity',
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleLargeMedium,
                      ),*/
                      Text(
                          donationrowItemModelObj.title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeMedium ,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(

                      DateFormat('dd-MMM-yyyy').format(donationrowItemModelObj.createdAt.toUtc()),

                    style: CustomTextStyles.titleMediumMedium_1,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              bottom: 8.v,
            ),
            child:  Text(
               '£ '+ donationrowItemModelObj.amount,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleLargeRed500,
            ),
          ),
        ],
      ),
    );
  }
}
