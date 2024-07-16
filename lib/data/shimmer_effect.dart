import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:tenvini/core/app_export.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_space.dart';


double _containerHeight = 20;
double _spaceHeight = 10;
Color _shimmerColor = Colors.grey;
Color _shimmerColorDark = Colors.grey.shade200;

class ShimmerLoading {
  static vListViewLoading() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor!,
                  period: const Duration(milliseconds: 3000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 450,

                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: _containerHeight,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: _spaceHeight,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: _containerHeight,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpace.spaceH6,
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: _shimmerColor,
                  height: 1),
            ],
          );
        },
      ),
    );
  }


  Widget buildShimmerImageHorizontal(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.only(right: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
            child: Shimmer.fromColors(
              highlightColor: AppColors.cyan,
              baseColor: _shimmerColor!,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    width: boxImageSize,
                    height: boxImageSize,
                    color: _shimmerColor!,
                  ),
                ),
              ),
              period: Duration(milliseconds: 1000),
            ),
          );
        },
      ),
    );
  }

  Widget buildShimmerBookingTicketsLV(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.only(left: 12, right: 12),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: boxImageSize,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              color: AppColors.primaryColor,
              child:
              Shimmer.fromColors(
                highlightColor:AppColors.primaryColor,
                baseColor: _shimmerColor!,
                period: Duration(milliseconds: 1000),
                child: Container(
                  height: boxImageSize-50,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                          width: double.infinity,
                          height: boxImageSize-70,
                          color: _shimmerColor!,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor!,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor!,
                              ),
                              height: 12,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildShimmerGrid2(boxImageSize) {
    return SafeArea(
      child:

      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 97.v,
              crossAxisCount: 2,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 5.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {

            return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: appTheme.teal50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child:
                Shimmer.fromColors(
                  highlightColor:AppColors.primaryColor,
                  baseColor: _shimmerColor!,
                  period: Duration(milliseconds: 1000),
                  child:

                  Container(
                    height: 96.v,
                    width: 188.h,
                    decoration: AppDecoration.fillTeal.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('')
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.h),

                              child: Text('')),
                        ),

                      ],
                    ),
                  )
                ),

               );

            //  OrderVoucherItemWidget(model);
          })
    );
  }
}
