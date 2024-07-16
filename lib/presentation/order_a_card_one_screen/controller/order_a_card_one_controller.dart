import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/order_a_card_one_screen/models/order_a_card_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the OrderACardOneScreen.
///
/// This class manages the state of the OrderACardOneScreen, including the
/// current orderACardOneModelObj
class OrderACardOneController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  TextEditingController aController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController n156ppController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  Rx<OrderACardOneModel> orderACardOneModelObj = OrderACardOneModel().obs;

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
