import 'package:meta/meta.dart';
import 'dart:convert';

class AllTransactionModel {
  final int id;
  final String tId;
  final String charityId;
  final String userId;
  final dynamic donationId;
  final String standingDonationdetailsId;
  final dynamic source;
  final String tType;
  final String commission;
  final String amount;
  final dynamic note;
  final dynamic tUnq;
  final dynamic orderId;
  final dynamic chequeNo;
  final String title;
  final dynamic pending;
  final dynamic gift;
  final String notification;
  final dynamic gatewayId;
  final dynamic campaignId;
  final String status;
  final dynamic crdAcptId;
  final dynamic crdAcptLoc;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  AllTransactionModel({
    required this.id,
    required this.tId,
    required this.charityId,
    required this.userId,
    required this.donationId,
    required this.standingDonationdetailsId,
    required this.source,
    required this.tType,
    required this.commission,
    required this.amount,
    required this.note,
    required this.tUnq,
    required this.orderId,
    required this.chequeNo,
    required this.title,
    required this.pending,
    required this.gift,
    required this.notification,
    required this.gatewayId,
    required this.campaignId,
    required this.status,
    required this.crdAcptId,
    required this.crdAcptLoc,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  AllTransactionModel copyWith({
    int? id,
    String? tId,
    String? charityId,
    String? userId,
    dynamic donationId,
    String? standingDonationdetailsId,
    dynamic source,
    String? tType,
    String? commission,
    String? amount,
    dynamic note,
    dynamic tUnq,
    dynamic orderId,
    dynamic chequeNo,
    String? title,
    dynamic pending,
    dynamic gift,
    String? notification,
    dynamic gatewayId,
    dynamic campaignId,
    String? status,
    dynamic crdAcptId,
    dynamic crdAcptLoc,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AllTransactionModel(
        id: id ?? this.id,
        tId: tId ?? this.tId,
        charityId: charityId ?? this.charityId,
        userId: userId ?? this.userId,
        donationId: donationId ?? this.donationId,
        standingDonationdetailsId: standingDonationdetailsId ?? this.standingDonationdetailsId,
        source: source ?? this.source,
        tType: tType ?? this.tType,
        commission: commission ?? this.commission,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        tUnq: tUnq ?? this.tUnq,
        orderId: orderId ?? this.orderId,
        chequeNo: chequeNo ?? this.chequeNo,
        title: title ?? this.title,
        pending: pending ?? this.pending,
        gift: gift ?? this.gift,
        notification: notification ?? this.notification,
        gatewayId: gatewayId ?? this.gatewayId,
        campaignId: campaignId ?? this.campaignId,
        status: status ?? this.status,
        crdAcptId: crdAcptId ?? this.crdAcptId,
        crdAcptLoc: crdAcptLoc ?? this.crdAcptLoc,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AllTransactionModel.fromRawJson(String str) => AllTransactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllTransactionModel.fromJson(Map<String, dynamic> json) => AllTransactionModel(
    id: json["id"],
    tId: json["t_id"],
    charityId: json["charity_id"],
    userId: json["user_id"],
    donationId: json["donation_id"],
    standingDonationdetailsId: json["standing_donationdetails_id"],
    source: json["source"],
    tType: json["t_type"],
    commission: json["commission"],
    amount: json["amount"],
    note: json["note"],
    tUnq: json["t_unq"],
    orderId: json["order_id"],
    chequeNo: json["cheque_no"],
    title: json["title"],
    pending: json["pending"],
    gift: json["gift"],
    notification: json["notification"],
    gatewayId: json["gateway_id"],
    campaignId: json["campaign_id"],
    status: json["status"],
    crdAcptId: json["crdAcptID"],
    crdAcptLoc: json["crdAcptLoc"],
    updatedBy: json["updated_by"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "t_id": tId,
    "charity_id": charityId,
    "user_id": userId,
    "donation_id": donationId,
    "standing_donationdetails_id": standingDonationdetailsId,
    "source": source,
    "t_type": tType,
    "commission": commission,
    "amount": amount,
    "note": note,
    "t_unq": tUnq,
    "order_id": orderId,
    "cheque_no": chequeNo,
    "title": title,
    "pending": pending,
    "gift": gift,
    "notification": notification,
    "gateway_id": gatewayId,
    "campaign_id": campaignId,
    "status": status,
    "crdAcptID": crdAcptId,
    "crdAcptLoc": crdAcptLoc,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
