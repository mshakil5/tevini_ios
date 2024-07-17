

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../core/utils/image_constant.dart';
import '../core/values/app_assets.dart';

Future<void> loader({String? msg}) => EasyLoading.show(
      status: msg ?? 'Please wait',
      maskType: EasyLoadingMaskType.none,
      indicator: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.appLogo),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child:
                Center(child: CircularProgressIndicator(color: Colors.yellow)),
          ),
        ],
      ),
    );

///runing
Future<void> showloader({String? msg}) async {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.white
    ..textColor = Colors.black
    ..progressColor = Colors.teal;

  EasyLoading.show(
    maskType: EasyLoadingMaskType.black,
    status: msg ?? 'Please wait',
    indicator: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.appLogo,
            height: 60,
            width: 60,
            color: Colors.teal,
          ),
           Padding(
            padding: EdgeInsets.all(10.0),
            child:Image.asset(
              ImageConstant.fetchDataLoading,
              width: 40,
              height:40,
              color: Colors.teal,
            )
           /* Center(
              child: CircularProgressIndicator(
                color: AppThemes.primaryColor,
                backgroundColor: Colors.teal,
              ),
            ),*/
          ),
        ],
      ),
    ),
  );
}

loaderDismiss() => EasyLoading.dismiss();
