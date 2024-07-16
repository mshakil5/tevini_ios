import '../../../core/app_export.dart';
import 'package:tenvini/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [make_a_donation_screen],
/// and is typically used to hold data that is passed between different parts of the application.
/*class MakeADonationModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
}*/

import 'package:meta/meta.dart';
import 'dart:convert';

class BeneficiaryGetAllCharityModel {
  final int id;
  final String name;
  final String address;
  final String number;
  final String email;
  final String password;
  final dynamic bankStatement;
  final String town;
  final String postCode;
  final String accNo;
  final String balance;
  final dynamic pending;
  final String status;
  final dynamic updatedBy;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;


  BeneficiaryGetAllCharityModel({
    required this.id,
    required this.name,
    required this.address,
    required this.number,
    required this.email,
    required this.password,
    required this.bankStatement,
    required this.town,
    required this.postCode,
    required this.accNo,
    required this.balance,
    required this.pending,
    required this.status,
    required this.updatedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });



  BeneficiaryGetAllCharityModel copyWith({
    int? id,
    String? name,
    String? address,
    String? number,
    String? email,
    String? password,
    dynamic bankStatement,
    String? town,
    String? postCode,
    String? accNo,
    String? balance,
    dynamic pending,
    String? status,
    dynamic updatedBy,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      BeneficiaryGetAllCharityModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        number: number ?? this.number,
        email: email ?? this.email,
        password: password ?? this.password,
        bankStatement: bankStatement ?? this.bankStatement,
        town: town ?? this.town,
        postCode: postCode ?? this.postCode,
        accNo: accNo ?? this.accNo,
        balance: balance ?? this.balance,
        pending: pending ?? this.pending,
        status: status ?? this.status,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory BeneficiaryGetAllCharityModel.fromRawJson(String str) => BeneficiaryGetAllCharityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BeneficiaryGetAllCharityModel.fromJson(Map<String, dynamic> json) => BeneficiaryGetAllCharityModel(
    id: json["id"],
    name: json["name"],
    address:
    json["address"]==null?'':json["address"],
    //json["address"],
    number:
    json["number"]==null?'':json["number"],
    //json["number"],
    email:
    json["email"]==null?'':json["email"],
    //json["number"],
   // json["email"],
    password:
    json["password"]==null?'':json["password"],
    //json["password"],
    bankStatement:
    json["bank_statement"]==null?'':json["bank_statement"],
    //json["bank_statement"],
    town:
    json["town"]==null?'':json["town"],
    //json["town"],
    postCode:
    json["post_code"]==null?'':json["post_code"],
   // json["post_code"],
    accNo:
    json["acc_no"]==null?'':json["acc_no"],
  //  json["acc_no"],
    balance:
    json["balance"]==null?'':json["balance"],
    //json["balance"],
    pending:
    json["pending"]==null?'':json["pending"],
  //  json["pending"],
    status:
    json["status"]==null?'':json["status"],
    //json["status"],
    updatedBy:
    json["updated_by"]==null?'':json["updated_by"],
    //json["updated_by"],
    createdBy:
    json["created_by"]==null?'':json["created_by"],
    //json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "number": number,
    "email": email,
    "password": password,
    "bank_statement": bankStatement,
    "town": town,
    "post_code": postCode,
    "acc_no": accNo,
    "balance": balance,
    "pending": pending,
    "status": status,
    "updated_by": updatedBy,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
