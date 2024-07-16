import 'package:meta/meta.dart';
import 'dart:convert';

class DonationDetailsModel {
  final int id;
  final String donorId;
  final dynamic donationCalId;
  final DateTime date;
  final String incomeAmount;
  final String incomeTitle;
  final String incomeSlot;
  final String donationPercentage;
  final String donationAmount;
  final dynamic availableForDonation;
  final String status;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  DonationDetailsModel({
    required this.id,
    required this.donorId,
    required this.donationCalId,
    required this.date,
    required this.incomeAmount,
    required this.incomeTitle,
    required this.incomeSlot,
    required this.donationPercentage,
    required this.donationAmount,
    required this.availableForDonation,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  DonationDetailsModel copyWith({
    int? id,
    String? donorId,
    dynamic donationCalId,
    DateTime? date,
    String? incomeAmount,
    String? incomeTitle,
    String? incomeSlot,
    String? donationPercentage,
    String? donationAmount,
    dynamic availableForDonation,
    String? status,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DonationDetailsModel(
        id: id ?? this.id,
        donorId: donorId ?? this.donorId,
        donationCalId: donationCalId ?? this.donationCalId,
        date: date ?? this.date,
        incomeAmount: incomeAmount ?? this.incomeAmount,
        incomeTitle: incomeTitle ?? this.incomeTitle,
        incomeSlot: incomeSlot ?? this.incomeSlot,
        donationPercentage: donationPercentage ?? this.donationPercentage,
        donationAmount: donationAmount ?? this.donationAmount,
        availableForDonation: availableForDonation ?? this.availableForDonation,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DonationDetailsModel.fromRawJson(String str) => DonationDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationDetailsModel.fromJson(Map<String, dynamic> json) => DonationDetailsModel(
    id: json["id"],
    donorId: json["donor_id"],
    donationCalId: json["donation_cal_id"],
    date: DateTime.parse(json["date"]),
    incomeAmount: json["income_amount"],
    incomeTitle: json["income_title"]==null?'':json["income_title"],
    incomeSlot: json["income_slot"],
    donationPercentage: json["donation_percentage"]==null?'':json["donation_percentage"],
    donationAmount: json["donation_amount"],
    availableForDonation: json["available_for_donation"],
    status: json["status"]==null?'':json["status"],
    updatedBy: json["updated_by"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "donor_id": donorId,
    "donation_cal_id": donationCalId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "income_amount": incomeAmount,
    "income_title": incomeTitle,
    "income_slot": incomeSlot,
    "donation_percentage": donationPercentage,
    "donation_amount": donationAmount,
    "available_for_donation": availableForDonation,
    "status": status,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
