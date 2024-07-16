import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/forget_password_screen/models/forget_password_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgetPasswordScreen.
///
/// This class manages the state of the ForgetPasswordScreen, including the
/// current forgetPasswordModelObj
class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgetPasswordModel> forgetPasswordModelObj = ForgetPasswordModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
