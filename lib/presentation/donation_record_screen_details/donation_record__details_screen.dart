
import 'package:intl/intl.dart';
import 'package:tenvini/presentation/donation_record_screen/models/donation_record_model.dart';

import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../data/models/donation_details_model.dart';
import '../../main.dart';
import '../../widgets/custom_elevated_button.dart';
import '../home_page/controller/home_controller.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/donation_record_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DonationRecordScreenDetails extends StatelessWidget {

  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _DonationScaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController controllerFilter = TextEditingController();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');

  List<DonationDetailsModel> details =Get.arguments;

  @override
  Widget build(BuildContext context) {
    print('details lng :: ${details.length}');

    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key:_DonationScaffoldKey ,
      resizeToAvoidBottomInset: true,
      drawer: SideMenuDraweritem(),
      appBar: CustomAppBar(
        height: 75.v,
        leadingWidth: 39.h,
        leading: AppbarImage(
          svgPath: ImageConstant.imgFrameGray900,
          onTap: () {
            print('HomePage.build');
            _DonationScaffoldKey.currentState?.openDrawer();
          },

        ),
        centerTitle: true,
        title: Text(
          'Acc No: $accNo',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(

                   // backgroundColor: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: CustomImageView(
                       // placeHolder: ImageConstant.imgHolder,
                        url: ImageConstant.imageProfilePath+'${userProfile}',
                        //    imagePath: ImageConstant.imgImage14,

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
                    Row(
                      children: [
                        CustomElevatedButton(
                            width: 60,
                            text: "Back",
                            onTap: () {
                              Get.back();
                            },
                            alignment: Alignment.bottomCenter),

                        SizedBox(width: 10,),

                        Text(
                          "lbl_donation_record_details".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              fetchDonationRecord(details),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: filter(context),
    );
  }

  fetchDonationRecord( donationRecordDataDetailsList) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Obx(
        () => donationRecordDataDetailsList.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
    DonationDetailsModel model =
                          donationRecordDataDetailsList[index];
                      return Container();
                    },
                    itemCount: donationRecordDataDetailsList.length,
                    itemBuilder: (context, index) {
    DonationDetailsModel model = donationRecordDataDetailsList[index];

                      return donationRecordCardUI(model);
                    },
                  ),
      ),
    );
  }
}

donationRecordCardUI(DonationDetailsModel model)  {
  print('model title :${model.toJson()}');
  print('model ${model.incomeSlot.toString()}');
  String slot='';
  if(model.incomeSlot.toString()=='30'){
    slot='Monthly';
  }else if(model.incomeSlot=='7'){
    slot='Weekly';
  }else{
    slot='One-Off';
  }
  return Container(
    color: Colors.white,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                DateFormat('dd-MMM-yyyy').format(model.date),

              ),
              CustomTitleKeyValue(
                  titleKey: 'Income By ', titleValue: slot,),
              CustomTitleKeyValue(
                titleKey: 'Income Amount',
                titleValue: '£ ${model.incomeAmount.toString()}',
              ),
              CustomTitleKeyValue(
                  titleKey: 'Donation Amount', titleValue: model.donationAmount.toString()),

            ],
          ),
        ),
      ],
    ),
  );
}
