import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/money_in_screen/models/money_in_model.dart';

/// A controller class for the MoneyInScreen.
///
/// This class manages the state of the MoneyInScreen, including the
/// current moneyInModelObj
class MoneyInController extends GetxController {
  Rx<MoneyInModel> moneyInModelObj = MoneyInModel().obs;
}
