import '../notification_screen/widgets/listqrcodeonlin_item_widget.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/notification_controller.dart';
import 'models/listqrcodeonlin_item_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

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
                margin: EdgeInsets.only(left: 19.h, bottom: 1.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_notification".tr)),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 22.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Obx(() => ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return Opacity(
                                opacity: 0.15,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.5.v),
                                    child: SizedBox(
                                        width: 390.h,
                                        child: Divider(
                                            height: 1.v,
                                            thickness: 1.v,
                                            color:
                                                appTheme.blueGray30067))));
                          },
                          itemCount: controller.notificationModelObj.value
                              .listqrcodeonlinItemList.value.length,
                          itemBuilder: (context, index) {
                            ListqrcodeonlinItemModel model = controller
                                .notificationModelObj
                                .value
                                .listqrcodeonlinItemList
                                .value[index];
                            return ListqrcodeonlinItemWidget(model);
                          }))),
                 /* Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text("msg_qr_code_online_payment".tr,
                          style: CustomTextStyles
                              .titleMediumPoppinsOnPrimary)),
                  Container(
                      width: 351.h,
                      margin: EdgeInsets.only(
                          left: 10.h, top: 1.v, right: 28.h),
                      child: Text("msg_lorem_ipsum_dolor".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50))),
                  Opacity(
                      opacity: 0.8,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.h, top: 6.v),
                          child: Text("lbl_15_min_ago".tr,
                              style:
                                  CustomTextStyles.bodySmallBluegray400))),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, top: 231.v),
                      child: Text("msg_qr_code_online_payment".tr,
                          style: CustomTextStyles
                              .titleMediumPoppinsOnPrimary)),
                  Container(
                      width: 351.h,
                      margin: EdgeInsets.only(
                          left: 10.h, top: 1.v, right: 28.h),
                      child: Text("msg_lorem_ipsum_dolor".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50))),
                  Opacity(
                      opacity: 0.8,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.h, top: 6.v),
                          child: Text("lbl_15_min_ago".tr,
                              style:
                                  CustomTextStyles.bodySmallBluegray400))),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, top: 20.v),
                      child: Text("msg_qr_code_online_payment".tr,
                          style: CustomTextStyles
                              .titleMediumPoppinsOnPrimary)),
                  Container(
                      width: 351.h,
                      margin: EdgeInsets.only(
                          left: 10.h, top: 1.v, right: 28.h),
                      child: Text("msg_lorem_ipsum_dolor".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50))),
                  Opacity(
                      opacity: 0.8,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.h, top: 6.v),
                          child: Text("lbl_15_min_ago".tr,
                              style:
                                  CustomTextStyles.bodySmallBluegray400))),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, top: 20.v),
                      child: Text("msg_qr_code_online_payment".tr,
                          style: CustomTextStyles
                              .titleMediumPoppinsOnPrimary)),
                  Container(
                      width: 351.h,
                      margin: EdgeInsets.only(
                          left: 10.h, top: 1.v, right: 28.h),
                      child: Text("msg_lorem_ipsum_dolor".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!
                              .copyWith(height: 1.50))),
                  Opacity(
                      opacity: 0.8,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.h, top: 6.v, bottom: 80.v),
                          child: Text("lbl_15_min_ago".tr,
                              style:
                                  CustomTextStyles.bodySmallBluegray400)))*/
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
