import 'package:meta/meta.dart';
import 'dart:convert';

class DonorModel {
  final int id;
  final String name;
  final String email;

  DonorModel({
    required this.id,
    required this.name,
    required this.email,
  });

  DonorModel copyWith({
    int? id,
    String? name,
    String? email,
  }) =>
      DonorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  factory DonorModel.fromRawJson(String str) => DonorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonorModel.fromJson(Map<String, dynamic> json) => DonorModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
