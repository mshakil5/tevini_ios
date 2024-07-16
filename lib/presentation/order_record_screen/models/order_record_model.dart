


import 'package:meta/meta.dart';
import 'dart:convert';

class OrderRecordModel {
  final int id;
  final dynamic orderId;
  final String userId;
  final String amount;
  final dynamic deliveryOption;
  final dynamic notification;
  final String status;
  final DateTime? updatedBy;
  final DateTime? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderRecordModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.amount,
    required this.deliveryOption,
    required this.notification,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  OrderRecordModel copyWith({
    int? id,
    dynamic orderId,
    String? userId,
    String? amount,
    dynamic deliveryOption,
    dynamic notification,
    String? status,
    DateTime? updatedBy,
    DateTime? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OrderRecordModel(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        deliveryOption: deliveryOption ?? this.deliveryOption,
        notification: notification ?? this.notification,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OrderRecordModel.fromRawJson(String str) => OrderRecordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderRecordModel.fromJson(Map<String, dynamic> json) => OrderRecordModel(
    id: json["id"],
    orderId: json["order_id"],
    userId: json["user_id"],
    amount: json["amount"],
    deliveryOption: json["delivery_option"],
    notification: json["notification"],
    status: json["status"],
    updatedBy:
    json['updated_by'] != null
        ? DateTime.parse(json['updated_by'])
        : null,
    //json["updated_by"]?? DateTime.parse(json["updated_by"]) ,
    createdBy:
    json['created_by'] != null
        ? DateTime.parse(json['created_by'])
        : null,
    //DateTime.parse(json["created_by"]),
    createdAt:
    json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : null,
    //DateTime.parse(json["created_at"]),
    updatedAt:
    json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null,
    //DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "user_id": userId,
    "amount": amount,
    "delivery_option": deliveryOption,
    "notification": notification,
    "status": status,
    "updated_by": updatedBy!.toIso8601String(),
    "created_by": createdBy!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
