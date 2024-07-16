import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'dart:convert';
class DashobardModel {
  final String status;
  final String pendingTransactions;
  final int currentyramount;
  final int totalamount;
  final List<Alltransaction> tamount;
  final List<Alltransaction> alltransactions;

  DashobardModel({
    required this.status,
    required this.pendingTransactions,
    required this.currentyramount,
    required this.totalamount,
    required this.tamount,
    required this.alltransactions,
  });

  DashobardModel copyWith({
    String? status,
    String? pendingTransactions,
    int? currentyramount,
    int? totalamount,
    List<Alltransaction>? tamount,
    List<Alltransaction>? alltransactions,
  }) =>
      DashobardModel(
        status: status ?? this.status,
        pendingTransactions: pendingTransactions ?? this.pendingTransactions,
        currentyramount: currentyramount ?? this.currentyramount,
        totalamount: totalamount ?? this.totalamount,
        tamount: tamount ?? this.tamount,
        alltransactions: alltransactions ?? this.alltransactions,
      );

  factory DashobardModel.fromRawJson(String str) => DashobardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashobardModel.fromJson(Map<String, dynamic> json) => DashobardModel(
    status: json["status"],
    pendingTransactions: json["pending_transactions"],
    currentyramount: json["currentyramount"],
    totalamount: json["totalamount"],
    tamount: List<Alltransaction>.from(json["tamount"].map((x) => Alltransaction.fromJson(x))),
    alltransactions: List<Alltransaction>.from(json["alltransactions"].map((x) => Alltransaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pending_transactions": pendingTransactions,
    "currentyramount": currentyramount,
    "totalamount": totalamount,
    "tamount": List<dynamic>.from(tamount.map((x) => x.toJson())),
    "alltransactions": List<dynamic>.from(alltransactions.map((x) => x.toJson())),
  };
}

class Alltransaction {
  final int id;
  final String tId;
  final dynamic charityId;
   dynamic charityName;
  final String userId;
  final String donationId;
  final dynamic standingDonationdetailsId;
  final dynamic source;
  final dynamic tType;
  final String commission;
  final String amount;
  final String note;
  final String name;
  final dynamic tUnq;
  final dynamic orderId;
  final String chequeNo;
  final String title;
  final String pending;
  final dynamic gift;
  final String notification;
  final String gatewayId;
  final String campaignId;
  final String status;
  final String crdAcptId;
  final dynamic crdAcptLoc;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  Alltransaction({
    required this.id,
    required this.tId,
    required this.charityId,
    required this.charityName,
    required this.userId,
    required this.donationId,
    required this.standingDonationdetailsId,
    required this.source,
    required this.tType,
    required this.commission,
    required this.amount,
    required this.note,
    required this.name,
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

  Alltransaction copyWith({
    int? id,
    String? tId,
    dynamic charityId,
    dynamic charityName,
    String? userId,
    dynamic donationId,
    dynamic standingDonationdetailsId,
    dynamic source,
    dynamic tType,
    String? commission,
    String? amount,
    dynamic note,
    dynamic name,
    dynamic tUnq,
    dynamic orderId,
    dynamic chequeNo,
    String? title,
    String? pending,
    dynamic gift,
    String? notification,
    dynamic gatewayId,
    dynamic campaignId,
    String? status,
    String? crdAcptId,
    dynamic crdAcptLoc,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Alltransaction(
        id: id ?? this.id,
        tId: tId ?? this.tId,
        charityId: charityId ?? this.charityId,
        charityName: charityId ?? this.charityName,
        userId: userId ?? this.userId,
        donationId: donationId ?? this.donationId,
        standingDonationdetailsId: standingDonationdetailsId ?? this.standingDonationdetailsId,
        source: source ?? this.source,
        tType: tType ?? this.tType,
        commission: commission ?? this.commission,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        name: name ?? this.name,
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

  factory Alltransaction.fromRawJson(String str) => Alltransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alltransaction.fromJson(Map<String, dynamic> json) => Alltransaction(
    id: json["id"],
    tId: json["t_id"],
    charityId:json["charity_id"]==null?'':json["charity_id"],
    charityName:json["charityName"]==null?'':json["charityName"],
    userId:json["user_id"]==null?'':json["user_id"],
    donationId: json["donation_id"]==null?'':json["donation_id"],
    standingDonationdetailsId: json["standing_donationdetails_id"]==null?'':json["standing_donationdetails_id"], //json["standing_donationdetails_id"],
    source: json["source"]==null?'':json["source"],
    tType: json["t_type"]==null?'':json["t_type"],
    commission: json["commission"],
    amount: json["amount"],
    note: json["note"]==null?'':json["note"],//json["note"],
    name: json["name"]==null?'':json["name"],//json["note"],
    tUnq:  json["t_unq"]==null?'':json["t_unq"],//json["t_unq"],
    orderId:json["order_id"]==null?'':json["order_id"],// json["order_id"],
    chequeNo:json["cheque_no"]==null?'':json["cheque_no"], //json["cheque_no"],
    title: json["title"]==null?'':json["title"],
    pending: json["pending"]==null?'':json["pending"],
    gift: json["gift"]==null?'':json["gift"],//json["gift"],
    notification: json["notification"]==null?'':json["notification"],
    gatewayId: json["gateway_id"]==null?'':json["gateway_id"],//json["gateway_id"],
    campaignId: json["campaign_id"]==null?'':json["campaign_id"],//json["campaign_id"],
    status: json["status"]==null?'':json["status"],
    crdAcptId: json["crdAcptID"]==null?'':json["crdAcptID"],
    crdAcptLoc: json["crdAcptLoc"]==null?'':json["crdAcptLoc"],
    updatedBy:json["updated_by"]==null?'':json["updated_by"],// json["updated_by"],
    createdBy: json["created_by"]==null?'':json["created_by"],//json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "t_id": tId,
    "charity_id": charityId??'',
    "charityName": charityName??'',
    "user_id": userId,
    "donation_id": donationId,
    "standing_donationdetails_id": standingDonationdetailsId,
    "source": source,
    "t_type": tType,
    "commission": commission,
    "amount": amount,
    "note": note,
    "name": name,
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

class TransactionModel {
  final int id;
  final String tId;
  final dynamic charityId;
  final String userId;
  final dynamic donationId;
  final dynamic standingDonationdetailsId;
  final String source;
  final String tType;
  final String commission;
  final String amount;
  final dynamic note;
  final dynamic name;
  final dynamic tUnq;
  final dynamic orderId;
  final dynamic chequeNo;
  final String title;
  final String pending;
  final dynamic gift;
  final String notification;
  final dynamic gatewayId;
  final dynamic campaignId;
  final String status;
  final String crdAcptId;
  final String crdAcptLoc;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransactionModel({
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
    required this.name,
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

  TransactionModel copyWith({
    int? id,
    String? tId,
    dynamic charityId,
    String? userId,
    dynamic donationId,
    dynamic standingDonationdetailsId,
    String? source,
    String? tType,
    String? commission,
    String? amount,
    dynamic note,
    dynamic name,
    dynamic tUnq,
    dynamic orderId,
    dynamic chequeNo,
    String? title,
    String? pending,
    dynamic gift,
    String? notification,
    dynamic gatewayId,
    dynamic campaignId,
    String? status,
    String? crdAcptId,
    String? crdAcptLoc,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TransactionModel(
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
        name: name ?? this.name,
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

  factory TransactionModel.fromRawJson(String str) => TransactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json["id"],
    tId: json["t_id"],
    charityId: json["charity_id"],
    userId: json["user_id"],
    donationId: json["donation_id"],
    standingDonationdetailsId: json["standing_donationdetails_id"],
    source: json["source"]==null?'':json["source"],
    tType: json["t_type"],
    commission: json["commission"],
    amount: json["amount"],
    note: json["note"],
    name: json["name"],
    tUnq: json["t_unq"],
    orderId: json["order_id"],
    chequeNo: json["cheque_no"],
    title: json["title"],
    pending: json["pending"]==null?'':json["pending"],
    gift: json["gift"]==null?'':json["gift"],//json["gift"],
    notification: json["notification"],
    gatewayId: json["gateway_id"],
    campaignId: json["campaign_id"],
    status: json["status"],
    crdAcptId:json["crdAcptID"]==null?'':json["crdAcptID"],// json["crdAcptID"],
    crdAcptLoc: json["crdAcptLoc"]==null?'':json["crdAcptLoc"],//json["crdAcptLoc"],
    updatedBy:json["updated_by"]==null?'':json["updated_by"], //json["updated_by"],
    createdBy: json["created_by"]==null?'':json["created_by"],//json["created_by"],
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
    "name": name,
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
