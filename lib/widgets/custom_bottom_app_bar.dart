import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
import 'package:tenvini/core/app_export.dart';
import '../core/utils/image_constant.dart';
import '../theme/app_decoration.dart';
import 'custom_image_view.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({Key? key, this.onChanged}) : super(key: key);

  RxList<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNavhome,
        activeIcon: ImageConstant.imgNavhome,
        title: "lbl_home".tr,
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
        icon: ImageConstant.imgNavhome,
        activeIcon: ImageConstant.imgNavhome,
        title: "lbl_home".tr,
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgNavprofile,
      activeIcon: ImageConstant.imgNavprofile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
      isPng: true,
    )
  ].obs;

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(

        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: 50.v,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomMenuList.length,
              (index) {
                return InkWell(
                  onTap: () {
                    for (var element in bottomMenuList) {
                      element.isSelected = false;
                    }
                    bottomMenuList[index].isSelected = true;
                    onChanged?.call(bottomMenuList[index].type);
                    bottomMenuList.refresh();
                  },
                  child: bottomMenuList[index].isSelected
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 4.v,
                          ),
                          decoration: AppDecoration.outlineTeal.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: bottomMenuList[index].isPng == true
                                    ? null
                                    : bottomMenuList[index].activeIcon,
                                imagePath: bottomMenuList[index].isPng == true
                                    ? bottomMenuList[index].activeIcon
                                    : null,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                color: theme.colorScheme.onError,
                                margin: EdgeInsets.only(left: 16.h),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.h,
                                  right: 19.h,
                                ),
                                child: Text(
                                  bottomMenuList[index].title ?? "",
                                  style: CustomTextStyles.titleMediumOnError
                                      .copyWith(
                                    color: theme.colorScheme.onError,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      :
                  Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 4.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: bottomMenuList[index].isPng == true
                                    ? null
                                    : bottomMenuList[index].icon,
                                imagePath: bottomMenuList[index].isPng == true
                                    ? bottomMenuList[index].icon
                                    : null,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                color: theme.colorScheme.errorContainer,
                                margin: EdgeInsets.only(left: 16.h),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.h,
                                  right: 18.h,
                                ),
                                child: Text(
                                  bottomMenuList[index].title ?? "",
                                  style: CustomTextStyles
                                      .titleMediumErrorContainerMedium
                                      .copyWith(
                                    color: theme.colorScheme.errorContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Record,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isPng = false,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isPng;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Added to profile page ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
