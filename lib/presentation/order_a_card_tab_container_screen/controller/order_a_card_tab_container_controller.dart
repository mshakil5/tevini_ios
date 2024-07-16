import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/order_a_card_tab_container_screen/models/order_a_card_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the OrderACardTabContainerScreen.
///
/// This class manages the state of the OrderACardTabContainerScreen, including the
/// current orderACardTabContainerModelObj
class OrderACardTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<OrderACardTabContainerModel> orderACardTabContainerModelObj =
      OrderACardTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
