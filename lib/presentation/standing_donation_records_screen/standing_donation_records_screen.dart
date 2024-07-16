import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../core/values/app_assets.dart';
import '../../core/values/app_space.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../data/models/standingorder_record_model.dart';
import '../../main.dart';
import '../../widgets/custom_outlined_button.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/standing_donation_records_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class StandingDonationRecordsScreen extends GetWidget<StandingDonationRecordsController> {

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
        drawer: SideMenuDraweritem(),
        appBar:
        CustomAppBar(
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
          title: Text('Acc No: $accNo',style: TextStyle(fontSize: 18,color: Colors.white),),


          actions: [
            Container(

                margin: EdgeInsets.symmetric(horizontal: 10),
                child:  Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*   Text('Acc N: 10101010',style: TextStyle(color: Colors.white),),
                SizedBox(width: 10,),*/

                  /*  CircleAvatar(
                      radius: 14,
                      child:Icon(Icons.person,size: 18,),),*/
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
                    Text(name.toString(),style: TextStyle(color: Colors.white),),
                  ],
                )
              /*   Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUserimage,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
                  height: 9.adaptSize,
                  width: 9.adaptSize,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(
                    left: 21.h,
                    top: 21.v,
                  ),
                ),
              ],
            ),*/
            ),
          ],
        ),
        body:


        SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 5.v),
              child:
                  Stack(
                    children: [
                      Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(0.0),
                              bottomLeft: Radius.circular(10.0)

                          ),
                          color: Colors.teal.withOpacity(0.2),
                        ),
                        height: 100,width: double.infinity,
                        // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        //   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10,bottom: 0,right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    "msg_standing_donation".tr,
                                    style: theme.textTheme.headlineMedium,
                                  ),
                                  Image.asset(AppAssets.appLogo,height: 40,width: 40,),
                                ],
                              ),
                            ),
                            standingDonationSearch(),
                            standingDonationFetchData(),

                                    ]),
                    ],
                  ),),
        ),
      //bottomNavigationBar:filter(context) ,
    );
  }


  /// Search Standing Donation

  /// todo list ship
  standingDonationSearch1(){
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 15),
        leading: const Icon(Icons.search,color: Colors.white,size: 16,),
        horizontalTitleGap: 0.0,
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: controller.controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
              hintText: 'Search', border: InputBorder.none),
          onChanged: controller.onSearchTextChangedStandingListSearch,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.cancel,color: Colors.white,),
          onPressed: () {
            controller.controllerFilter.clear();
            controller.onSearchTextChangedStandingListSearch('');

          },
        ),
      ),
    );

  }

  standingDonationSearch(){
    return  Container(

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)

        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 10,top: 5,bottom: 10,right: 10),
      //color: Colors.grey,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20),
        leading: const Icon(Icons.search,color: Colors.teal,size: 20,),
        horizontalTitleGap: 5.0,
        title: TextField(
          style: TextStyle(color: Colors.teal),
          controller: controller.controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search', border: InputBorder.none),
          onChanged: controller.onSearchTextChangedStandingListSearch,
        ),
        trailing: IconButton(
          color: Colors.teal,
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controller.controllerFilter.clear();
            controller.onSearchTextChangedStandingListSearch('');

          },
        ),
      ),
    );
  }

  /// standing Donation Fetch Data
  standingDonationFetchData() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Obx(
            () => controller.standOrderRecordDataList.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : controller.searchResult1.isNotEmpty || controller.controllerFilter.text.isNotEmpty
            ? ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            StandingOrderRecordModel model =
            controller.searchResult1[index];
            print('HomePage.build ${model.amount}');

            return Container();
          },
          itemCount: controller.searchResult1.length,
          itemBuilder: (context, index) {
            StandingOrderRecordModel model =
            controller.searchResult1[index];
            return cardUI(model,index);
          },
        )
            : ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            StandingOrderRecordModel model =
            controller.standOrderRecordDataList[index];
            return Container();
          },
          itemCount: controller.standOrderRecordDataList.length,
          itemBuilder: (context, index) {
            StandingOrderRecordModel model =
            controller.standOrderRecordDataList[index];
            return cardUI(model,index);
          },
        ),
      ),
    );
  }

  /// skip
  cardUI1(StandingOrderRecordModel model ,index){
    return Card(
      elevation: 12,
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
                      titleKey: 'Beneficiary',
                      titleValue: model.charityName??''),
                  CustomTitleKeyValue(
                    titleKey: 'Amount',
                    titleValue: '£ ${model.amount.toString()}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue: model.createdAt
                        .toIso8601String()
                        .substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Start Date ',
                      titleValue: model.starting
                          .toIso8601String()
                          .substring(0, 10)),
                  CustomTitleKeyValue(
                      titleKey: 'Annonymous Donation ',
                      titleValue: model.anoDonation==true?'Yes':'No'),
                  CustomTitleKeyValue(
                    titleKey: 'Charity Note ',
                    titleValue: model.charitynote,
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Note ',
                    titleValue: model.mynote,
                  ),
                ],
              ),
            ),
            Expanded(
              child:
              Column(
                children: [
                  Obx(() {
                    return Container(
                      height: 10,
                      child: CupertinoSwitch(
                        activeColor: Colors.teal,
                        value: controller.isSwitchValueList[index],
                        onChanged: (value) {

                          controller.switchValue.value=value;

                          controller.isSwitchValueList[index] = value;
                          controller.switchOnOFFStandingDonation(model.id);
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  CustomOutlinedButton(
                    onTap: (){
                      controller.getStandingRecordDetails(model.id);

                    },
                    text: 'View',
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                        10.h,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 2.h, top: 13.v),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  cardUI(StandingOrderRecordModel model ,index) {
    var statusText = 'Confirm';
    var annDonation = 'No';
    var standingOrder = 'No';
    if (model.status.toString() == '0') {
      statusText = 'Pending';
    } else if (model.status.toString() == '3') {
      statusText = 'Cancel';
    }

    if (model.anoDonation.toString() == 'true') {
      annDonation = 'Yes';
    }
    if (model.standingOrder.toString() == 'true') {
      standingOrder = 'Yes';
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
                      titleKey: 'Beneficiary',
                      titleValue: model.charityName??''),
                  CustomTitleKeyValue(
                    titleKey: 'Amount',
                    titleValue: '£ ${model.amount.toString()}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:DateFormat('dd-MMM-yyyy').format(model.createdAt)


                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Start Date ',
                      titleValue: DateFormat('dd-MMM-yyyy').format(model.starting)),
                  CustomTitleKeyValue(
                      titleKey: 'Annonymous Donation ',
                      titleValue: model.anoDonation==true?'Yes':'No'),
                  CustomTitleKeyValue(
                    titleKey: 'Charity Note ',
                    titleValue: model.charitynote,
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Note ',
                    titleValue: model.mynote,
                  ),

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
                          child: Obx(() {
                            return Container(

                              child: CupertinoSwitch(
                                activeColor: Colors.teal,
                                value: controller.isSwitchValueList[index],
                                onChanged: (value) {
                          
                                  controller.switchValue.value=value;
                          
                                  controller.isSwitchValueList[index] = value;
                                  controller.switchOnOFFStandingDonation(model.id);
                                },
                              ),
                            );
                          }),
                        ),
                        
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              controller.getStandingRecordDetails(model.id);

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
                                  Text('View ',style: TextStyle(fontWeight: FontWeight.bold),),
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

}
