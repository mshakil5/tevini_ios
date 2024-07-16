import 'package:intl/intl.dart';
import 'package:tenvini/data/models/await_confirmation_model.dart';
import 'package:tenvini/presentation/standing_donation_records_screen/models/standing_donation_records_model.dart';

import '../../core/values/app_assets.dart';
import '../../core/values/app_space.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../main.dart';
import '../home_page/controller/home_controller.dart';

import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/wating_voucher_records_controller.dart';
import 'models/wating_voucher_records_model.dart';

class WatingVoucherRecordsScreen
    extends GetWidget<WatingVoucherRecordsController> {
  //HomeController controller2 = Get.put(HomeController());
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            _scaffoldKey.currentState?.openDrawer();
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
                  /*   Text('Acc N: 10101010',style: TextStyle(color: Colors.white),),
            SizedBox(width: 10,),*/

                 /* CircleAvatar(
                    radius: 14,
                    child: Icon(
                      Icons.person,
                      size: 18,
                    ),
                  ),*/
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
        ],
      ),
      body:
      SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 0,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "msg_waiting_voucher_records".tr,
                            style: theme.textTheme.headlineMedium,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              fetchAPI(),
            ],
          ),
        ),
      ),

    );
  }

  fetchAPI() {
    print('lng  Awaiting :: ${controller.waitingVoucherRecordDataList.length}');

    return Padding(
      padding: EdgeInsets.all(10),
      child: Obx(
        () => controller.waitingVoucherRecordDataList.length == 0
            ? Center(child: Image.asset('assets/images/data_not_found.png'))
            : ListView.separated(

                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                separatorBuilder: (context, index) {
                  AwaitConfirmationModel model =
                  controller.waitingVoucherRecordDataList[index];

                  return WaitingVoucherRecordCardUI(model);
                },
                itemCount:controller.waitingVoucherRecordDataList.length,
                itemBuilder: (context, index) {
                  AwaitConfirmationModel model =
                      controller.waitingVoucherRecordDataList[index];

                  return WaitingVoucherRecordCardUI(model);

                },
              ),
      ),
    );
  }



  WaitingVoucherRecordCardUI(AwaitConfirmationModel model ) {
    print('WatingVoucherRecordsScreen.WaitingVoucherRecordCardUI >>');
    print('status :: ${model.status.toString()}');
    var statusText = 'Confirm';
    var annDonation = 'No';
    var standingOrder = 'No';
    if (model.status.toString() == '0') {
      statusText = 'Pending';
    } else if (model.status.toString() == '3') {
      statusText = 'Waiting';
    }

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
                      titleKey: 'Date', titleValue:
                  DateFormat('dd-MMM-yyyy').format(model.updatedAt),),


                  CustomTitleKeyValue(
                    titleKey: 'Charity ',
                    titleValue: model.charityId??'',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Amount ',
                    titleValue:'£ '+ model.amount??'',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Status ',
                    titleValue: statusText,
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Donor',
                    titleValue:name??'',
                    // model.createdAt!.toIso8601String().substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Cheque No', titleValue: model.chequeNo??''),



                  CustomTitleKeyValue(
                      titleKey: 'Note ', titleValue: model.note??''),
                  AppSpace.spaceH4,
                  Divider(thickness: 2,color: Colors.grey,),

                  AppSpace.spaceH4,
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //  border: Border.all(color: Colors.teal),
                        color:Colors.grey.shade100

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [


                        Expanded(
                          child: InkWell(
                            onTap: (){
                           //   controller.getStandingRecordDetails(model.id);


                              controller.awaitingVoucherCancelCTR(model.id.toString(),model.charityId.toString());
                            },
                            child: Container(

                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.cancel,color: Colors.white),
                                  SizedBox(width: 5,),
                                  Text('Cancel '.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              )

                              /*onTap: (){
                                controller.getStandingRecordDetails(model.id);

                              }*/,
                              //text: 'View',

                              //  buttonTextStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10.h,
                                ),
                              ),
                              //  margin: EdgeInsets.only(left: 2.h, top: 10.v,bottom: 10.v),
                            ),
                          ),
                        ),
                        AppSpace.spaceW10,
                        Expanded(
                          child: InkWell(
                            onTap: (){

                              controller.awaitingVoucherConfirmCTR(model.id.toString(),model.charityId.toString());


                            },
                            child: Container(

                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.touch_app_outlined,color: Colors.white),
                                  SizedBox(width: 5,),
                                  Text('Confirm '.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              )

                              /*onTap: (){
                                controller.getStandingRecordDetails(model.id);

                              }*/,
                              //text: 'View',

                              //  buttonTextStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10.h,
                                ),
                              ),
                              //  margin: EdgeInsets.only(left: 2.h, top: 10.v,bottom: 10.v),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleftone() {
    Get.back();
  }
}
