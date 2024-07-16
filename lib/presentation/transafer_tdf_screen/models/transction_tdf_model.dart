import 'package:meta/meta.dart';
import 'dart:convert';

class TranscationTdfModel {
  final int id;
  final DateTime issueDate;
  final DateTime? paymentDate;
  final dynamic userId;
  final String tdfaccount;
  final dynamic tdfAmount;
  final dynamic currentDollarAmount;
  final dynamic paymentDollarAmount;
  final String status;
  final DateTime? updatedBy;
  final DateTime? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TranscationTdfModel({
    required this.id,
    required this.issueDate,
    required this.paymentDate,
    required this.userId,
    required this.tdfaccount,
    required this.tdfAmount,
    required this.currentDollarAmount,
    required this.paymentDollarAmount,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  TranscationTdfModel copyWith({
    int? id,
    DateTime? issueDate,
    DateTime? paymentDate,
    dynamic userId,
    String? tdfaccount,
    dynamic tdfAmount,
    dynamic currentDollarAmount,
    dynamic paymentDollarAmount,
    String? status,
    DateTime? updatedBy,
    DateTime? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TranscationTdfModel(
        id: id ?? this.id,
        issueDate: issueDate ?? this.issueDate,
        paymentDate: paymentDate ?? this.paymentDate,
        userId: userId ?? this.userId,
        tdfaccount: tdfaccount ?? this.tdfaccount,
        tdfAmount: tdfAmount ?? this.tdfAmount,
        currentDollarAmount: currentDollarAmount ?? this.currentDollarAmount,
        paymentDollarAmount: paymentDollarAmount ?? this.paymentDollarAmount,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TranscationTdfModel.fromRawJson(String str) => TranscationTdfModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranscationTdfModel.fromJson(Map<String, dynamic> json) => TranscationTdfModel(
    id: json["id"],
    issueDate: DateTime.parse(json["issue_date"]),
    paymentDate:
    json['payment_date'] != null
        ? DateTime.parse(json['payment_date'])
        : null,
    //DateTime.parse(json["payment_date"])??DateTime.timestamp(),
    userId:
    json["user_id"]==null?0:json["user_id"],
    //json["user_id"],
    tdfaccount:
    json["tdfaccount"]==null?'':json["tdfaccount"],
    //json["tdfaccount"],
    tdfAmount: json["tdf_amount"]==null?'':json["tdf_amount"],
   // json["tdf_amount"],
    currentDollarAmount:
     json["current_dollar_amount"]==null?'':json["current_dollar_amount"],

    //json["current_dollar_amount"],
    paymentDollarAmount:
     json["payment_dollar_amount"]==null?'':json["payment_dollar_amount"],

    //json["payment_dollar_amount"],
    status:
     json["status"]==null?'':json["status"],

    //json["status"],
    updatedBy:
    json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null,
    //json['updated_at'] != null ?json["updated_by"]:"",
    createdBy:
    json['created_by'] != null
        ? DateTime.parse(json['created_by'])
        : null,
    //json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt:
    json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null,
    //DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "issue_date": "${issueDate.year.toString().padLeft(4, '0')}-${issueDate.month.toString().padLeft(2, '0')}-${issueDate.day.toString().padLeft(2, '0')}",
    "payment_date": paymentDate!.toIso8601String(),
    "user_id": userId,
    "tdfaccount": tdfaccount,
    "tdf_amount": tdfAmount,
    "current_dollar_amount": currentDollarAmount,
    "payment_dollar_amount": paymentDollarAmount,
    "status": status,
    "updated_by": updatedBy!.toIso8601String(),
    "created_by": createdBy!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
