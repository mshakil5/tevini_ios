import 'package:tenvini/core/app_export.dart';
import 'package:tenvini/presentation/frame_18709_screen/models/frame_18709_model.dart';

/// A controller class for the Frame18709Screen.
///
/// This class manages the state of the Frame18709Screen, including the
/// current frame18709ModelObj
class Frame18709Controller extends GetxController {
  Rx<Frame18709Model> frame18709ModelObj = Frame18709Model().obs;
}
