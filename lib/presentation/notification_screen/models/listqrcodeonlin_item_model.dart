import '../../../core/app_export.dart';

/// This class is used in the [listqrcodeonlin_item_widget] screen.
class ListqrcodeonlinItemModel {
  ListqrcodeonlinItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
