import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenvini/core/values/app_space.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../main.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../side_menu_draweritem/controller/side_menu_controller.dart';
import '../../side_menu_draweritem/side_menu_draweritem.dart';
import '../controllers/single_standing_donation_records_controller.dart';

class SingleStandingDonationRecordsView
    extends GetView<SingleStandingDonationRecordsController> {
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? userProfile = localStoreSRF.getString('userProfile');
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');

  @override
  Widget build(BuildContext context) {
    List standingList = Get.arguments;
    print(standingList.toString());
    print(standingList.length);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 60.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
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

                  /*  CircleAvatar(
                    radius: 14,
                    child:Icon(Icons.person,size: 18,),),*/
                  CircleAvatar(
                    radius: 16,
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  CustomElevatedButton(
                      width: 90,
                      text: "Back",
                      onTap: () {
                        Get.back();
                      },
                      alignment: Alignment.bottomCenter),
                  AppSpace.spaceW10,
                  Text(
                    "Standing Donation Details",
                    style: theme.textTheme.headlineSmall,
                  ),
                  AppSpace.spaceW10,
                ],
              ),

              fetchAPI(standingList)
            ],
          ),
        ),
      ),
    );
  }

  fetchAPI(List standingList) {
    return Padding(
        padding: EdgeInsets.all(0), child: Center(child: 
        Image.asset('assets/images/data_not_found.png')
    )

        /* Obx(
            () => controller.orderHistoryDataList.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : controller.searchResult1.isNotEmpty || controller.controllerFilter.text.isNotEmpty
            ? ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            OrderRecordModel model =
            controller.searchResult1[index];
            print('HomePage.build ${model.amount}');

            return Container();
          },
          itemCount: controller.searchResult1.length,
          itemBuilder: (context, index) {
            OrderRecordModel model =
            controller.searchResult1[index];
            return cardUI(model);
          },
        )
            : ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            OrderRecordModel model =
            controller.orderHistoryDataList[index];
            return Container();
          },
          itemCount: controller.orderHistoryDataList.length,
          itemBuilder: (context, index) {
            OrderRecordModel model =
            controller.orderHistoryDataList[index];
            return cardUI(model);
          },
        ),
      )*/
        );
  }

  /*cardUI(OrderRecordModel model){
    var  statusText='';
    if(model.status.toString()=='0'){
      statusText='Pending';
    }else if(model.status.toString()=='3'){
      statusText='Cancel';
    }
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
                    titleKey: 'Date',
                    titleValue: model.createdAt
                        ?.toIso8601String()
                        .substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Order ID ',
                      titleValue: model.orderId.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Amount ',
                      titleValue: ' £ '+ model.amount),
                  CustomTitleKeyValue(
                    titleKey: 'Status  ',
                    titleValue:statusText,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }*/
}
