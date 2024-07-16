

import 'package:tenvini/core/values/app_space.dart';
import 'package:tenvini/data/models/home/dashboard_model.dart';
import 'package:tenvini/presentation/side_menu_draweritem/controller/side_menu_controller.dart';
import '../../core/values/app_assets.dart';
import '../../currency/currency_screen.dart';
import '../../currency/model/rates_model.dart';
import '../../currency/widgets/conversion_card.dart';
import '../../main.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home_page/widgets/donationrow_item_widget.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/home_controller.dart';

import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';

import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> homeScaffoldKey = new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? balance = localStoreSRF.getString('balance');
  String? userProfile = localStoreSRF.getString('userProfile');

  @override
  Widget build(BuildContext context) {
    print('HomePage.build User Profile :$userProfile');
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
     // backgroundColor: Colors.grey.shade200,
        key: homeScaffoldKey,
        drawer: SideMenuDraweritem(),
        appBar:
        CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              print('HomePage.build');
              homeScaffoldKey.currentState?.openDrawer();
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

                    /*CircleAvatar(
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
        body: Obx(() {
          print(controller.count.value);
          return SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              //padding: EdgeInsets.only(top: 20.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    width: Get.size.width,
                    child: Stack(

                      // alignment: Alignment.bottomCenter,
                      children: [
                        accountBalance(),
                          Align(
                          alignment: Alignment.bottomCenter,
                          child:
                          Container(
                            margin: EdgeInsets.only(

                              top: Get.size.width/1.5,
                              right: 5.h,
                              left: 5.h,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.v),
                            decoration: AppDecoration.outlineGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               /* InkWell(
                                  onTap: () {
                                    Get.snackbar('Alert', 'Next Version is coming');
                                   // Get.toNamed(AppRoutes.makeADonationOneScreen);

                                    //Get.toNamed(AppRoutes.makeADonationScreen);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant
                                              .imgCut,
                                          height: 30.adaptSize,
                                        //  width: 25.adaptSize,
                                        ),
                                        Text(
                                          "Transfer To TDF",
                                          style: CustomTextStyles
                                              .titleSmallBlack900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRoutes.makeADonationOneScreen);

                                    //Get.toNamed(AppRoutes.makeADonationScreen);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant
                                              .imgFramePrimarycontainer,
                                          height: 30.adaptSize,
                                        //  width: 24.adaptSize,
                                        ),
                                        Text(
                                          "lbl_make_a_donation".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),*/
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRoutes.orderVoucherBooksScreen);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgCut,
                                          height: 30.adaptSize,
                                        //  width: 25.adaptSize,
                                        ),
                                        Text(
                                          "msg_order_voucher_books".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.contactTopUpScreen);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgFile,
                                          height: 30.adaptSize,
                                         // width: 30.adaptSize,
                                        ),
                                        Text(
                                          "lbl_top_up_account".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                 AppSpace.spaceH6,
                  ///--------- New Feature -----------

                  controller.isTDF.value==true?
                  transferToTDF():Container(),

                  ///----------- End -----------------
                  SizedBox(height: 5.v),



                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    decoration: AppDecoration.fillTeal.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "msg_gift_aid_donations".tr,
                          style: CustomTextStyles.displaySmallBlackA700,
                        ),
                        SizedBox(height: 9.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "msg_gift_aid_donations3".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              ' £ '+ controller.getUserInfo.value.expected_gift_aid.toString(),
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 3.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "msg_gift_aid_donations1".tr,
                              style: theme.textTheme.titleMedium,
                            ),

                            Text(
                              ' £ '+controller.thisTax.value.toString(),
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 9.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "msg_gift_aid_donations2".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              ' £ '+ controller.lastTax.value.toString(),
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 9.v),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_latest_transactions".tr,
                          style: CustomTextStyles.headlineSmallMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.v,
                            bottom: 6.v,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.allTransactionScreen);
                            },
                            child: Text(
                              "lbl_view_all".tr,
                              style:
                                  CustomTextStyles.headlineSmallMedium1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Latest Transactions
                  latestTransactionData(),
                  AppSpace.spaceH10,
                ],
              ),
            ),
          );
        }),


    );



  }

  ///---------------------------
  accountBalance(){
    return Container(
        width: double.infinity,

        padding: EdgeInsets.only(right: 10,left: 10,bottom: 20),
        color: Colors.teal,
        // alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /// userName
                             Text('Welcome ${name??''}',
                                style: TextStyle(
                      
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            AppSpace.spaceH6,
                            /// Button
                            InkWell(
                                onTap: (){
                                  print('HomePage.accountBalance');
                                  controller.changeState();
                                },
                                child: Container(
                                    width: 160,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)),
                                    child:
                                    Stack(alignment: Alignment.center, children: [
                                      /// ৳ 50.00
                                    Obx(()=>AnimatedOpacity(
                      
                                        opacity:controller.isBalanceShown.value==false?0:1,
                                        //_isBallanceShown ? 1 : 0,
                      
                                        duration: const Duration(milliseconds: 500),
                                        child:  Text('${ '${controller.currentBalance.value??''} GBP' /*balance.toString()*/} ',
                                            style: TextStyle(
                                                color: Colors.teal,fontSize: 11))),),
                      
                      
                                      /// ব্যালেন্স দেখুন
                                      Obx(()=>AnimatedOpacity(
                                          opacity:
                                          controller.isBalance.value==false?0:1,
                                          //controller.isBallance ? 1 : 0,
                                          duration: const Duration(milliseconds: 300),
                                          child:  Text("Account Balance",
                                              style: TextStyle(
                                                  color: Colors.teal, fontSize: 10))),),
                      
                      
                                      /// Circle
                                      Obx(()=> AnimatedPositioned(
                                          duration: const Duration(milliseconds: 1100),
                                          left: controller.isAnimated.value==false?5:135,
                                          //_isAnimated == false ? 5 : 135,
                                          curve: Curves.fastOutSlowIn,
                                          child: Container(
                                              height: 20,
                                              width: 20,
                                              // padding: const EdgeInsets.only(bottom: 4),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.teal,
                                                  borderRadius:
                                                  BorderRadius.circular(50)),
                                              child: const FittedBox(
                                                  child: Text('£',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17)))))),
                      
                                    ]))),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Pending Balance:  "+"${double.parse(controller.pendingTransaction.value).toStringAsFixed(2)}"+" GBP",
                                style: CustomTextStyles
                                    .labelLargeWhiteA700SemiBold,
                              ),
                            ),
                          ]),
                    ),
                    Expanded(child: appLogo())
                  ]),
            ),
            AppSpace.spaceH16,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgImageCard,
                    fit: BoxFit.fill,
                    radius: BorderRadius.circular(
                      0.h,
                    ),
                  ),
                ),

                AppSpace.spaceW6,
                Expanded(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomOutlinedButton(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                     //   Get.toNamed(AppRoutes.orderACardPage);
                        Get.toNamed(AppRoutes.tiviniCardWebView);
                      },
                      text: "lbl_order_a_card".tr,
                      buttonStyle: CustomButtonStyles.outlineWhiteA,
                    ),
                    AppSpace.spaceH10,
                    CustomOutlinedButton(
                      onTap: () {
                        Get.toNamed(
                        AppRoutes.makeADonationOneScreen);
                        //OrderACardTabContainerScreen
                      },

                      text: "lbl_make_a_donation".tr,

                      buttonStyle:
                      CustomButtonStyles.outlineWhiteA,
                    ),
                    AppSpace.spaceH10,
                    CustomOutlinedButton(
                      onTap: () {
                        print('HomePage.accountBalance');
                        print(controller.isTDF.value);
                        //Get.snackbar('Alert', 'Coming Soon...',backgroundColor: Colors.yellow);

                        if(controller.isTDF.value==true){
                          controller.isTDF.value=false;
                        }else{
                          controller.isTDF.value=true;
                        }
                      },

                      text: "Transfer To TDF",

                      buttonStyle:
                      CustomButtonStyles.outlineWhiteA,
                    )
                  ],
                 )
                )
              ],
            ),
            AppSpace.spaceH30,
          ],
        ),
    );
  }
  Widget userLogo() => CircleAvatar(
      radius: 20,
      backgroundColor: Colors.green.shade50,
      child: const Icon(Icons.person, color: Colors.teal, size: 28));
  Widget appLogo() =>
      SizedBox( child:Image.asset(AppAssets.appLogo,height: 70,),);
  ///---------------------------
  latestTransactionData() {
    print('HomePage.latestTransactionData');
    print('latest :: ${controller.leastTransaction.length}');
    return Padding(
      padding: EdgeInsets.all(10),
      child: Obx(
        () => controller.leastTransaction.length == 0
            ? Center(child: Image.asset('assets/images/data_not_found.png'))
            : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  TransactionModel model = controller.leastTransaction[index];

                  return Container();
                },
                itemCount: controller.leastTransaction.length >= 5
                    ? 5
                    : controller.leastTransaction.length,
                itemBuilder: (context, index) {
                  TransactionModel model = controller.leastTransaction[index];


                  return DonationrowItemWidget(model);
                },
              ),
      ),
    );
  }
  transferToTDF(){
    print(controller.ratesModel.toString());
    return Form(
      child: Container(

        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
        child: Column(children: [

          currencyConvert(),

          AppSpace.spaceH6,
          SizedBox(

              width: double.maxFinite,
              child: Stack(alignment: Alignment.bottomCenter, children: [

                Align(
                    alignment: Alignment.bottomCenter,
                    child:
                    Container(

                        margin: EdgeInsets.only(
                            left: 0.h, right: 0.h, bottom: 10.v, top: 0.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 10.v),
                        decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("TDF Account Number",
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 3.v),
                              CustomTextFormField(

                               // textStyle: TextStyle(fontSize: 15),
                                controller: controller.tdfAccNumberController,
                                hintText: "TDF Account Number",
                                hintStyle:
                                CustomTextStyles.labelLargeErrorContainer,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {

                                  return null;
                                },
                              ),
                              SizedBox(height: 3.v),
                              Text("Amount to Transfer",
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 3.v),

                                  CustomTextFormField(
                                  controller: controller.tdfAccToTransferController,
                                  hintText: "Amount to Transfer",
                                //  textStyle: TextStyle(fontSize: 15),
                                  hintStyle: CustomTextStyles.labelLargeErrorContainer,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.number,

                                  suffixConstraints:
                                  BoxConstraints(maxHeight: 36.v),
                                  validator: (value) {
                                    if (value == null
                                    //    || (!isValidPassword(value, isRequired: true))
                                    ) {
                                      return "Please enter valid ";
                                    }
                                    return null;
                                  },
                                //  obscureText: controller.isShowPassword.value,
                                  contentPadding: EdgeInsets.only(
                                      left: 10.h, top: 9.v, bottom: 9.v)),

                              AppSpace.spaceH50,

                            ]))),
                CustomElevatedButton(
                    width: Get.width / 1.5,
                    text: "Transfer To TDF",
                    onTap: () {
                        controller.tdfToTransferDonation();
                        FocusManager.instance.primaryFocus?.unfocus();
                     },
                    alignment: Alignment.bottomCenter)
              ])),
          AppSpace.spaceH14,


        ]),
      ),
    );
  }
  currencyConvert(){
    return FutureBuilder<RatesModel>(
      future: controller.ratesModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return FutureBuilder<Map>(
            future: controller.currenciesModel,
            builder: (context, index) {
              if (index.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (index.hasError) {
                return Center(child: Text('Error: ${index.error}'));
              } else if (index.data == null) {
                return const Center(child: Text('No data available'));
              } else {
                return ConversionCard(
                  rates: snapshot.data!.rates,
                  currencies: index.data!,
                );

              }
            },
          );
        }
      },
    );
  }
}




