import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tenvini/core/values/app_space.dart';

import '../../core/values/app_assets.dart';
import '../../data/models/home/dropdown_model.dart';
import '../../main.dart';
import '../home_page/controller/home_controller.dart';
import '../make_a_donation_screen/models/make_a_donation_model.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/make_a_donation_one_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_checkbox_button.dart';
import 'package:tenvini/widgets/custom_drop_down.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MakeADonationOneScreen extends GetWidget<MakeADonationOneController> {
  SideMenuController drawerController = Get.put(SideMenuController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');

  DateTime startDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  DateTime endDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  //HomeController controller2 = Get.find();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
                  /*   Text('Acc N: 10101010',style: TextStyle(color: Colors.white),),
                SizedBox(width: 10,),*/

               /*   CircleAvatar(
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 0,top: 10,bottom: 0,right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "msg_make_a_donation_standing".tr,
                      style: theme.textTheme.headlineMedium,
                    ),
                   ],
                ),
              ),

             Obx(()=>
                 Row(
               children: [
                 Text("lbl_account_balance".tr, style: theme.textTheme.titleLarge),
                 Text(" ${controller.currentBalance.value} GBP", style: theme.textTheme.headlineMedium),
               ],),
            ),

              AppSpace.spaceH10,
              Text("lbl_beneficiary".tr, style: theme.textTheme.titleLarge),

              AppSpace.spaceH10,
              searchBoxDropDown(context),

              AppSpace.spaceH10,
              Text("lbl_amount".tr, style: theme.textTheme.titleLarge),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextFormField(
                        controller: controller.amountController,
                        hintText: "lbl_00_00".tr,
                        //hintStyle: theme.textTheme.titleMedium,
                        textStyle: TextStyle(fontSize: 18),
                        hintStyle: TextStyle(fontSize: 18),
                        textInputType: TextInputType.number,
                      ),
                    ),

                    AppSpace.spaceW10,
                    Expanded(
                      child: Text("lbl_gbp".tr,
                          style: CustomTextStyles.headlineMediumSemiBold),
                    ),

                  ]),


              AppSpace.spaceH10,

              Text("msg_please_note_that".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium),
              AppSpace.spaceH10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Obx(() => CustomCheckboxButton(
                      // text: "msg_set_up_a_standing".tr,
                        value: controller.makeAnonymous.value,
                        onChange: (value) {
                          print('MakeADonationOneScreen.build >>> ${value}');
                          controller.makeAnonymous.value = value;
                        })),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text('msg_make_this_an_anonymous'.tr,
                          style: theme.textTheme.titleLarge))
                ],
              ),


              AppSpace.spaceH20,
              /// Set up a Standing Order
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Obx(() => CustomCheckboxButton(
                        // text: "msg_set_up_a_standing".tr,
                        value: controller.setUpStandingOr.value,
                        onChange: (value) {
                          print('MakeADonationOneScreen.build >>> ${value}');
                          controller.setUpStandingOr.value = value;
                        })),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text('msg_set_up_a_standing'.tr,
                          style: theme.textTheme.titleLarge))
                ],
              ),

              /// Working Extra
              /// .................................................................

              Obx(() {
                return controller.setUpStandingOr.value == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            AppSpace.spaceH10,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 5.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("lbl_payments".tr,
                                                    style: theme.textTheme.titleLarge),
                                                AppSpace.spaceH6,
                                                standingPaymentsDropDown(),
                                              ]))),
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "msg_number_of_payments".tr,
                                                    style: theme
                                                        .textTheme.titleLarge),
                                                AppSpace.spaceH6,
                                                Obx(() => controller
                                                            .selectPayments
                                                            .value ==
                                                        null
                                                    ? CustomTextFormField(
                                                    textInputType:TextInputType.number,

                                                        width: 185.h,
                                                        controller: controller.londonController,
                                                  //  textStyle: TextStyle(fontSize: 14),
                                                        hintText: "")
                                                    : controller
                                                                .selectPayments
                                                                .value!
                                                                .itemValue ==
                                                            '3'
                                                        ? dummeyController()
                                                        : CustomTextFormField(
                                                    textInputType:TextInputType.number,
                                                            width: 185.h,
                                                            controller: controller.londonController,
                                                            hintText: "0.0",
                                                       //    textStyle: TextStyle(fontSize: 16),
                                                          hintStyle: TextStyle(fontSize: 14),

                                                ))
                                              ])))
                                ]),
                            AppSpace.spaceH10,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.v, right: 5.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("lbl_starting".tr,
                                                    style: theme
                                                        .textTheme.titleLarge),
                                                AppSpace.spaceH6,
                                                startingDate(context)
                                              ]))),
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("lbl_interval".tr,
                                                    style: theme
                                                        .textTheme.titleLarge),
                                                AppSpace.spaceH6,
                                                intervalDropDown(),
                                              ])))
                                ]),
                          AppSpace.spaceH10,
                            Text("lbl_total".tr,
                                style: theme.textTheme.titleLarge),
                          AppSpace.spaceH10,
                            dummeyControllerTotal(),
                          ])
                    : Container();
              }),

              SizedBox(height: 5.v),


              /// Notes
              Text("msg_notes_to_charity".tr,
                  style: theme.textTheme.titleLarge),
              SizedBox(height: 5.v),

              CustomTextFormField(
                  controller: controller.frameoneoneController,
                  //  hintText: "msg_write_your_notes".tr,
                  hintStyle: theme.textTheme.titleLarge,
                  textStyle: theme.textTheme.titleLarge,
                  textInputAction: TextInputAction.done,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 23.v)),
              SizedBox(height: 5.v),
              Text("lbl_my_notes".tr, style: theme.textTheme.titleLarge),
              SizedBox(height: 5.v),
              CustomTextFormField(
                  controller: controller.writeyourController,
                  // hintText: "msg_write_your_notes2".tr,
                  hintStyle: theme.textTheme.titleLarge,
                  textStyle: theme.textTheme.titleLarge,
                  textInputAction: TextInputAction.done,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 23.v)),
              SizedBox(height: 10.v),
              /// confirm
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Obx(() => CustomCheckboxButton(
                      //text: "msg_set_up_a_standing".tr,
                        value: controller.isConfirm.value,
                        onChange: (value) {
                          print('MakeADonationOneScreen.build >>> ${value}');
                          controller.isConfirm.value = value;
                        })),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text('msg_i_confirm_that_this'.tr,
                          style: theme.textTheme.titleMedium))
                ],
              ),
              AppSpace.spaceH20,
              makeBTN()
              ,
              AppSpace.spaceH20,
            ],
          ),
        ),
      ),

    );
  }

  intervalDropDown() {
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
              //value: controller.selectedClientType.value,
              value: controller.StrselectedClientType.value,
              isExpanded: true,
              items: controller.scriptClientTypeDropDownList1.value
                  .map((e) => DropdownMenuItem<DropdownModel>(
                      value: e, child: Text(e.itemText)))
                  .toList(),
              onChanged: (v) {
                print('_MyAppState.tt >> ${v!.itemText.toString()}');
                controller.StrselectedClientType.value = v;

                // controller.getGradeApprovalList();
              },
            ),
          ),
        ));
    //);
  }

  standingPaymentsDropDown() {
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
                  //value: controller.selectedClientType.value,
                  value: controller.selectPayments.value,
                  isExpanded: true,
                  items: controller.selectedPaymentList.value
                      .map((e) => DropdownMenuItem<DropdownModel>(
                          value: e, child: Text(e.itemText)))
                      .toList(),
                  onChanged: (v) {
                    print('_MyAppState.tt >> ${v!.itemText.toString()}');
                    controller.selectPayments.value = v;
                    controller.londonController.text='';
                    controller.totalAmount.value=double.parse(controller.amountController.text);

                    // controller.getGradeApprovalList();
                  },
                ),
              ),
            )
        // ),
        );
  }

  makeBTN() {
    return CustomOutlinedButton(
      alignment: Alignment.center,
      buttonStyle:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
      buttonTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      decoration: BoxDecoration(
        color: theme.colorScheme.error,
        borderRadius: BorderRadius.circular(
          20.h,
        ),
      ),
      onTap: () => controller.makeBtn(),
      //width: 200.h,
      height: 50.h,
      text: "Make Donation",
    );
  }

  searchBoxDropDown(BuildContext context) {
    return Obx(() {
      print('.searchBoxDropDown ${controller.makeADonationModelObj.length}');
      return Container(


        decoration:BoxDecoration(


          borderRadius: BorderRadius.circular(
            5.h,
          ),

            ),
        child: DropdownSearch<BeneficiaryGetAllCharityModel>(

          clearButtonProps: ClearButtonProps(

              isVisible: true,color: Colors.white,padding:EdgeInsets.all(5) ),
          itemAsString: (v) => v.name,
          asyncItems: (v) => controller.getData(),

          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            onDismissed: (){
           //   controller.makeADonationModelObj.clear();
            },
            showSelectedItems: false,
            searchFieldProps: TextFieldProps(
              style: TextStyle(color: Colors.black, fontSize: 12),
              controller: TextEditingController(),
            ),
            itemBuilder: _customPopupItemBuilder,
            fit: FlexFit.tight,
            showSearchBox: true,
          ),
          onChanged: (dataValue) {
            controller.selectedItem.value=dataValue!.name??'';
            controller.benifiID.value = dataValue!.id;
            controller.isClearDropdown.value=false;


          },


          compareFn: (item, sItem) {

            controller.benifiID.value = item.id;
            print('_MyHomePageState.build sItem >> ${sItem.name}');
            return item.name == sItem.name;
          },
          dropdownDecoratorProps: DropDownDecoratorProps(



            baseStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
            dropdownSearchDecoration: InputDecoration(



              enabledBorder: InputBorder.none,
              labelText: controller.isClearDropdown.value? '':'Select an option *',
              labelStyle: TextStyle(color: Colors.white, fontSize: 14),
              contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5),

              filled: true,
              fillColor: theme.primaryColor,
            ),
          ),
        ),
      );
    });
  }

  Widget _customPopupItemBuilder(BuildContext context,
      BeneficiaryGetAllCharityModel item, bool isSelected) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 0),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(0),
              color: Colors.red,

            ),
      child: ListTile(
        selected: isSelected,
        title: Container(
          decoration:   BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)
            ),
            color: Colors.teal.shade200,
          //  color: Colors.white,
          ),

          padding: EdgeInsets.all(20),
          child: Text(
            item.name + '(${item.accNo})',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ),
        //subtitle: Text(item.email),
      ),
    );
  }

  ///  Start Date UI
  startingDate(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () => controller.onTapStartDateTime(context),
        child: Container(
           // height: 35,
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white, border: Border.all(color: Colors.grey.shade200)),
            alignment: Alignment.center,
            child: Text(
              DateFormat('dd-MMM-yyyy').format(controller.startDate.value),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
            )),
      );
    });
  }

  datePicker(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => controller.onTapStartDateTime(context),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  //    color: Colors.greenAccent, border: Border.all()
                  color: Colors.white,
                  border: Border.all()),
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  controller.getFormatedDate(startDate),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => controller.onTapEndDateTime(context),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.greenAccent, border: Border.all()),
              child: Obx(
                () => Text(
                  controller.getFormatedDate(endDate),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.green),
          child: IconButton(
              onPressed: () {
//controller.getAccessoriesRequisitionList
              },
              icon: const Icon(Icons.search, color: Colors.white)),
        ),
      ],
    );
  }

  dummeyController() {
    return Container(
      width: 185.h,
      height: 35,
      child: TextFormField(
          readOnly: true,
          style: CustomTextStyles.labelLargeErrorContainer_1,
          decoration: InputDecoration(

            hintStyle: TextStyle(fontSize: 18),
            contentPadding: EdgeInsets.all(9.h),
            /* fillColor: fillColor ?? appTheme.gray50,
          filled: filled,*/
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            errorStyle: TextStyle(color: Colors.red),
          )),
    );
  }

  dummeyControllerTotal() {
    return Obx(() {
      var amount =controller.amountController.text==''?'1':controller.amountController.text;
      var payment = controller.londonController.text==''?'1':controller.londonController.text;


      if (controller.setUpStandingOr.value) {

      if(payment=='0'||payment=='1'||payment==''){
        controller.totalAmount.value = double.parse(amount) * double.parse('0');
      }else{
        controller.totalAmount.value = double.parse(amount) * double.parse(payment);
      }

      }
      else {
        controller.totalAmount.value = double.parse(amount);
      }

      return Container(
        height: 35,
        child: TextFormField(
            readOnly: true,
            style: CustomTextStyles.labelLargeErrorContainer_1,
            decoration: InputDecoration(
              hintText: controller.totalAmount.value.toString(),
              hintStyle: TextStyle(fontSize: 20),
              contentPadding: EdgeInsets.all(9.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.h),
                borderSide: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.h),
                borderSide: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.h),
                borderSide: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 1,
                ),
              ),
              errorStyle: TextStyle(color: Colors.red),
            )),
      );
    });
  }
}
