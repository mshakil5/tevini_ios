import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/change_card_status_screen/models/change_card_status_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChangeCardStatusScreen.
///
/// This class manages the state of the ChangeCardStatusScreen, including the
/// current changeCardStatusModelObj
class ChangeCardStatusController extends GetxController {
  TextEditingController selectController = TextEditingController();

  Rx<ChangeCardStatusModel> changeCardStatusModelObj =
      ChangeCardStatusModel().obs;

  @override
  void onClose() {
    super.onClose();
    selectController.dispose();
  }
}
