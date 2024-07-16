import 'package:meta/meta.dart';
import 'dart:convert';

class DonationCalculationModel {
  final dynamic id;
  final dynamic donorId;
   String incomeAmount;
   String incomeTitle;
   String incomeSlot;
  DateTime startDate;
   String donationPercentage;
   String status;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  DonationCalculationModel({
    required this.id,
    required this.donorId,
    required this.incomeAmount,
    required this.incomeTitle,
    required this.incomeSlot,
    required this.startDate,
    required this.donationPercentage,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  DonationCalculationModel copyWith({
    int? id,
    String? donorId,
    String? incomeAmount,
    String? incomeTitle,
    String? incomeSlot,
    DateTime? startDate,
    String? donationPercentage,
    String? status,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DonationCalculationModel(
        id: id ?? this.id,
        donorId: donorId ?? this.donorId,
        incomeAmount: incomeAmount ?? this.incomeAmount,
        incomeTitle: incomeTitle ?? this.incomeTitle,
        incomeSlot: incomeSlot ?? this.incomeSlot,
        startDate: startDate ?? this.startDate,
        donationPercentage: donationPercentage ?? this.donationPercentage,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DonationCalculationModel.fromRawJson(String str) => DonationCalculationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationCalculationModel.fromJson(Map<String, dynamic> json) => DonationCalculationModel(
    id: json["id"],
    donorId: json["donor_id"],
    incomeAmount: json["income_amount"],
    incomeTitle: json["income_title"],
    incomeSlot: json["income_slot"],
    startDate: DateTime.parse(json["start_date"]),
    donationPercentage: json["donation_percentage"],
    status: json["status"],
    updatedBy: json["updated_by"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "donor_id": donorId,
    "income_amount": incomeAmount,
    "income_title": incomeTitle,
    "income_slot": incomeSlot,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "donation_percentage": donationPercentage,
    "status": status,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
