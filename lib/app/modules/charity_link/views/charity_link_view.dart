import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tenvini/core/app_export.dart';

import '../../../../core/utils/validation_functions.dart';
import '../../../../main.dart';
import '../../../../widgets/app_bar/appbar_image.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_outlined_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../controllers/charity_link_controller.dart';

class CharityLinkView extends GetView<CharityLinkController> {
  final GlobalKey<ScaffoldState> charityKeyLink = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String? name = localStoreSRF.getString('name');
    String? accNo = localStoreSRF.getString('accNo');

    String? userProfile = localStoreSRF.getString('userProfile');
    return Scaffold(

      key:charityKeyLink ,
        drawer: charity_drawer(),
        appBar: CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              print('HomePage.build');
              charityKeyLink.currentState?.openDrawer();
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
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.charityProfile);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
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
                      Text(
                        name.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      body:
      Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Text("Send a link", style: theme.textTheme.headlineSmall),
              SizedBox(height: 10.v),
              Divider(height: 1,thickness: 1,color: Colors.grey,),
              SizedBox(height: 10.v),
              Text("lbl_full_name".tr, style: theme.textTheme.titleMedium),
              SizedBox(height: 3.v),
              CustomTextFormField(
                //  textStyle: TextStyle(fontSize: 16),
            
            
                  controller: controller.nameController,
                  hintText: 'Name'
              ),
              SizedBox(height: 14.v),
              Text("lbl_email_address".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 3.v),
              CustomTextFormField(
                  //textStyle: TextStyle(fontSize: 16),
            
                  controller: controller.mailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value,
                            isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  }),
              SizedBox(height: 15.v),
              Text("Amount",
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 2.v),
              CustomTextFormField(
                  textInputType: TextInputType.number,
                //  textStyle: TextStyle(fontSize: 16),
            
                  controller: controller.amountController,
                  hintText: ""),
              SizedBox(height: 15.v),
            
              CustomElevatedButton(
            
                  width: Get.width / 2.5,
                  text:  "Send",
                  onTap: () {
                    /// Update Code
                    controller.charitySendALinkSubmit();
                  },
                  alignment: Alignment.bottomCenter),
            
              SizedBox(height: 24.v),
            ],
                  ),
          ),
        ),)
    );
  }

  charity_drawer(){
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderLR80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              alignment: Alignment.center,
              imagePath: ImageConstant.imgNewlogo12,
              color: Colors.teal,
              height: 39.v,

              width: 132.h,
              margin: EdgeInsets.only(left: 26.h),
            ),
            SizedBox(height: 20),
            drawerMenuItem(0, ImageConstant.imgNavhome, "Dashboard".tr),
            divLine(),
            drawerMenuItem(1, ImageConstant.imgCar, "Transaction"),
            divLine(),
            drawerMenuItem(2, ImageConstant.imgFrameErrorcontainer,"Link"),
            divLine(),
            drawerMenuItem(3, ImageConstant.imgFrameErrorcontainer, "Profile"),
            divLine(),
            drawerMenuItem(12, ImageConstant.imgReply, "lbl_logout".tr),
            divLine(),
            SizedBox(height: 10),



          ],
        ),
      ),
    );
  }
  divLine(){
    return SizedBox(
      height: 2.v,

      child: Divider(
        indent: 20,
        endIndent: 10,


      ),
    );
  }

  drawerMenuItem(int count, String imagePath, String title) {
    return InkWell(
      onTap: () {
        print('SideMenuDraweritem.drawerMenuItem $title');
        if (count == 0) {
          Get.back();
          Get.toNamed(AppRoutes.charityDashboard,
          );
        } else if (count == 1) {
          Get.back();
          Get.toNamed(AppRoutes.charityGetTransaction);


        } else if (count == 2) {
          Get.back();
          Get.toNamed(AppRoutes.charityLink,

          );
        }
        else if(count==3){
          /// profile
          Get.back();
           Get.toNamed(AppRoutes.charityProfile);
        }
        else if (count == 12) {
          Get.offNamedUntil(AppRoutes.signInScreen, (route) => false);

        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 17.h, top: 5.v, bottom: 5.v),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal.shade50,
              child: CustomImageView(
                svgPath: imagePath, //ImageConstant.imgFrame5,
                height: 22.adaptSize,
                width: 22.adaptSize,
                color: Colors.black,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 2.v,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                title,
                style: CustomTextStyles.headlineSmallMedium1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
