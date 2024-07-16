import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/card_activation_screen/models/card_activation_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CardActivationScreen.
///
/// This class manages the state of the CardActivationScreen, including the
/// current cardActivationModelObj
class CardActivationController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  Rx<CardActivationModel> cardActivationModelObj = CardActivationModel().obs;

  Rx<bool> ihavereadandacc = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    cardNumberController.dispose();
  }
}
