import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/update_cardholder_screen/models/update_cardholder_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UpdateCardholderScreen.
///
/// This class manages the state of the UpdateCardholderScreen, including the
/// current updateCardholderModelObj
class UpdateCardholderController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  TextEditingController aController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController n156ppController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  Rx<UpdateCardholderModel> updateCardholderModelObj =
      UpdateCardholderModel().obs;

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    frameOneController.dispose();
    aController.dispose();
    cityController.dispose();
    n156ppController.dispose();
    countryController.dispose();
    addressController.dispose();
  }
}
