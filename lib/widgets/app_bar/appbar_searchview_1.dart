import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarSearchview1 extends StatelessWidget {
  AppbarSearchview1({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: 198.h,
        controller: controller,
        hintText: "lbl_search".tr,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 5.v, 7.h, 5.v),
          child: CustomImageView(
            svgPath: ImageConstant.imgSearchErrorcontainer,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 24.v,
        ),
      ),
    );
  }
}
