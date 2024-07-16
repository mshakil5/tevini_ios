import '../../../core/app_export.dart';

/// This class is used in the [donationrow_item_widget] screen.
class DonationrowItemModel {
  DonationrowItemModel({
    this.donationText,
    this.amountText,
    this.id,
  }) {
    donationText = donationText ?? Rx("Donation for USA");
    amountText = amountText ?? Rx("-50.00 GBP");
    id = id ?? Rx("");
  }

  Rx<String>? donationText;

  Rx<String>? amountText;

  Rx<String>? id;
}
