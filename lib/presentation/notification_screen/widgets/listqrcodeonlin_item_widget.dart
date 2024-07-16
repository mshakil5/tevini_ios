import '../controller/notification_controller.dart';
import '../models/listqrcodeonlin_item_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListqrcodeonlinItemWidget extends StatelessWidget {
  ListqrcodeonlinItemWidget(
    this.listqrcodeonlinItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListqrcodeonlinItemModel listqrcodeonlinItemModelObj;

  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillTeal.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Text(
            "msg_qr_code_online_payment".tr,
            style: CustomTextStyles.titleMediumPoppinsOnPrimary,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              right: 18.h,
            ),
            child: Text(
              "msg_lorem_ipsum_dolor".tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 6.v),
          Opacity(
            opacity: 0.8,
            child: Text(
              "lbl_15_min_ago".tr,
              style: CustomTextStyles.bodySmallBluegray400,
            ),
          ),
        ],
      ),
    );
  }
}
