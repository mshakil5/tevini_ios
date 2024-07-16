import 'package:meta/meta.dart';
import 'dart:convert';

class DonationCalculationStoreModel {
   String startDate;
   String incomeAmount;
   String incomeTitle;
   String incomeSlot;
   String donationPercentage;
   String? donorcalId;

  DonationCalculationStoreModel({
    required this.startDate,
    required this.incomeAmount,
    required this.incomeTitle,
    required this.incomeSlot,
    required this.donationPercentage,
     this.donorcalId,
  });

  DonationCalculationStoreModel copyWith({
    String? startDate,
    String? incomeAmount,
    String? incomeTitle,
    String? incomeSlot,
    String? donationPercentage,
    String? donorcalId,
  }) =>
      DonationCalculationStoreModel(
        startDate: startDate ?? this.startDate,
        incomeAmount: incomeAmount ?? this.incomeAmount,
        incomeTitle: incomeTitle ?? this.incomeTitle,
        incomeSlot: incomeSlot ?? this.incomeSlot,
        donationPercentage: donationPercentage ?? this.donationPercentage,
        donorcalId: donorcalId ?? this.donorcalId,
      );

  factory DonationCalculationStoreModel.fromRawJson(String str) => DonationCalculationStoreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationCalculationStoreModel.fromJson(Map<String, dynamic> json) => DonationCalculationStoreModel(
    startDate: json["start_date"],
    incomeAmount: json["income_amount"],
    incomeTitle: json["income_title"],
    incomeSlot: json["income_slot"],
    donationPercentage: json["donation_percentage"],
    donorcalId: json["donorcal_id"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "income_amount": incomeAmount,
    "income_title": incomeTitle,
    "income_slot": incomeSlot,
    "donation_percentage": donationPercentage,
    "donorcal_id": donorcalId,
  };
}
