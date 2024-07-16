import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/presentation/donation_record_screen/models/donation_record_model.dart';
import '../../core/values/app_assets.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../main.dart';
import '../home_page/controller/home_controller.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/Transfer_tdf_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/transction_tdf_model.dart';

class TransferTDFScreen extends StatelessWidget {
  TransferTDFController controller = Get.put(TransferTDFController());
  //HomeController controller = Get.put(HomeController());
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> donationKey = new GlobalKey<ScaffoldState>();
  TextEditingController controllerFilter = TextEditingController();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');
  var startDate = DateTime.utc(2024, 01, 01);
  var endDate = DateTime.utc(2024, 01, 31);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: donationKey,
      resizeToAvoidBottomInset: true,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            donationKey.currentState?.openDrawer();
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
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          //   padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(0.0),
                    bottomLeft: Radius.circular(10.0)),
                color: Colors.teal.withOpacity(0.2),
              ),
              height: 100,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, bottom: 0, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transfer To TDF",
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
                searchDonation(),
                fetchDonationRecord(),
              ],
            ),
          ]),
        ),
      ),
    );
  }


  fetchDonationRecord() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Obx(
        () => controller.transferTDFList.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : controller.tdfSearching.isNotEmpty ||
                    controllerFilter.text.isNotEmpty
                ? ListView.separated(

                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      TranscationTdfModel model =
                          controller.tdfSearching[index];
                      print('HomePage.build ${model.tdfaccount}');

                      return Container();
                    },
                    itemCount: controller.tdfSearching.length,
                    itemBuilder: (context, index) {
                      TranscationTdfModel model =
                          controller.transferTDFList[index];
                      return TransferTDFCardUI(model);
                    },
                  )
                : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    separatorBuilder: (context, index) {
                      TranscationTdfModel model =
                          controller.transferTDFList[index];
                      return Container();
                    },
                    itemCount: controller.transferTDFList.length,
                    itemBuilder: (context, index) {
                      TranscationTdfModel model =
                          controller.transferTDFList[index];
                      return TransferTDFCardUI(model);
                    },
                  ),
      ),
    );
  }

  /// Search Donation
  searchDonation() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 10, right: 10),
      //color: Colors.grey,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20),
        leading: const Icon(
          Icons.search,
          color: Colors.teal,
          size: 20,
        ),
        horizontalTitleGap: 5.0,
        title: TextField(
          style: TextStyle(color: Colors.teal),
          controller: controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search',
              border: InputBorder.none),
          onChanged: controller.onSearchTextChangedTDF,
        ),
        trailing: IconButton(
          color: Colors.teal,
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controllerFilter.clear();
            controller.onSearchTextChangedTDF('');
          },
        ),
      ),
    );
  }

  /// Donation Fetch Data
  TransferTDFCardUI(TranscationTdfModel model) {

    var statusText = 'Confirm';
    var annDonation = 'No';
    var standingOrder = 'No';
    if (model.status.toString() == '0') {
      statusText = 'Pending';
    } else if (model.status.toString() == '3') {
      statusText = 'Cancel';
    }


    return Card(
      elevation: 0.0,
      color: theme.primaryColor.withOpacity(0.2),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                        model.createdAt!.toIso8601String().substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'TDF Account',
                      titleValue: model.tdfaccount ?? ''),
                  CustomTitleKeyValue(
                    titleKey: 'Amount',
                    titleValue: '£ ${model.tdfAmount}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Status',
                    titleValue:statusText
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
