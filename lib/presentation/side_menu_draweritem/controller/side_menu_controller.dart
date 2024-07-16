import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/side_menu_draweritem/models/side_menu_model.dart';

/// A controller class for the SideMenuDraweritem.
///
/// This class manages the state of the SideMenuDraweritem, including the
/// current sideMenuModelObj
class SideMenuController extends GetxController {
  Rx<SideMenuModel> sideMenuModelObj = SideMenuModel().obs;
}
