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
import 'controller/donation_record_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DonationRecordScreen extends StatelessWidget {
  DonationRecordController controller1 = Get.put(DonationRecordController());
  HomeController controller = Get.put(HomeController());
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
      body:

      SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
         //   padding: EdgeInsets.symmetric(vertical: 1.v),
            child: Stack(
              children:
              [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 0,right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Donation Record",
                            style: theme.textTheme.headlineMedium,
                          ),
                          Image.asset(AppAssets.appLogo,height: 40,width: 40,),
                        ],
                      ),
                    ),
                    searchDonation(),
                    fetchDonationRecord(),
                  ],
                ),

              ]
               ),
          ),
        ),
    );

  }

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
              onTap: () => controller.onTapStartDateTime(context),
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
                      DateFormat('dd-MMM-yyyy').format(controller.startDate),
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
              onTap: () => controller.onTapEndDateTime(context),
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
                      DateFormat('dd-MMM-yyyy').format(controller.endDate),
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
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                print('startDate $startDate');
                print('endDate $endDate');
                List<DonationRecordModel> data = controller.itemsBetweenDates(
                    dates: controller.donationRecordDataList,
                    start: startDate,
                    end: endDate);

                // setState(() {
                //   _searchResult1 = data;
                //  });
              },
              child: Center(
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  fetchDonationRecord() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Obx(
        () => controller.donationRecordDataList.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : controller.searchResult1.isNotEmpty ||
                    controllerFilter.text.isNotEmpty
                ? ListView.separated(
        //  reverse:true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      DonationRecordModel model =
                          controller.searchResult1[index];
                      print('HomePage.build ${model.amount}');

                      return Container();
                    },
                    itemCount: controller.searchResult1.length,
                    itemBuilder: (context, index) {
                      DonationRecordModel model =
                          controller.searchResult1[index];
                      return donationRecordCardUI(model);
                    },
                  )
                : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
       //   reverse:true,
                    separatorBuilder: (context, index) {
                      DonationRecordModel model =
                          controller.donationRecordDataList[index];
                      return Container();
                    },
                    itemCount: controller.donationRecordDataList.length,
                    itemBuilder: (context, index) {
                      DonationRecordModel model =
                          controller.donationRecordDataList[index];
                      return donationRecordCardUI(model);
                    },
                  ),
      ),
    );
  }

  /// Search Donation
  searchDonation(){
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
          controller: controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search', border: InputBorder.none),
          onChanged: controller.onSearchTextChanged,
        ),
        trailing: IconButton(
          color: Colors.teal,
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controllerFilter.clear();
            controller.onSearchTextChanged('');
          },
        ),
      ),
    );
  }


  /// Donation Fetch Data
  donationRecordCardUI(DonationRecordModel model) {
    print('ck :: ${model.charityName}');
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
                      titleKey: 'Beneficiary', titleValue: model.charityName??''),
                  CustomTitleKeyValue(
                    titleKey: 'Amount',
                    titleValue: '£ ${model.amount.toString()}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Date',
                    titleValue:
                    model.createdAt!.toIso8601String().substring(0, 10),
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Standing Order', titleValue: standingOrder),
                  CustomTitleKeyValue(
                      titleKey: 'Annonymous  ', titleValue: annDonation),
                  CustomTitleKeyValue(
                    titleKey: 'Charity Note ',
                    titleValue: model.charitynote==null?'No Charity Note':model.charitynote.toString(),
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Note ',
                    titleValue: model.mynote==null?'No Note ':model.mynote.toString(),
                  ),
                  AppSpace.spaceH4,
                  Divider(thickness: 1,color: Colors.teal,),

                  AppSpace.spaceH4,
                  Container(
                    //height: 50.h,
                    width: double.infinity,
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.teal),
                      color:Colors.white

                    ),
                    child: Row(
                      children: [

                        Text(

                          'Status :',
                          style:  TextStyle(

                            fontWeight: FontWeight.bold,
                           fontSize: 14,
                            color: statusText=='Cancel'?Colors.redAccent:Colors.green,

                          ),
                        ),
                        SizedBox(width: 10,),
                        CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.teal.shade300,
                            child:
                            statusText=='Cancel'?Icon(Icons.close,size: 16):Icon(Icons.done_all,size: 16,),
                            //  Icon(size: 14,)

                          ),
                        SizedBox(width: 5),
                        Text(

                          '$statusText',


                          style:  TextStyle(

                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: statusText=='Cancel'?Colors.redAccent:Colors.green,

                          ),
                        ),
                        SizedBox(width: 10,),

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


