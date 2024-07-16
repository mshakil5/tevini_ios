import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/mobile_verification_screen/models/mobile_verification_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MobileVerificationScreen.
///
/// This class manages the state of the MobileVerificationScreen, including the
/// current mobileVerificationModelObj
class MobileVerificationController extends GetxController {
  TextEditingController codeoneController = TextEditingController();

  Rx<MobileVerificationModel> mobileVerificationModelObj =
      MobileVerificationModel().obs;

  @override
  void onClose() {
    super.onClose();
    codeoneController.dispose();
  }
}
