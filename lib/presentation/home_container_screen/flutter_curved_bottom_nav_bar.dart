library curved_nav_bar;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/custom_elevated_button.dart';

import '../../core/curved_bar/curved_action_bar.dart';
import '../../core/fab_bar/fab_bottom_app_bar.dart';
import '../../core/fab_bar/fab_bottom_app_bar_item.dart';

import 'package:get/get.dart';

import '../../widgets/custom_outlined_button.dart';

class CurvedNavBar extends StatefulWidget {
  /// list of [FABBottomAppBarItem] items
  /// length should be always even eg.- 2,4,6,8
  /// length of [appBarItems] should be equal to the length of [bodyItems]
  final List<FABBottomAppBarItem>? appBarItems;

  /// list of `widgets`
  /// length should be equal to [appBarItems]
  /// length of [bodyItems] should be equal to the length of [appBarItems]
  final List<Widget>? bodyItems;

  ///  then the [body] extends to the bottom of the Scaffold,
  ///   In this case specifying `extendBody: true` ensures that that scaffold's
  ///   body will be visible through the bottom navigation bar's notch.
  ///   [extendBody] default value always true
  final bool extendBody;

  /// A [CurvedActionBar] button displayed floating above [body], in the bottom center.
  /// Typically a [FloatingActionButton].
  final CurvedActionBar? actionButton;

  /// [Color] of selected tab
  /// [activeColor] default value always [Colors.black]
  final Color? activeColor;

  /// [Color] of unselected tab
  /// [inActiveColor] default value always [Colors.black26]
  final Color? inActiveColor;

  /// background [Color] of navigation bar
  /// [navBarBackgroundColor] default value always [Colors.white]
  final Color? navBarBackgroundColor;

  /// Scaffold [body]
  /// when [actionButton] selected
  final Widget? actionBarView;

  CurvedNavBar(
      {@required this.appBarItems,
      @required this.bodyItems,
      this.extendBody = true,
      this.actionButton,
      this.activeColor = Colors.black,
      this.inActiveColor = Colors.black26,
      this.navBarBackgroundColor = Colors.white,
      this.actionBarView}) {
    assert(this.appBarItems != null);
    assert(this.bodyItems != null);
    assert(this.appBarItems!.length == this.bodyItems!.length);
  }

  @override
  _CurvedNavBarState createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  /// index of selected nav bar
  int selectedIndex = 0;

  /// true when [actionButton] is selected
  bool isCentreSelected = false;

  @override
  Widget build(BuildContext context) {
    return widget.actionButton != null
        ? WillPopScope(
            onWillPop: () => openDialog(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              extendBody: widget.extendBody,
              floatingActionButton: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isCentreSelected = true;
                      if (widget.actionButton!.onTab != null)
                        widget.actionButton!.onTab!(true);
                    });
                  },
                  child: isCentreSelected
                      ? widget.actionButton!.activeIcon!
                      : widget.actionButton!.inActiveIcon != null
                          ? widget.actionButton!.inActiveIcon
                          : widget.actionButton!.activeIcon),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: FABBottomAppBar(
                centerItemText: widget.actionButton!.text ?? "",
                inActiveColor: widget.inActiveColor,
                activeColor: widget.activeColor,
                notchedShape: CircularNotchedRectangle(),
                onTabSelected: (index) {
                  /// execute when navigation bar is selected
                  setState(() {
                    /// set current tab index
                    selectedIndex = index;

                    /// to get know [actionButton] is selected or not
                    isCentreSelected = false;
                  });
                },
                centerSelected: isCentreSelected,
                backgroundColor: widget.navBarBackgroundColor,
                items: widget.appBarItems != null ? widget.appBarItems : [],
              ),
              body: Center(
                child: isCentreSelected
                    ? widget.actionBarView != null
                        ? widget.actionBarView
                        : widget.bodyItems![selectedIndex]
                    : widget.bodyItems![selectedIndex],
              ),
            ))
        : WillPopScope(
            onWillPop: () => openDialog(),
            child: Scaffold(
              extendBody: widget.extendBody,
              bottomNavigationBar: FABBottomAppBar(
                inActiveColor: widget.inActiveColor,
                activeColor: widget.activeColor,
                notchedShape: CircularNotchedRectangle(),
                onTabSelected: (index) {
                  /// execute when navigation bar is selected
                  setState(() {
                    /// set current tab index
                    selectedIndex = index;

                    /// to get know [actionButton] is selected or not
                    isCentreSelected = false;
                  });
                },
                centerSelected: isCentreSelected,
                backgroundColor: widget.navBarBackgroundColor,
                items: widget.appBarItems != null ? widget.appBarItems : [],
              ),
              body: Center(
                child: widget.bodyItems![selectedIndex],
              ),
            ),
          );
  }

  openDialog() {
    Get.dialog(

      AlertDialog(
        alignment: Alignment.center,
        title: Column(
          children: [
            Icon(Icons.logout),
            SizedBox(height: 5),
            Text(
              'Do you want to exit?',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),

        actions: [

          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                    buttonStyle: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue

                      return Colors.red;
                    })),
                    width: Get.width / 3.5,
                    text: "No",
                    onTap: () {
                      Get.back();
                      /* if (controller.formKey.currentState!.validate()) {
                            print('SignInController.signInTap');
                            controller.signInTap(context);
                            FocusManager.instance.primaryFocus?.unfocus();
                            FocusScope.of(context).unfocus();
                          }*/
                    },
                    alignment: Alignment.bottomCenter),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomElevatedButton(
                    width: Get.width / 3.5,
                    text: "Yes",
                    onTap: () {
                      if (Platform.isAndroid) {
                        exit(0);
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    alignment: Alignment.bottomCenter),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
