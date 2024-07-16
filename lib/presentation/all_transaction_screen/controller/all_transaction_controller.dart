import 'package:flutter/material.dart';
import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/all_transaction_screen/models/all_transaction_model.dart';

/// A controller class for the AllTransactionScreen.
///
/// This class manages the state of the AllTransactionScreen, including the
/// current allTransactionModelObj
class AllTransactionController extends GetxController  with GetSingleTickerProviderStateMixin{
 // Rx<AllTransactionModel> allTransactionModelObj = AllTransactionModel().obs;
  late TabController tabController;
  final lbl_mm_dd_yyyy='lbl_mm_dd_yyyy'.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 4, vsync: this,);
    super.onInit();
  }

}
