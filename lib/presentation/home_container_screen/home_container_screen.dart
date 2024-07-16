import 'package:tenvini/presentation/donation_record_screen/donation_record_screen.dart';
import '../../core/curved_bar/curved_action_bar.dart';
import '../../core/fab_bar/fab_bottom_app_bar_item.dart';
import '../../core/values/app_assets.dart';
import 'controller/home_container_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

import 'flutter_curved_bottom_nav_bar.dart';
import 'dart:io';


class HomeContainerScreen extends GetWidget<HomeContainerController> {
  List<FABBottomAppBarItem>? appBarItems = [
    FABBottomAppBarItem(
        activeIcon: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        inActiveIcon: const Icon(
          Icons.home,
          color: Colors.black26,
        ),
        text: 'Home'),
    FABBottomAppBarItem(
        activeIcon: const Icon(
          Icons.info_outlined,
          color: Colors.white,
        ),
        inActiveIcon: const Icon(
          Icons.info_outlined,
          color: Colors.black26,
        ),
        text: 'About'),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loadingData.value == true
          ? CurvedNavBar(
              activeColor: Colors.white,
              extendBody: true,
              navBarBackgroundColor: Colors.teal,
              inActiveColor: Colors.black45,
              appBarItems: appBarItems,
              bodyItems: controller.screens,
              actionButton: CurvedActionBar(
                  onTab: (value) {
                    /// perform action here
                    print(value);
                  },
                  activeIcon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.teal, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomImageView(
                        svgPath: ImageConstant
                            .imgFrameWhiteA700, //ImageConstant.imgFrame5,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(
                          top: 3.v,
                          bottom: 2.v,
                        ),
                      ),
                    ),
                  ),
                  inActiveIcon: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomImageView(
                        svgPath: ImageConstant
                            .imgFrameWhiteA700, //ImageConstant.imgFrame5,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(
                          top: 3.v,
                          bottom: 2.v,
                        ),
                      ),
                    ),
                  ),
                  text: "Donation"),
              actionBarView: DonationRecordScreen(),
      )
          : Container(
              color: Colors.teal,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.fetchDataLoading,
                    width: 150,
                    height: 150,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Please Wait...',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(AppAssets.appLogo,
                      width: 150,
                      height: 150,
                      color: Colors.white
                  ),
                ],
              ),
            );
    });
  }
}



/*
import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeContainerScreen extends StatefulWidget {
  HomeContainerScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeContainerScreen> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home,
    Icons.person,
  ];


  List<Widget>? screens =  [
    HomePage(),
    //Text('Adnan'),
   // Text('Adnan2'),
  //  Text('Adnan3'),
   // Text('Adnan4')
    MyProfileScreen(),
    //Text('Adnan')
   // HomePage(),
    // DonationRecordScreen(),
    //DonationRecordScreen(),
    //MyProfileScreen()
    //AllTransactionScreen()
    //  TransferTDFScreen()
 //   CompanyInfoScreen()
  ];
  List<String>? titles =  [
    'Home',
    //Text('Adnan'),
   // Text('Adnan2'),
  //  Text('Adnan3'),
   // Text('Adnan4')
    'Profile',
    //Text('Adnan')
   // HomePage(),
    // DonationRecordScreen(),
    //DonationRecordScreen(),
    //MyProfileScreen()
    //AllTransactionScreen()
    //  TransferTDFScreen()
 //   CompanyInfoScreen()
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
   // final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return SafeArea(

      child: Scaffold(
        resizeToAvoidBottomInset:false,
        extendBody: true,
        body: NotificationListener<ScrollNotification>(

          onNotification: onScrollNotification,
          child: NavigationScreen(iconList[_bottomNavIndex],screens![_bottomNavIndex],titles![_bottomNavIndex]),
        ),
        floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.teal,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.teal, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomImageView(
                svgPath: ImageConstant
                    .imgFrameWhiteA700, //ImageConstant.imgFrame5,
                height: 40.adaptSize,
                width: 40.adaptSize,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 2.v,
                ),
              ),
            ),
          ),
          onPressed: () {
            print('_MyHomePageState.build');
            _fabAnimationController.reset();
            _borderRadiusAnimationController.reset();
            _borderRadiusAnimationController.forward();
            _fabAnimationController.forward();
          //  Get.toNamed(AppRoutes.donationRecordScreen);

          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive
                ? Colors.white
                : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:  //Text('dfdf')
                  AutoSizeText(
                    titles![index],
                    maxLines: 1,
                    style: TextStyle(color: color),
                    group: autoSizeGroup,
                  ),
                )
              ],
            );
          },
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          backgroundColor: Colors.teal,
          activeIndex: _bottomNavIndex,
          splashColor: Colors.white12,
          notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          //notchSmoothness: NotchSmoothness.defaultEdge,
        //  gapLocation: GapLocation.center,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          hideAnimationController: _hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 0,
            spreadRadius: 0.5,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData1;
  final Widget? screen;
  final String? title;

  NavigationScreen(this.iconData1,this.screen,this.title) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData1 != widget.iconData1) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }



  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return SafeArea(
      child: Scaffold(

        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: CircularRevealAnimation(

              animation: animation,
              centerOffset: Offset(80, 80),
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child:  widget.screen!,
            ),
          ),
        ),
      ),
    );
  }
}*/
