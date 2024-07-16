import '../../main.dart';
import '../side_menu_draweritem/controller/side_menu_controller.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'controller/update_cardholder_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/core/utils/validation_functions.dart';
import 'package:tenvini/widgets/app_bar/appbar_image.dart';
import 'package:tenvini/widgets/app_bar/appbar_title.dart';
import 'package:tenvini/widgets/app_bar/custom_app_bar.dart';
import 'package:tenvini/widgets/custom_outlined_button.dart';
import 'package:tenvini/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class UpdateCardholderScreen extends GetWidget<UpdateCardholderController> {
  UpdateCardholderScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _cardScaffoldKey = new GlobalKey<ScaffoldState>();
  //GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name = localStoreSRF.getString('name');
  String? accNo = localStoreSRF.getString('accNo');
  String? userProfile = localStoreSRF.getString('userProfile');
  @override
  Widget build(BuildContext context) {
    SideMenuController drawerController = Get.put(SideMenuController());
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: _cardScaffoldKey,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
          height: 60.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgFrameGray900,
            onTap: () {
              print('HomePage.build');
              _cardScaffoldKey.currentState?.openDrawer();
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
        body: Center(child: Text('Coming Soon...',style: TextStyle(fontSize: 25,color: Colors.teal,fontWeight: FontWeight.bold),))
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
