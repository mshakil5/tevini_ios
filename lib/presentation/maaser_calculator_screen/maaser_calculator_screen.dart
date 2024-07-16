import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_space.dart';

import '../../core/utils/validation_functions.dart';
import '../../core/values/app_assets.dart';
import '../../data/custom_widgets/custom_title_keyvalue.dart';
import '../../data/models/donation_calculator_model.dart';
import '../../data/models/home/dropdown_model.dart';
import '../../main.dart';
import '../donation_record_screen/models/donation_record_model.dart';
import '../home_page/controller/home_controller.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/maaser_calculator_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_icon_button.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MaaserCalculatorScreen extends GetWidget<MaaserCalculatorController> {
  SideMenuController drawerController = Get.put(SideMenuController());
  HomeController controller2 = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String? name = localStoreSRF.getString('name');
    String? userProfile = localStoreSRF.getString('userProfile');
    String? accNo = localStoreSRF.getString('accNo');
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: _scaffoldKey,
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
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.h, right: 10.0, top: 10,bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ///--------------  Total Maaser Goal done ------

                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 10, bottom: 0, right: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "msg_maaser_calculator".tr,
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

                Obx(() {
                  return Container(
                      //width: 390.h,
                     // margin: EdgeInsets.only(top: 5.v, right: 0.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                      decoration: AppDecoration.outlineGray400.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder4),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 2.h),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: double.parse(controller2
                                                      .availableDonation.value)
                                                  .toStringAsFixed(2)
                                                  .toString() +
                                              " GBP ",
                                          style: CustomTextStyles
                                              .headlineMediumSemiBold),
                                      TextSpan(
                                          text: "msg_total_maaser_goal".tr,
                                          style: CustomTextStyles
                                              .titleMediumMedium_2)
                                    ]),
                                    textAlign: TextAlign.left)),
                            AppSpace.spaceH6,
                            Padding(
                              padding: EdgeInsets.only(top: 5.v, right: 7.h),
                              child: Container(
                                height: 20.v,
                                //width: 363.h,
                                decoration: BoxDecoration(
                                    color: appTheme.teal200,
                                    borderRadius: BorderRadius.circular(4.h)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.h),
                                    child: LinearProgressIndicator(
                                        value: 0.40,
                                        backgroundColor: appTheme.teal200,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                theme.colorScheme.onError))),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h, top: 5.v),
                                child: Text(
                                    "You already paid £${double.parse(controller2.teviniDonation.value).toStringAsFixed(2).toString()} through Tevini ", //
                                    style:
                                        CustomTextStyles.titleMediumMedium_3)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 2.h, top: 2.v, bottom: 5.v),
                                child: Text(
                                    "Other Given Charity: £ ${double.parse(controller2.otherDonation.value).toStringAsFixed(2).toString()}", //
                                    style:
                                        CustomTextStyles.titleMediumMedium_2)),
                            CustomOutlinedButton(
                              alignment: Alignment.center,
                              buttonStyle: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.teal)),
                              buttonTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.error,
                                borderRadius: BorderRadius.circular(
                                  20.h,
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(AppRoutes.makeADonationOneScreen);
                              },
                              //width: 200.h,
                              height: 45.h,
                              text: "lbl_make_a_donation2".tr,
                            ),
                            AppSpace.spaceH6
                          ]));
                }),

                ///--------------One-off Income-------done ------
                addIncomeOneOff(context),

                ///---------------- Add External Donation ----------- done

                Container(
                    margin: EdgeInsets.only(top: 24.v, right: 0.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
                    decoration: AppDecoration.outlineGray400.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder4),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_add_external_donation".tr,
                              style: CustomTextStyles.titleLargeGray90022),
                          AppSpace.spaceH10,
                          Text("lbl_donation_amount".tr,
                              style: theme.textTheme.titleMedium),
                          AppSpace.spaceH6,
                          CustomTextFormField(
                            alignment: Alignment.centerLeft,
                            // isReadOnly: controller.isReadOnly.value,
                            textStyle: TextStyle(),

                            controller: controller.amountController,
                            hintText: "0.00",
                            hintStyle: TextStyle(color: Colors.grey),
                            textInputType: TextInputType.number,
                            validator: (value) {
                              return null;
                            },
                          ),
                          AppSpace.spaceH10,
                          Text("msg_donation_receiver".tr,
                              style: theme.textTheme.titleMedium),
                          AppSpace.spaceH6,
                          CustomTextFormField(
                            alignment: Alignment.centerLeft,
                            textStyle: TextStyle(),
                            controller: controller.frameOneController,
                            hintText: "msg_donation_receiver".tr,
                            hintStyle: TextStyle(color: Colors.grey),
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              return null;
                            },
                          ),
                          AppSpace.spaceH6,
                          Text("lbl_date".tr,
                              style: theme.textTheme.titleMedium),
                          AppSpace.spaceH6,
                          chooseStartingDate(context),
                          AppSpace.spaceH10,
                          CustomOutlinedButton(
                              alignment: Alignment.center,
                              height: 45,
                              onTap: () =>
                                  controller.submitAddExternalDonationBTN(),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(
                                  10.h,
                                ),
                              ),
                              buttonTextStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              text: "lbl_submit".tr),
                          AppSpace.spaceH16,
                        ])),
                AppSpace.spaceH10,

                ///------- REGULAR INCOME Update --------
                Text("lbl_regular_income".tr,
                    style: CustomTextStyles.titleLargeGray90022),

                regularIncomeFetchAPI(context),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                          alignment: Alignment.center,
                          height: 45,
                          onTap: () {
                            /// add New Interface

                            final incomeCnt = TextEditingController();
                            final descriptionCnt = TextEditingController();
                            DropdownModel? DonationSlotDropDownListObj;
                            DropdownModel? DonationPercentageDropDownObj;

                            controller.DonationSlotDropDownList.add(
                                DonationSlotDropDownListObj);
                            controller.DonationPercentageDropDownList.add(
                                DonationPercentageDropDownObj);
                            controller.incomeCont.add(incomeCnt);
                            controller.startDateList.add(DateTime.now());
                            controller.descriptionCont.add(descriptionCnt);
                            controller.donationCalculationList.add(
                              DonationCalculationModel(
                                  id: "null",
                                  incomeAmount: '',
                                  incomeTitle: '',
                                  startDate: DateTime.now(),
                                  status: '0',
                                  createdAt: DateTime.now(),
                                  createdBy: '',
                                  donorId: '',
                                  incomeSlot: '',
                                  donationPercentage: '',
                                  updatedBy: null,
                                  updatedAt: DateTime.now()),
                            );
                          },
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          buttonTextStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          text: "Add + "),
                    ),
                    AppSpace.spaceW10,
                    Expanded(
                      child: CustomOutlinedButton(
                          alignment: Alignment.center,
                          height: 45,
                          onTap: () =>
                              controller.submitUpdateAddRegularIncomeDonation(),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          buttonTextStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          text: "Update"),
                    ),
                  ],
                ),

                AppSpace.spaceH10,

                ///---REGULAR INCOME DONATION DETAILS: done  -------

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'REGULAR INCOME DONATION DETAILS',
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),

                searchDonation(),

                fetchAPIRegularIncomeDetails(context),
              ])),
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
          controller: controller.controllerFilter,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Search',
              border: InputBorder.none),
          onChanged: controller.onSearchTextChangedRegularIncome,
        ),
        trailing: IconButton(
          color: Colors.teal,
          icon: const Icon(Icons.cancel),
          onPressed: () {
            controller.controllerFilter.clear();
            controller.onSearchTextChangedRegularIncome('');
          },
        ),
      ),
    );
  }

  onTapArrowleftone() {
    Get.back();
  }

  ///------------------ Module  One-off income (Add your income)-----------

  addIncomeOneOff(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpace.spaceH10,
        Text("lbl_add_your_income".tr,
            style: CustomTextStyles.titleLargeGray90022),
        Text("lbl_one_off_income".tr,
            style: CustomTextStyles.titleMediumMedium),
        AppSpace.spaceH10,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: 5.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choose Start Date ",
                            style: theme.textTheme.titleMedium),
                        AppSpace.spaceH6,
                        chooseStartingDateAddIncome(context)
                      ]))),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_income".tr, style: theme.textTheme.titleMedium),
                    AppSpace.spaceH6,
                    CustomTextFormField(
                      // isReadOnly: controller.isReadOnly.value,

                      //width: 185.h,
                      controller: controller.incomeoneController,
                      hintText: "lbl_income".tr,
                      //textStyle: TextStyle(fontSize: 16),
                     // hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      textInputType: TextInputType.number,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ]),
            ),
          )
        ]),
        AppSpace.spaceH6,
        Text("Choose Your Percentage", style: theme.textTheme.titleMedium),
        AppSpace.spaceH6,
        donationPercentageOneOFFIncomeDropDown(),
        AppSpace.spaceH6,
        Text("lbl_description".tr, style: theme.textTheme.titleMedium),
        AppSpace.spaceH6,
        CustomTextFormField(
           // textStyle: TextStyle(fontSize: 16),
           // hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
            controller: controller.descriptiononeController,
            // margin: EdgeInsets.only(top: 2.v, right: 19.h),
            hintText: "lbl_description".tr,
            maxLines: 3,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v)),
        AppSpace.spaceH10,
        Row(children: [
          Expanded(
            child: CustomOutlinedButton(
                alignment: Alignment.center,
                height: 40,
                onTap: () => controller.submitAddIncomeBTN(),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(
                    10.h,
                  ),
                ),
                buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                text: "lbl_submit".tr),
          ),
          AppSpace.spaceW10,
          Expanded(
            child: CustomOutlinedButton(
              alignment: Alignment.center,
              height: 40,
              onTap: () => Get.toNamed(AppRoutes.donationRecordDetailsScreen,
                  arguments: controller.donationRecordDataDetailsList),
              text: "lbl_view".tr,
              margin: EdgeInsets.only(left: 20.h),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
              buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ]),
      ],
    );
  }

  /// choose Start Date  Add your Income Date Picker
  chooseStartingDateAddIncome(BuildContext context) {
    return InkWell(
      onTap: () => controller.onTapStartDateTimeAddIncomeDate(context),
      child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 3, right: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DateFormat('dd-MMM-yyyy').format(controller.startDateAddIncome),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12),
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.teal,
                size: 18,
              ),
            ],
          )),
    );
    //});
  }

  /// DropDown Donation Percentage One OFF Income
  donationPercentageOneOFFIncomeDropDown() {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200)
            //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
            ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<DropdownModel?>(
            hint: const Text('Please Select'),
            value: controller.chooseYourDonationPercentageOneOff.value,
            isExpanded: true,
            items: controller.chooseYourDonationPercentageDropDownList.value
                .map((e) => DropdownMenuItem<DropdownModel>(
                    value: e, child: Text(e.itemText)))
                .toList(),
            onChanged: (v) {
              controller.chooseYourDonationPercentageOneOff.value = v;
            },
          ),
        ),
      ),
    );
    //);
  }

  ///------------------ Module  One-off income  (End ) ----------

  /// REGULAR INCOME DONATION DETAILS: Last part Final
  /// Todo list remove
  RegularIncomeDonationDetailsUI1(DonationCalculationModel model, int index) {
    return Card(
      elevation: 12,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                      titleKey: 'Start Date',
                      titleValue:
                          DateFormat('dd-MMM-yyyy').format(model.startDate)),
                  CustomTitleKeyValue(
                    titleKey: 'Income Title',
                    titleValue: '${model.incomeTitle}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Income By',
                    titleValue: model.incomeSlot == '7' ? 'Weekly' : 'Monthly',
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Donation Percentage',
                      titleValue: model.donationPercentage.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Income Amount ',
                      titleValue: '£ ${model.incomeAmount.toString()} '),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Obx(() {
                    return Container(
                      height: 10,
                      child: CupertinoSwitch(
                        activeColor: Colors.teal,
                        value: controller.isSwitchValueList[index],
                        onChanged: (value) {
                          controller.switchValue.value = value;
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
                    onTap: () {
                      print('id : ${model.id}');
                      controller
                          .getRegularIncomeDetailsByIdView(model.id.toString());
                      // Get.toNamed(AppRoutes.donationRecordDetailsScreen,arguments: controller.donationRecordDataDetailsList);
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

  RegularIncomeDonationDetailsUI(DonationCalculationModel model, int index) {
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
                      titleKey: 'Start Date',
                      titleValue:
                          DateFormat('dd-MMM-yyyy').format(model.startDate)),
                  CustomTitleKeyValue(
                    titleKey: 'Income Title',
                    titleValue: '${model.incomeTitle}',
                  ),
                  CustomTitleKeyValue(
                    titleKey: 'Income By',
                    titleValue: model.incomeSlot == '7' ? 'Weekly' : 'Monthly',
                  ),
                  CustomTitleKeyValue(
                      titleKey: 'Donation Percentage',
                      titleValue: model.donationPercentage.toString()),
                  CustomTitleKeyValue(
                      titleKey: 'Income Amount ',
                      titleValue: '£ ${model.incomeAmount.toString()} '),
                  AppSpace.spaceH4,
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  AppSpace.spaceH4,
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //  border: Border.all(color: Colors.teal),
                        color: Colors.grey.shade100),
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
                                  controller.switchValue.value = value;

                                  controller.isSwitchValueList[index] = value;
                                  controller
                                      .switchOnOFFStandingDonation(model.id);
                                },
                              ),
                            );
                          }),
                        ),
                        Expanded(
                          child:
                          InkWell(
                            onTap: () {
                              controller.getRegularIncomeDetailsByIdView(
                                  model.id.toString());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.touch_app_outlined,
                                      color: Colors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'View ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(
                                  10.h,
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

  /// not  work
  chooseStartingDate(BuildContext context) {
    return InkWell(
      onTap: () => controller.onTapStartDateTime(context),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DateFormat('dd-MMM-yyyy').format(controller.startDate),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.teal,
                size: 18,
              ),
            ],
          )),
    );
    //});
  }

  /// DropDown Donation Percentage
  donationPercentageDropDown() {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)
              //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
              ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<DropdownModel?>(
              hint: const Text('Please Select'),
              value: controller.chooseYourDonationPercentage.value,
              isExpanded: true,
              items: controller.chooseYourDonationPercentageDropDownList.value
                  .map((e) => DropdownMenuItem<DropdownModel>(
                      value: e, child: Text(e.itemText)))
                  .toList(),
              onChanged: (v) {
                controller.chooseYourDonationPercentage.value = v;
              },
            ),
          ),
        ));
    //);
  }

  //Regular income /// todo list
  regularIncomeFetchAPI(BuildContext context) {
    var statusText = 'Confirm';
    print('OrderRecordScreen.fetchAPI');
    return Obx(
      () => controller.donationCalculationList.length == 0
          ? Center(child: Text('No Transaction'))
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.donationCalculationList.length,
              itemBuilder: (context, index) {
                DonationCalculationModel model =
                    controller.donationCalculationList[index];

                return regularIncomeUI(model, context, index);
              },
            ),
    );
  }

  fetchAPIRegularIncomeDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Obx(
        () => controller.donationCalculationListDetails.length == 0
            ? Center(child: Image.asset('assets/images/nodatafound.png'))
            : controller.searchRegularIncome.isNotEmpty ||
                    controller.controllerFilter.text.isNotEmpty
                ? ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      DonationCalculationModel model =
                          controller.searchRegularIncome[index];
                      if (model.status == '1') {
                        controller.isSwitchValueList.add(true);
                        controller.isSwitchValueList[index] = true;
                      } else {
                        controller.isSwitchValueList.add(false);
                      }
                      print('HomePage.build ${model.incomeSlot}');

                      return Container();
                    },
                    itemCount: controller.searchRegularIncome.length,
                    itemBuilder: (context, index) {
                      DonationCalculationModel model =
                          controller.searchRegularIncome[index];
                      print('stat  search :: ${model.status.toString()} ');
                      if (model.status == '1') {
                        print('search if');
                        controller.isSwitchValueList.add(true);
                        controller.isSwitchValueList[index] = true;
                      } else {
                        print('search else');
                        controller.isSwitchValueList.add(false);
                      }
                      return RegularIncomeDonationDetailsUI(model, index);
                    },
                  )
                : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      DonationCalculationModel model =
                          controller.donationCalculationListDetails[index];

                      if (model.status.toString() == '1') {
                        print('ck status :: ${model.status}');
                        controller.isSwitchValueList.add(true);
                        controller.isSwitchValueList[index] = true;
                      } else {
                        print('ck status else :: ${model.status}');
                        controller.isSwitchValueList.add(false);
                      }
                      return Container();
                    },
                    itemCount: controller.donationCalculationListDetails.length,
                    itemBuilder: (context, index) {
                      DonationCalculationModel model =
                          controller.donationCalculationListDetails[index];
                      if (model.status.toString() == '1') {
                        print('ck status :: ${model.status}');
                        controller.isSwitchValueList.add(true);
                        controller.isSwitchValueList[index] = true;
                      } else {
                        controller.isSwitchValueList.add(false);
                      }
                      return RegularIncomeDonationDetailsUI(model, index);
                    },
                  ),
      ),
    );
  }

  /// DropDown Donation Slot
  donationSlotDropDown() {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)
              //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
              ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<DropdownModel?>(
              hint: const Text('Please Select'),
              value: controller.chooseYourDonationSlotPercentage.value,
              isExpanded: true,
              items: controller.chooseYourDonationSlotDropDownList.value
                  .map((e) => DropdownMenuItem<DropdownModel>(
                      value: e, child: Text(e.itemText)))
                  .toList(),
              onChanged: (v) {
                controller.chooseYourDonationSlotPercentage.value = v;
              },
            ),
          ),
        ));
    //);
  }

  /// todo list
  regularIncomeUI(
      DonationCalculationModel model, BuildContext context, int index) {
    return Container(
      //margin: EdgeInsets.only(left: 0.h, top: 5.v, right: 0.h),
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder4,
          color: Colors.teal.shade50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          model.donorId == ''
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(''),
                    InkWell(
                      onTap: () {
                        //print('_MultiADDWithUpdateState.cardUI $index');
                        controller.donationCalculationList.removeAt(index);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 15,
                        child: Icon(
                          Icons.cancel,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          Padding(
              padding: EdgeInsets.only(top: 5.v, right: 5.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_date_from".tr,
                              style: theme.textTheme.titleMedium),
                          AppSpace.spaceH6,
                          //chooseStartingDate(context)

                          Obx(() => InkWell(
                                onTap: () => controller.onTapStartDateTimeList(
                                    context, index),
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade200)
                                        //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
                                        ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      DateFormat('dd-MMM-yyyy').format(
                                          controller.startDateList[index]),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )),
                              ))
                        ]),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_income".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 3.v),
                              /*  CustomTextFormField(

                                onChanged: (v){
                                  print('_MultiADDWithUpdateState.cardUI Title :$v');
                                  print('text  :${controller.incomeCont[index].text}');
                                  if (controller.incomeCont[index].text == '') {
                                    controller.donationCalculationList[index].incomeAmount = model.incomeAmount;
                                  } else {
                                    controller.donationCalculationList[index].incomeAmount = v;
                                  }
                                  print('c :${controller.donationCalculationList[index]}');
                                },
                                width: 185.h,
                                // isReadOnly: controller.isReadOnly.value,
                                textStyle: TextStyle(fontSize: 12),

                                controller: controller.incomeCont[index],
                                hintText: model.incomeAmount,
                                hintStyle:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  return null;
                                },
                              ),*/
                              Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1.0),
                                    ),
                                  ),
                                  child: TextFormField(
                                    onChanged: (v) {
                                      print(
                                          '_MultiADDWithUpdateState.cardUI Title :$v');
                                      print(controller
                                          .donationCalculationList[index]
                                          .incomeAmount);

                                      if (controller.incomeCont[index].text ==
                                          '') {
                                        controller
                                            .donationCalculationList[index]
                                            .incomeAmount = model.incomeAmount;
                                      } else {
                                        controller
                                            .donationCalculationList[index]
                                            .incomeAmount = v;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: controller.incomeCont[index],
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: model.incomeAmount,
                                      hintStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                      fillColor: Colors.grey,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.8,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      return null;
                                    },
                                  ))
                            ])))
              ])),
          Padding(
              padding: EdgeInsets.only(top: 5.v, right: 5.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_choose_option".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 2.v),
                              Obx(() => Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    height: 35,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade200)
                                        //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
                                        ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<DropdownModel?>(
                                        hint: const Text('Please Select'),
                                        value: controller
                                            .DonationSlotDropDownList[index],
                                        isExpanded: true,
                                        items: controller
                                            .chooseYourDonationSlotDropDownList
                                            .value
                                            .map((e) =>
                                                DropdownMenuItem<DropdownModel>(
                                                    value: e,
                                                    child: Text(e.itemText)))
                                            .toList(),
                                        onChanged: (v) {
                                          controller.DonationSlotDropDownList[
                                              index] = v;
                                          controller
                                              .donationCalculationList[index]
                                              .incomeSlot = v!.itemValue;

                                          // controller.donationCalculationList[index].incomeSlot='';
                                          //  controller.donationCalculationList[index].donationPercentage != v!.itemValue.toString();
                                        },
                                      ),
                                    ),
                                  )),
                            ]))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_choose_your_percentage".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 2.v),
                              /* CustomTextFormField(
                                                  width: 185.h,
                                                  controller: controller
                                                      .frameoneoneController,
                                                  hintText:
                                                      "msg_choose_your_percentage"
                                                          .tr)*/

                              //  donationPercentageDropDown()

                              Obx(() => Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade200)
                                        //  border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
                                        ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<DropdownModel?>(
                                        hint: const Text('Please Select'),
                                        value: controller
                                                .DonationPercentageDropDownList[
                                            index],
                                        isExpanded: true,
                                        items: controller
                                            .chooseYourDonationPercentageDropDownList
                                            .value
                                            .map((e) =>
                                                DropdownMenuItem<DropdownModel>(
                                                    value: e,
                                                    child: Text(e.itemText)))
                                            .toList(),
                                        onChanged: (v) {
                                          controller
                                                  .DonationPercentageDropDownList[
                                              index] = v;
                                          print(
                                              'Click Data : ${v!.itemValue.toString()}');
                                          controller
                                              .donationCalculationList[index]
                                              .donationPercentage = v.itemValue;
                                        },
                                      ),
                                    ),
                                  )),
                            ])))
              ])),
          SizedBox(height: 2.v),
          Text("lbl_description".tr, style: theme.textTheme.titleMedium),
          Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(1.0),
                ),
              ),
              child: TextFormField(
                maxLines: 3,
                onChanged: (v) {
                  print('_MultiADDWithUpdateState.cardUI Title :$v');
                  print(controller.donationCalculationList[index].incomeTitle);

                  if (controller.descriptionCont[index].text == '') {
                    controller.donationCalculationList[index].incomeTitle =
                        model.incomeTitle;
                  } else {
                    controller.donationCalculationList[index].incomeTitle = v;
                  }
                },
                keyboardType: TextInputType.text,
                controller: controller.descriptionCont[index],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15),
                  hintText: model.incomeTitle,
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                ),
                validator: (value) {
                  return null;
                },
              )),
          AppSpace.spaceH6
        ],
      ),
    );
  }

}
