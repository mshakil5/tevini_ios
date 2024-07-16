import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/money_out_screen/models/money_out_model.dart';

/// A controller class for the MoneyOutScreen.
///
/// This class manages the state of the MoneyOutScreen, including the
/// current moneyOutModelObj
class MoneyOutController extends GetxController {
  Rx<MoneyOutModel> moneyOutModelObj = MoneyOutModel().obs;
}
