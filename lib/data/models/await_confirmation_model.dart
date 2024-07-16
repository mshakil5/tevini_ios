import 'package:meta/meta.dart';
import 'dart:convert';

class AwaitConfirmationModel {
  final int id;
  final dynamic charityId;
  final dynamic userId;
  final dynamic batchId;
  final dynamic donorAcc;
  final dynamic chequeNo;
  final String voucherType;
  final dynamic amount;
  final String note;
  final String waiting;
  final String status;
  final String tranId;
  final String updatedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  AwaitConfirmationModel({
    required this.id,
    required this.charityId,
    required this.userId,
    required this.batchId,
    required this.donorAcc,
    required this.chequeNo,
    required this.voucherType,
    required this.amount,
    required this.note,
    required this.waiting,
    required this.status,
    required this.tranId,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  AwaitConfirmationModel copyWith({
    int? id,
    dynamic charityId,
    dynamic userId,
    dynamic batchId,
    dynamic donorAcc,
    dynamic chequeNo,
    String? voucherType,
    dynamic amount,
    String? note,
    String? waiting,
    String? status,
    String? tranId,
    String? updatedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AwaitConfirmationModel(
        id: id ?? this.id,
        charityId: charityId ?? this.charityId,
        userId: userId ?? this.userId,
        batchId: batchId ?? this.batchId,
        donorAcc: donorAcc ?? this.donorAcc,
        chequeNo: chequeNo ?? this.chequeNo,
        voucherType: voucherType ?? this.voucherType,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        waiting: waiting ?? this.waiting,
        status: status ?? this.status,
        tranId: tranId ?? this.tranId,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AwaitConfirmationModel.fromRawJson(String str) => AwaitConfirmationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AwaitConfirmationModel.fromJson(Map<String, dynamic> json) => AwaitConfirmationModel(
    id: json["id"]==null?'0':json["id"],
    charityId: json["charity_id"]==null?'0':json["charity_id"],
    userId: json["user_id"]==null?'0':json["user_id"],
    batchId: json["batch_id"]==null?'0':json["batch_id"],
    donorAcc: json["donor_acc"]==null?'0':json["donor_acc"],
    chequeNo: json["cheque_no"]==null?'0':json["cheque_no"],//json["cheque_no"],
    voucherType: json["voucher_type"]==null?'0':json["voucher_type"],//json["voucher_type"],
    amount: json["amount"]==null?'0':json["amount"],//json["amount"],
    note: json["note"]==null?'':json["note"],//json["note"],
    waiting: json["waiting"]==null?'0':json["waiting"],//json["waiting"],
    status: json["status"]==null?'':json["status"],//json["status"],
    tranId: json["tran_id"]==null?'':json["tran_id"],//json["tran_id"],
    updatedBy:json["updated_by"]==null?'':json["updated_by"],// json["updated_by"],
    createdBy: json["created_by"]==null?'':json["created_by"],//json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "charity_id": charityId,
    "user_id": userId,
    "batch_id": batchId,
    "donor_acc": donorAcc,
    "cheque_no": chequeNo,
    "voucher_type": voucherType,
    "amount": amount,
    "note": note,
    "waiting": waiting,
    "status": status,
    "tran_id": tranId,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
