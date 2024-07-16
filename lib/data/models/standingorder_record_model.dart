import 'package:meta/meta.dart';
import 'dart:convert';

class StandingOrderRecordModel {
  final int id;
  final String userId;
  final String charityId;
  final String charityName;
  final String amount;
  final String currency;
  final String anoDonation;
  final String standingOrder;
  final String payments;
  final String numberPayments;
  final String paymentMade;
  final DateTime starting;
  final String interval;
  final String charitynote;
  final String mynote;
  final String notification;
  final String status;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  StandingOrderRecordModel({
    required this.id,
    required this.userId,
    required this.charityId,
    required this.charityName,
    required this.amount,
    required this.currency,
    required this.anoDonation,
    required this.standingOrder,
    required this.payments,
    required this.numberPayments,
    required this.paymentMade,
    required this.starting,
    required this.interval,
    required this.charitynote,
    required this.mynote,
    required this.notification,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  StandingOrderRecordModel copyWith({
    int? id,
    String? userId,
    String? charityId,
    String? charityName,
    String? amount,
    String? currency,
    String? anoDonation,
    String? standingOrder,
    dynamic payments,
    dynamic numberPayments,
    String? paymentMade,
    DateTime? starting,
    String? interval,
    dynamic charitynote,
    dynamic mynote,
    String? notification,
    String? status,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      StandingOrderRecordModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        charityId: charityId ?? this.charityId,
        charityName: charityId ?? this.charityName,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        anoDonation: anoDonation ?? this.anoDonation,
        standingOrder: standingOrder ?? this.standingOrder,
        payments: payments ?? this.payments,
        numberPayments: numberPayments ?? this.numberPayments,
        paymentMade: paymentMade ?? this.paymentMade,
        starting: starting ?? this.starting,
        interval: interval ?? this.interval,
        charitynote: charitynote ?? this.charitynote,
        mynote: mynote ?? this.mynote,
        notification: notification ?? this.notification,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory StandingOrderRecordModel.fromRawJson(String str) => StandingOrderRecordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingOrderRecordModel.fromJson(Map<String, dynamic> json) => StandingOrderRecordModel(
    id: json["id"],
    userId: json["user_id"],
    charityId: json["charity_id"],
      charityName:  json["charityName"]==null?'0': json["charityName"],
    amount: json["amount"],
    currency: json["currency"],
    anoDonation: json["ano_donation"],
    standingOrder: json["standing_order"],
    payments: json["payments"]==null?'0': json["payments"],
    numberPayments: json["number_payments"],
    paymentMade: json["payment_made"],
    starting: DateTime.parse(json["starting"]),
    interval: json["interval"],
    charitynote:json["charitynote"]==null?'': json["charitynote"],
    mynote: json["mynote"]==null?'':json["mynote"],
    notification: json["notification"]==null?'':json["notification"],
    status: json["status"]==null?'':json["status"],
    updatedBy:json["updated_by"]==null?'': json["updated_by"],
    createdBy:json["created_by"]==null?'': json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "charity_id": charityId,
    "charityName": charityName,
    "amount": amount,
    "currency": currency,
    "ano_donation": anoDonation,
    "standing_order": standingOrder,
    "payments": payments,
    "number_payments": numberPayments,
    "payment_made": paymentMade,
    "starting": "${starting.year.toString().padLeft(4, '0')}-${starting.month.toString().padLeft(2, '0')}-${starting.day.toString().padLeft(2, '0')}",
    "interval": interval,
    "charitynote": charitynote,
    "mynote": mynote,
    "notification": notification,
    "status": status,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
