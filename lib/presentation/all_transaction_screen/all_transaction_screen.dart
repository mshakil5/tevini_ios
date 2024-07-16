import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/presentation/all_transaction_screen/models/all_transaction_model.dart';
import 'package:tenvini/presentation/home_page/controller/home_controller.dart';

import '../../core/values/app_assets.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../data/models/home/dashboard_model.dart';
import '../../main.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/all_transaction_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_icon_button.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class AllTransactionScreen extends GetWidget<AllTransactionController> {
  DateTime startDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  DateTime endDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  String? userProfile = localStoreSRF.getString('userProfile');
  HomeController controller2 = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _allTransactionKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    String? name = localStoreSRF.getString('name');
    String? accNo = localStoreSRF.getString('accNo');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: _allTransactionKey,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            _allTransactionKey.currentState?.openDrawer();
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
                  /* CircleAvatar(
                  radius: 14,
                  child: Icon(
                    Icons.person,
                    size: 18,
                  ),
                ),*/
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
              )),
        ],
      ),
      body: Obx(() {
        Text(controller2.allTransactionDataList.length.toString());
        return Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 0, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "msg_view_transactions".tr,
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

              /* datePicker(context),*/

              ///--------- Tap Controller

              SizedBox(
                height: 10,
              ),

              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.teal,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: Colors.teal,
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                controller: controller.tabController,
                tabs: [
                  Tab(

                      height: 50,
                      iconMargin: EdgeInsets.only(bottom: 0),
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        'All',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),

                    ),
                  )

                      ),
                  Tab(
                    height: 50,
                    iconMargin: EdgeInsets.only(bottom: 0),
                      child: Container(
                    alignment: Alignment.center,
                    child:Text(
                        'In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Tab(


                    height: 50,
                    iconMargin: EdgeInsets.only(bottom: 0),

                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Out ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      )),
                  Tab(
                    height: 50,
                    iconMargin: EdgeInsets.only(bottom: 0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Pending',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1,color: Colors.teal,),
              AppSpace.spaceH6,
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    // cardAllTrnHeadLine(),
                    ListView.builder(
                        itemCount: controller2.allTransactionDataList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Alltransaction data =
                              controller2.allTransactionDataList[index];
                          return cardUI(data);
                        }),
                    // cardAllTrnHeadLine(),
                    ListView.builder(
                        itemCount: controller2.inTransactionDataList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Alltransaction data =
                              controller2.inTransactionDataList[index];
                          return cardUI(data);
                        }),
                    //  cardAllTrnHeadLine(),
                    ListView.builder(
                        itemCount: controller2.outTransactionsDataList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Alltransaction data =
                              controller2.outTransactionsDataList[index];
                          return cardUI(data);
                        }),
                    //   cardAllTrnHeadLine(),
                    ListView.builder(
                        itemCount:
                            controller2.pendingTransactionDataList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Alltransaction data =
                              controller2.pendingTransactionDataList[index];
                          return cardUI(data); // cardAllTrnUI();
                        }),
                  ],
                ),
              ),
            ]));
      }),
      // bottomNavigationBar:filter(context) ,
    );
  }

  onTapArrowleftone() {
    Get.back();
  }

  fetchAPI() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Obx(
        () => controller2.orderHistoryDataList.length == 0
            ? Center(child: Image.asset('assets/images/data_not_found.png'))
            : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  //  AllTransactionModel model = controller2.allTransactionDataList[index];
                  // print('HomePage.build ${model.amount}');
                  // DonationrowItemModel model = controller.dashboardData.donationrowItemList.value[index];
                  return Container();
                },
                itemCount: controller2.orderHistoryDataList.length >= 5
                    ? 5
                    : controller2.orderHistoryDataList.length,
                itemBuilder: (context, index) {
                  // AllTransactionModel model = controller2.orderHistoryDataList[index];
                  // DonationrowItemModel model = controller.dashboardData.donationrowItemList.value[index];
                  return Text('No Data');
                  /*SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 0.h),
              child: IntrinsicWidth(

                child: Container(

                  padding: EdgeInsets.symmetric(vertical: 4.v),
                  decoration: AppDecoration.fillWhiteA,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 4.v,
                        ),
                        child: Text(
                          model.updatedAt!.toIso8601String().substring(0,10),
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 50.h,
                          top: 5.v,
                        ),
                        child: Text(
                          model.orderId.toString(),
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 60.h,
                          top: 4.v,
                        ),
                        child: Text(
                          model.amount.toString(),
                          style: theme.textTheme.labelLarge,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 90.h,
                          top: 4.v,
                        ),
                        child: Text(
                          'Cancel',
                          style: theme.textTheme.labelLarge,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );*/
                  // return OrderHistoryDataWidget(model);
                },
              ),
      ),
    );
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

  cardUI1(Alltransaction model) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                        model.createdAt?.toIso8601String().substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Description ',
                      titleValue:
                          'Testing charity' /*model.charityId.toString()*/),
                  CustomTitleKeyValue(
                    titleKey: 'Ref/Voucher No  ',
                    titleValue: model.tId.toString(),
                  ),
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

  cardUI(Alltransaction model) {
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
                    titleKey: 'Ref/Voucher No  ',
                    titleValue: model.tId.toString(),
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:DateFormat('dd-MMM-yyyy').format(model.createdAt),

                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Amount  ',
                    titleValue: ' £ ' + model.amount.toString(),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Description ',
                      titleValue:
                          model.title),

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'lbl_date_from'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => onTapStartDateTime(context),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      //    color: Colors.greenAccent, border: Border.all()
                      color: Colors.white,
                      border: Border.all()),
                  alignment: Alignment.center,
                  child: //Obx(() =>
                      Text(
                    getFormatedDate(startDate),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
//),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => onTapEndDateTime(context),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  child: //Obx(() =>
                      Text(
                    getFormatedDate(endDate),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
// ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: 40,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), color: Colors.white),
            child: IconButton(
                onPressed: () {
//controller.getAccessoriesRequisitionList
                },
                icon: const Icon(Icons.search, color: Colors.black)),
          ),
        ),
      ],
    );
  }

  /// Picker Start
  onTapStartDateTime(context) async {
    DateTime startDate = DateTime(
        DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      /*   setState(() {
      startDate = date;
    });*/
    }
  }

  /// Picker End
  onTapEndDateTime(context) async {
    DateTime endDate = DateTime(
        DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
    final DateTime? date = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16),
                //fixedSize: Size.square(14.3),
                foregroundColor: Colors.teal, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierColor: Colors.teal.withOpacity(0.8),
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      endDate = date;
    }
  }

  ///Date Format
  String getFormatedDate(DateTime date) =>
      DateFormat('dd-MMM-yyyy').format(date);

  filter(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () => controller2.onTapStartDateTime(context),
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                alignment: Alignment.center,
                child:
                    // Obx(() =>
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd-MMM-yyyy').format(controller2.startDate),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Icon(Icons.calendar_month_rounded)
                  ],
                ),
                // ),
              ),
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () => controller2.onTapEndDateTime(context),
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                alignment: Alignment.center,
                child:
                    // Obx(() =>
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd-MMM-yyyy').format(controller2.endDate),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Icon(Icons.calendar_month_rounded)
                  ],
                ),
                // ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                /*   print('startDate ${controller2.startDate}');
                print('endDate ${controller2.endDate}');
                List<AllTransactionModel> data =controller2. itemsBetweenDatesStanding(
                    dates: controller2.standOrderRecordDataList, start: controller2.startDate, end: controller2.endDate);

                // setState(() {
                //   _searchResult1 = data;
                //  });*/
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
