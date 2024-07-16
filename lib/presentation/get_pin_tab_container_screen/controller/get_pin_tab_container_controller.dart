import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/get_pin_tab_container_screen/models/get_pin_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the GetPinTabContainerScreen.
///
/// This class manages the state of the GetPinTabContainerScreen, including the
/// current getPinTabContainerModelObj
class GetPinTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<GetPinTabContainerModel> getPinTabContainerModelObj =
      GetPinTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
