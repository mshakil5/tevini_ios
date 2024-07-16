import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/get_pin_and_change_the_pin_screen/models/get_pin_and_change_the_pin_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the GetPinAndChangeThePinScreen.
///
/// This class manages the state of the GetPinAndChangeThePinScreen, including the
/// current getPinAndChangeThePinModelObj
class GetPinAndChangeThePinController extends GetxController {
  TextEditingController pinController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  Rx<GetPinAndChangeThePinModel> getPinAndChangeThePinModelObj =
      GetPinAndChangeThePinModel().obs;

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
    cardNumberController.dispose();
  }
}
