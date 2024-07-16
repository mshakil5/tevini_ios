import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/get_pin_page/models/get_pin_model.dart';

/// A controller class for the GetPinPage.
///
/// This class manages the state of the GetPinPage, including the
/// current getPinModelObj
class GetPinController extends GetxController {
  GetPinController(this.getPinModelObj);

  Rx<GetPinModel> getPinModelObj;
}
