import 'controller/splash_secreen_controller.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashSecreenScreen extends GetWidget<SplashSecreenController> {
  const SplashSecreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            CustomImageView(
                imagePath: ImageConstant.imgNewlogo12,
                height: 55.v,
                width: 184.h
            ,
              color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
