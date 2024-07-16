import '../../core/values/app_assets.dart';
import '../../core/values/app_space.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../main.dart';
import '../donation_record_screen/controller/donation_record_controller.dart';
import 'controller/order_record_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../home_page/controller/home_controller.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'models/order_record_model.dart';

class OrderRecordScreen extends  GetWidget<OrderRecordController> {
  DonationRecordController controller1 =Get.put(DonationRecordController());
  HomeController controller2 =Get.put(HomeController());
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? userProfile = localStoreSRF.getString('userProfile');
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
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
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10,bottom: 0,right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Order List",
                      style: theme.textTheme.headlineMedium,
                    ),
                    Image.asset(AppAssets.appLogo,height: 40,width: 40,),
                  ],
                ),
              ),

              searchDonation(),
              fetchAPI()
            ],
          ),
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
          controller:controller. controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search', border: InputBorder.none),
          onChanged: controller.onSearchTextChangedOrderListSearch,
        ),
        trailing: IconButton(
          color: Colors.teal,
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controller. controllerFilter.clear();
            controller.onSearchTextChangedOrderListSearch('');
          },
        ),
      ),
    );
  }

  fetchAPI() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Obx(
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
      ),
    );
  }

  cardUI(OrderRecordModel model ) {
    print('model :: ${model.status.toString()}');
    var  statusText='';
    if(model.status.toString()=='0'){
      statusText='Pending';
    }
    else if(model.status.toString()=='1'){
      statusText='Complete';
    }
    else if(model.status.toString()=='3'){
      statusText='Cancel';
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

                  Divider(thickness: 0.2,color: Colors.teal,),

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
                            color: statusText=='Cancel'?Colors.redAccent: statusText=='Complete'? Colors.green:Colors.blue,

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
                            color: statusText=='Cancel'?Colors.redAccent:statusText=='Complete'? Colors.green:Colors.blue,

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

