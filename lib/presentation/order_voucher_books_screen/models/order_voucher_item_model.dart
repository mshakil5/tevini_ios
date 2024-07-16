import '../../../core/app_export.dart';

/// This class is used in the [order_voucher_item_widget] screen.
class OrderVoucherItemModel {
  OrderVoucherItemModel({
    this.price,
    this.price1,
    this.prepaid,
    this.id,
  }) {
    price = price ?? Rx("£0.50");
    price1 = price1 ?? Rx("100 vouchers = £50.00");
    prepaid = prepaid ?? Rx("Prepaid");
    id = id ?? Rx("");
  }

  Rx<String>? price;

  Rx<String>? price1;

  Rx<String>? prepaid;

  Rx<String>? id;
}
