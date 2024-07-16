import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_helper.dart';
import 'package:tenvini/data/models/donor_model.dart';

import 'package:tenvini/presentation/home_page/controller/home_controller.dart';

import '../../../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../../../data/helper.dart';
import '../../../../data/models/home/dashboard_model.dart';
import '../../../../data/shimmer_effect.dart';
import '../../../../main.dart';
import '../../../../widgets/app_bar/appbar_image.dart';
import '../../charity_dashboard/controllers/charity_dashboard_controller.dart';
import '../controllers/charity_transction_controller.dart';

import 'package:tenvini/core/app_export.dart';

import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';

import 'package:flutter/material.dart';

class CharityTransctionView extends GetWidget<CharityTransctionController> {
  CharityDashboardController charityCon = Get.find();
  String? userProfile = localStoreSRF.getString('userProfile');
  String? name = localStoreSRF.getString('name');

  final GlobalKey<ScaffoldState> charityKeyTns = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    String? name = localStoreSRF.getString('name');
    String? accNo = localStoreSRF.getString('accNo');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: charityKeyTns,
      drawer: charity_drawer(),
      appBar: CustomAppBar(
        height: 65.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            charityKeyTns.currentState?.openDrawer();
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
            onTap: () {
              Get.toNamed(AppRoutes.charityProfile);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* CircleAvatar(
                    radius: 14,
                    child: Icon(
                      Icons.person,
                      size: 18,
                    ),
                  ),*/
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomImageView(
                          placeHolder: ImageConstant.imgHolder,
                          url:
                              ImageConstant.imageProfilePath + '${userProfile}',
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Text(
                      name.toString(),

                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
      body: Obx(() {
        Text(charityCon.inTransactionDataList.length.toString());

        if (charityCon.inTransactionDataList.length == 0) {
          return ShimmerLoading().buildShimmerBookingTicketsLV(200.00);
        } else {
          return Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("msg_view_transactions".tr,
                      style: theme.textTheme.headlineMedium)),

              ///--------- Tap Controller

              SizedBox(
                height: 10,
              ),
              TabBar(
                onTap: (v){
                  print('index $v');

                  charityCon.outTransactionsDataListSearch.clear();
                  },
                labelColor: Colors.white,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.teal,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: Colors.teal,
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                controller: controller.tabController,
                tabs: controller.myTabs
              ),
              Expanded(
                child: InkWell(

                  child: TabBarView(

                    controller: controller.tabController,
                    children:[
                      // Transaction In
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            datePicker(context),
                            Expanded(
                              child: ListView.builder(
                                 // itemCount: charityCon.inTransactionDataList.length,
                                  itemCount: charityCon.outTransactionsDataListSearch.isEmpty? charityCon.inTransactionDataList.length:charityCon.outTransactionsDataListSearch.length,

                                  itemBuilder: (BuildContext ctx, int index) {
                                    //Alltransaction data = charityCon.inTransactionDataList[index];

                                    Alltransaction data=charityCon.outTransactionsDataListSearch.isEmpty?charityCon.inTransactionDataList[index]:charityCon.outTransactionsDataListSearch[index];


                                    print('donor ID : ${data.donationId}');
                                    var donorName = '';
                                    if (charityCon.donorList.value.isNotEmpty) {
                                      DonorModel donorInfo =
                                          charityCon.donorList.value.firstWhere(
                                              (DonorModel element) =>
                                                  element.id ==
                                                  int.parse(data.userId),
                                              orElse: () =>
                                                  charityCon.dummyDonorData);
                                      donorName = donorInfo.name;
                                    //  print('donor Name :: ${donorInfo.name}');
                                    }

                                    return transactionInUI(data, donorName);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      // Transaction Out

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            datePicker(context),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: charityCon.outTransactionsDataListSearch.isEmpty? charityCon.outTransactionsDataList.length:charityCon.outTransactionsDataListSearch.length,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    Alltransaction data=charityCon.outTransactionsDataListSearch.isEmpty?charityCon.outTransactionsDataList[index]:charityCon.outTransactionsDataListSearch[index];


                                   //  print('donor ID : ${data.donationId}');
                                    var donorName = '';
                                    /*if (charityCon.donorList.value.isNotEmpty) {
                                        DonorModel donorInfo =
                                        charityCon.donorList.value.firstWhere((DonorModel element) =>
                                        element.id == int.parse(data.userId), orElse: () => charityCon.dummyDonorData);
                                        donorName=donorInfo.name;
                                        print('donor Name :: ${donorInfo.name}');
                                      }*/
                                    return transactionOutUI(data, donorName);
                                  }),
                            ),
                          ],
                        ),
                      ),

                      // Pending Transaction
                      ListView.builder(
                          itemCount: charityCon.pendingTransactionDataList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            Alltransaction data =
                                charityCon.pendingTransactionDataList[index];
                            print('donor ID : ${data.donationId}');
                            var donorName = '';
                            if (charityCon.donorList.value.isNotEmpty) {
                              DonorModel donorInfo = charityCon.donorList.value
                                  .firstWhere(
                                      (DonorModel element) =>
                                          element.id == int.parse(data.userId),
                                      orElse: () => charityCon.dummyDonorData);
                              donorName = donorInfo.name;
                              print('donor Name :: ${donorInfo.name}');
                            }
                            return pendingTransactionUI(
                                data, donorName); // cardAllTrnUI();
                          }),
                    ],
                  ),
                ),
              ),
            ]),
          );
        }
      }),
    );
  }

  onTapArrowleftone() {
    Get.back();
  }

  cardAllTrnHeadLine() {
    return Container(
        height: 100,
        margin: EdgeInsets.only(top: 5.v, right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.v),
        decoration: AppDecoration.fillOnError,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_date".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white))),
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_order_id".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white))),
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_amount".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white))),
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_status".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)))
        ]));
  }

  cardAllTrnUI() {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 5.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_08_01_2023".tr,
                  style: theme.textTheme.displayMedium)),
          Padding(
              padding: EdgeInsets.only(left: 37.h, top: 3.v),
              child:
                  Text("lbl_10_20".tr, style: theme.textTheme.displayMedium)),
          Spacer(flex: 44),
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("lbl_25452325".tr,
                  style: theme.textTheme.displayMedium)),
          Spacer(flex: 55),
          Padding(
              padding: EdgeInsets.only(top: 3.v, right: 5.h),
              child: Text("lbl_10_20".tr, style: theme.textTheme.displayMedium))
        ]));
  }

  transactionInUI(Alltransaction model, String? donorName) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:
                        DateFormat('dd-MMM-yyyy').format(model.createdAt),
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Donor  ',
                    titleValue: donorName,
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Transaction Id ',
                    titleValue: model.tId.toString(),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Transaction Type ',
                      titleValue: model.title.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Voucher Number ', titleValue: model.chequeNo),
                  CustomTitleKeyValue(
                      titleKey: 'Note ', titleValue: model.note.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Amount ',
                      titleValue: '£' + model.amount.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  transactionOutUI(Alltransaction model, String? donorName) {
    print('model note :: ${model.note}');
    print('model source :: ${model.source}');
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:
                        DateFormat('dd-MMM-yyyy').format(model.createdAt),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Transaction Id ',
                      titleValue: model.tId.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Charity Name ',
                      titleValue: model.charityName.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Note ', titleValue: model.note.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Source ', titleValue: model.name.toString()),
                  CustomTitleKeyValue(
                    titleKey: 'Amount  ',
                    titleValue: ' £ ' + model.amount.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pendingTransactionUI(Alltransaction model, String? donorName) {
    var refName = '';
    refName = model.title == 'Voucher'
        ? model.chequeNo.toString()
        : model.tId.toString();
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:
                        DateFormat('dd-MMM-yyyy').format(model.createdAt),
                  ),
                  CustomTitleKeyValue(titleKey: 'Donor', titleValue: donorName),
                  CustomTitleKeyValue(
                      titleKey: 'Transaction Id ',
                      titleValue: model.tId.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Ref/ Voucher No ', titleValue: refName),
                  CustomTitleKeyValue(
                    titleKey: 'Amount  ',
                    titleValue: ' £ ' + model.amount.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// UI Form To
  datePicker(BuildContext context) {
    return Obx(() {
      print(controller.count.value);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'lbl_date_from'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  InkWell(
                    onTap: () => controller.onTapStartDateTime(context),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                      height: 40,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          //    color: Colors.greenAccent, border: Border.all()
                          color: Colors.white,
                          border: Border.all()),
                      alignment: Alignment.center,
                      child:
                              Obx(() =>
                          Text(
                        controller.getFormatedDate(controller.startDate.value),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'lbl_date_to'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  InkWell(
                    onTap: () => controller.onTapEndDateTime(context),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      child:
                           Obx(() =>
                          Text(
                        controller.getFormatedDate(controller.endDate.value),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Text(''),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () async{

                          showloader();
                          await Future.delayed(Duration(seconds: 2), () async{
                            loaderDismiss();

                            print('startDate ${controller.startDate}');
                            print('endDate ${controller.endDate}');
                            List<Alltransaction> data = charityCon.itemsBetweenDatesCharityTransaction(
                                dates: charityCon.outTransactionsDataList,
                                start: controller.startDate.value,
                                end: controller.endDate.value);

                            charityCon.outTransactionsDataListSearch.value = data;

                            print(
                                'out lng :${charityCon.outTransactionsDataList.length}');
                            print(
                                'search lng :${charityCon.outTransactionsDataListSearch.length}');

                          });

                         },
                        icon: const Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  charity_drawer() {
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
            drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer, "Link"),
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

  divLine() {
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
          Get.toNamed(
            AppRoutes.charityDashboard,
          );
        } else if (count == 1) {
          Get.back();
          Get.toNamed(AppRoutes.charityGetTransaction);
        } else if (count == 2) {
          Get.back();
          Get.toNamed(
            AppRoutes.charityLink,
          );
        } else if (count == 3) {
          /// profile
          Get.back();
          Get.toNamed(AppRoutes.charityProfile);
        } else if (count == 12) {
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
