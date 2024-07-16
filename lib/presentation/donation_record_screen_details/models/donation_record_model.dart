import 'package:meta/meta.dart';
import 'dart:convert';

class DonationRecordModel {
  final int? id;
  final String? userId;
  final String? charityId;
  final String? amount;
  final String? currency;
  final String? anoDonation;
  final String? standingOrder;
  final String? confirmDonation;
  final String? charitynote;
  final String? mynote;
  final String? notification;
  final String? status;
  final DateTime? updatedBy;
  final DateTime? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DonationRecordModel({
    required this.id,
    required this.userId,
    required this.charityId,
    required this.amount,
    required this.currency,
    required this.anoDonation,
    required this.standingOrder,
    required this.confirmDonation,
    required this.charitynote,
    required this.mynote,
    required this.notification,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  DonationRecordModel copyWith({
    int? id,
    String? userId,
    String? charityId,
    String? amount,
    String? currency,
    String? anoDonation,
    String? standingOrder,
    String? confirmDonation,
    String? charitynote,
    String? mynote,
    String? notification,
    String? status,
    DateTime? updatedBy,
    DateTime? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DonationRecordModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        charityId: charityId ?? this.charityId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        anoDonation: anoDonation ?? this.anoDonation,
        standingOrder: standingOrder ?? this.standingOrder,
        confirmDonation: confirmDonation ?? this.confirmDonation,
        charitynote: charitynote ?? this.charitynote,
        mynote: mynote ?? this.mynote,
        notification: notification ?? this.notification,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DonationRecordModel.fromRawJson(String str) =>
      DonationRecordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationRecordModel.fromJson(Map<String, dynamic> json) =>
      DonationRecordModel(
        id: json['id'] != null ? json['id'] : 0,
        //  json["id"],

        userId: json['user_id'] != null ? json['user_id'] : null,
        //json["user_id"],
        charityId: json['charity_id'] != null ? json['charity_id'] : null,
        //json["charity_id"],
        amount: json['amount'] != null ? json['amount'] : null,
        //json["amount"],
        currency: json['currency'] != null ? json['currency'] : null,
        //json["currency"],
        anoDonation: json['ano_donation'] != null ? json['ano_donation'] : null,
        //json["ano_donation"],
        standingOrder: json["standing_order"],
        confirmDonation: json["confirm_donation"],
        charitynote: json['charitynote'] != null ? json['charitynote'] : null,

        // json["charitynote"],
        mynote: json['mynote'] != null ? json['mynote'] : null,
        //  json["mynote"],
        notification: json["notification"],
        status: json['status'] != null ? json['status'] : null,
        //json["status"],
        updatedBy: json['updated_by'] != null
            ? DateTime.parse(json['updated_by'])
            : null,
        //json["updated_by"],
        createdBy: json['created_by'] != null
            ? DateTime.parse(json['created_by'])
            : null,
        //json["created_by"],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        //DateTime.parse(json["created_at"]),
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        //DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "charity_id": charityId,
        "amount": amount,
        "currency": currency,
        "ano_donation": anoDonation,
        "standing_order": standingOrder,
        "confirm_donation": confirmDonation,
        "charitynote": charitynote,
        "mynote": mynote,
        "notification": notification,
        "status": status,
        "updated_by": updatedBy!.toIso8601String(),
        "created_by": createdBy!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
