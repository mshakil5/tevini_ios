import '../../../core/app_export.dart';
import 'listqrcodeonlin_item_model.dart';

/// This class defines the variables used in the [notification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationModel {
  Rx<List<ListqrcodeonlinItemModel>> listqrcodeonlinItemList =
      Rx(List.generate(20, (index) => ListqrcodeonlinItemModel()));
}
