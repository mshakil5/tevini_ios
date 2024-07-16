import 'dart:convert';

import '../../../core/app_export.dart';
import 'order_voucher_item_model.dart';

/// This class defines the variables used in the [order_voucher_books_screen],
/// and is typically used to hold data that is passed between different parts of the application.




class OrderVoucherBookModel1 {
  final int id;
  final String type;
   String amount;
  final String singleAmount;
  String stock;
  final String note;
  final String status;
  dynamic qty='0.0';

  final dynamic updatedBy;
  final dynamic createdBy;
  final dynamic createdAt;
  final DateTime updatedAt;
  //final String totalAmount;

  OrderVoucherBookModel1({
    required this.id,
    required this.type,
    required this.amount,
    required this.singleAmount,
    required this.stock,
    required this.note,
    required this.qty,

    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
   //  this.totalAmount='',
  });

  OrderVoucherBookModel1 copyWith({
    int? id,
    String? type,
    String? amount,
    String? singleAmount,
    String? stock,
    String? note,

    String? status,
    dynamic updatedBy,
    dynamic createdBy,
    dynamic createdAt,
    DateTime? updatedAt,
   // String? totalAmount,
  }) =>
      OrderVoucherBookModel1(
        id: id ?? this.id,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        singleAmount: singleAmount ?? this.singleAmount,
        stock: stock ?? this.stock,
        note: note ?? this.note,
        qty: qty ?? this.qty,
        status: status ?? this.status,

        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
       // totalAmount: totalAmount ?? this.totalAmount,
      );

  factory OrderVoucherBookModel1.fromRawJson(String str) => OrderVoucherBookModel1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderVoucherBookModel1.fromJson(Map<String, dynamic> json) => OrderVoucherBookModel1(
    id: json["id"],
    type: json["type"],
    amount: json["amount"],
    singleAmount: json["single_amount"],
    stock: json["stock"],
    note: json["note"],
    status: json["status"],
    updatedBy: json["updated_by"],
    qty: json["qty"]==null?'0':json["qty"],

    createdBy: json["created_by"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    //totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "amount": amount,
    "single_amount": singleAmount,
    "stock": stock,

    "note": note,
    "qty": qty,
    "status": status,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt,
  //  "totalAmount": totalAmount,
    "updated_at": updatedAt.toIso8601String(),
  };
}
