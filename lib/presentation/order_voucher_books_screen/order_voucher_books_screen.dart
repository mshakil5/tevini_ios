import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/presentation/home_page/controller/home_controller.dart';

import '../../core/utils/validation_functions.dart';
import '../../core/values/app_assets.dart';
import '../../data/shimmer_effect.dart';
import '../../main.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../order_voucher_books_screen/widgets/order_voucher_item_widget.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/order_voucher_books_controller.dart';
import 'models/order_voucher_books_model.dart';
import 'models/order_voucher_item_model.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OrderVoucherBooksScreen extends GetWidget<OrderVoucherBooksController> {
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _voucherBookScaffoldKey =
      new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? address = localStoreSRF.getString('address');
  String? userProfile = localStoreSRF.getString('userProfile');
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: _voucherBookScaffoldKey,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            _voucherBookScaffoldKey.currentState?.openDrawer();
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
      body: buildVoucher(),
    );
  }

  buildVoucher() {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(0.0),
                bottomLeft: Radius.circular(10.0)

            ),
            color: Colors.teal.withOpacity(0.9),
          ),
          height: 150,width: double.infinity,
          // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                height: 40,
                margin: const EdgeInsets.all(10),

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    const Text(
                      'Order Total: £',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      controller.totalSummery.toStringAsFixed(2).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),


            Obx(() {

              return
                controller.isCheckExpressDelivery.value==true && controller.totalSummery.value>0?
                controller.totalSummery.value < 200.0
                  ? controller.totalSummery.value != 0.0
                      ? Container(
                          //height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          alignment: Alignment.center,
                          width: double.infinity,
                          // color: Colors.grey.withOpacity(0.5),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                            border: Border.all(color: Colors.teal),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: Text(

                            'Charge £3.50 on Prepaid  \n voucher orders less than £200.',


                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container()
                  : Container():Container();
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 5.h, top: 0.v, right: 5.h, bottom: 2.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 0, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "msg_order_voucher_books2".tr,
                                style: theme.textTheme.headlineMedium,
                              ),
                              Image.asset(
                                AppAssets.appLogo,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        ),

                        fetchAPI(),
                        AppSpace.spaceH6,
                        Text("lbl_delivery".tr,
                            style: theme.textTheme.headlineSmall),
                        Divider(),
                        SizedBox(height: 5.v),

                        ///---------- check box Delivery ----------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Obx(
                                      () => CustomCheckboxButton(
                                        //text: "msg_set_up_a_standing".tr,
                                        value:
                                            controller.isCheckExpressDelivery.value,
                                        onChange: (value) {
                                          print(
                                              'MakeADonationOneScreen.build >>> ${value}');
                                          controller.isCheckExpressDelivery.value =
                                              value;
                                          controller.isCheckCollection.value =
                                              false;

                                          if (controller
                                                  .isCheckExpressDelivery.value ==
                                              true) {
                                            controller.calculateSummery();

                                            var total =
                                                controller.finalAmount.value;

                                            if (total == 0.0) {
                                              controller.totalOrderController.value
                                                  .text = total.toString();
                                            } else {
                                              if (total < 200.00) {
                                                controller.isTemp3PointAdd.value =
                                                    true;
                                                print(
                                                    'OrderVoucherBooksScreen.buildVoucher ${controller.isTemp3PointAdd.value}');
                                                print('if 200 less');
                                                controller.temp3PointAdd.value +=
                                                    total;
                                                print(
                                                    'final :: ${controller.finalAmount.value}');
                                                controller.totalOrderController
                                                        .value.text =
                                                    controller.temp3PointAdd.value
                                                        .toString();
                                              } else {
                                                controller.totalOrderController
                                                    .value.text = total.toString();
                                              }
                                            }
                                          } else {
                                            controller.totalOrderController.value
                                                    .text =
                                                controller.finalAmount.value
                                                    .toString();
                                          }
                                        },
                                        ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'msg_express_delivery'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'msg_1_2_working_days'.tr,
                                          style:
                                              CustomTextStyles.titleLargeGray900_1,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Obx(() => CustomCheckboxButton(
                                        value: controller.isCheckCollection.value,
                                        onChange: (value) {
                                          controller.isCheckCollection.value =
                                              value;
                                          controller.isCheckExpressDelivery.value =
                                              false;
                                          if (controller.isCheckCollection.value =
                                              true) {
                                            controller.calculateSummery();
                                            controller.isTemp3PointAdd.value =
                                                false;
                                            controller.temp3PointAdd.value = 3.5;
                                            var total =
                                                controller.finalAmount.value;
                                            print('total $total');
                                            controller.totalOrderController.value
                                                .text = total.toString();
                                          }
                                        })),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_collection".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          Text("msg_100_fairholt_rd".tr,
                                              style: CustomTextStyles
                                                  .titleLargeGray900_1),
                                          Text("msg_mon_thu_10_00".tr,
                                              style: CustomTextStyles
                                                  .titleLargeGray900_1),
                                          Text('msg_express_delivery'.tr,
                                              style: CustomTextStyles
                                                  .titleLargeGray900_1),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(Icons.info),
                            Expanded(
                                child: Text(
                              "The delivery address saved on your account is: $address",
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )),
                          ],
                        ),
                        SizedBox(height: 20.v),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: Text("lbl_order_total".tr,
                                        style: CustomTextStyles.titleLargeMedium)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Obx(() => Center(
                                          child: Text(
                                        '£ ${controller.totalSummery.toStringAsFixed(2).toString()}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ))),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.teal, spreadRadius: 1),
                                    ],
                                  ),
                                  height: 40,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CustomOutlinedButton(
                                      height: 45,
                                      onTap: () => controller.voucherStore(),
                                      text: "lbl_place_order".tr,
                                      buttonTextStyle: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 2.h, top: 0.v))),
                            ]),
                        SizedBox(height: 40.v),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  fetchAPI() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Obx(
        () => controller.OrderVoucherDataList.length == 0
            ? ShimmerLoading().buildShimmerGrid2(200.00)
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200.v,
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.OrderVoucherDataList.length,
                itemBuilder: (context, index) {
                  return dataItem(
                    controller.OrderVoucherDataList[index],
                    index,

                  );

                  //  OrderVoucherItemWidget(model);
                }),
      ),
    );
  }

  dataItem(OrderVoucherBookModel1 dataItem, int index) {
    return Card(
      elevation: 0.0,
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: dataItem.type == 'Prepaid'
                        ? Colors.teal
                        : const Color.fromARGB(255, 0, 49, 88)),
                child: Center(
                  child: Text(
                    '${dataItem.type}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              AppSpace.spaceH6,
              Text(
                '£${dataItem.singleAmount}',
                maxLines: 1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,

                    color: Colors.black),
              ),
              AppSpace.spaceH10,
              dataItem.type == 'Prepaid'
                  ? Text(
                      '${dataItem.note} = £ ${dataItem.amount}',
                      maxLines: 2,
                      style: TextStyle(
                           color: Colors.teal,

                        fontSize: 8

                       ),

                    )
                  : Text(
                      '${dataItem.note}',
                maxLines: 2,
                      style: TextStyle(
                          color: Colors.teal
                         ,fontSize: 11
                      ),
                    ),
              AppSpace.spaceH10,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'QTY : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.OrderVoucherDataList[index].qty =
                            value.isNotEmpty ? int.parse(value) : 0;

                        //  onChanged!(value);
                        controller.calculateSummery();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),
                        contentPadding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
