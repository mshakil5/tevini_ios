import 'package:meta/meta.dart';
import 'dart:convert';

class ProfileInfoModel {
  final int? id;
  final String? creditProfileId;
  final String? name;
  final String? email;
  final String? number;
  final String? emailVerifiedAt;
  final String? isType;
  final String? address;
  final String? addressTwo;
  final String? addressThird;
  final String? title;
  final String? country;
  final String? city;
  final String? phone;
  final String? surname;
  final String? houseno;
  final String? street;
  final String? town;
  final String? postcode;
  final String? postcodeD;
  final String? accountno;
  final String? balance;
  final dynamic expected_gift_aid;

  final String? account_name;
  final String? account_number;
  final String? account_sortcode;
 
  final String? overdrawnAmount;
  final String? photo;
  final String? cImage;
  final String? status;
  final String? passwordchk;
  final String? about;
  final String? facebook;
  final String? twitter;
  final String? google;
  final String? linkedin;
  final String? notification;
  final String? updatedBy;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileInfoModel({
     this.id,
     this.creditProfileId,
     this.name,
     this.email,
     this.number,
     this.emailVerifiedAt,
     this.isType,
     this.address,
     this.addressTwo,
     this.addressThird,
     this.title,
     this.country,
     this.city,
     this.phone,
     this.surname,
     this.houseno,
     this.street,
     this.town,
     this.postcode,
     this.postcodeD,
     this.accountno,
     this.balance,
    this.expected_gift_aid,
    this.account_name,
    this. account_number,
    this. account_sortcode,
     this.overdrawnAmount,
    
     this.photo,
     this.cImage,
     this.status,
     this.passwordchk,
     this.about,
     this.facebook,
     this.twitter,
     this.google,
     this.linkedin,
     this.notification,
     this.updatedBy,
     this.createdBy,
     this.createdAt,
     this.updatedAt,
  });

  ProfileInfoModel copyWith({
    int? id,
    String? creditProfileId,
    String? name,
    String? email,
    String? number,
    String? emailVerifiedAt,
    String? isType,
    String? address,
    String? addressTwo,
    String? addressThird,
    String? title,
    String? country,
    String? city,
    String? phone,
    String? surname,
    String? houseno,
    String? street,
    String? town,
    String? postcode,
    String? postcodeD,
    String? accountno,
    String? balance,
    dynamic expected_gift_aid,

    String? account_name,
    String? account_number,
    String? account_sortcode,
    String? overdrawnAmount,
    String? photo,
    String? cImage,
    String? status,
    String? passwordchk,
    String? about,
    String? facebook,
    String? twitter,
    String? google,
    String? linkedin,
    String? notification,
    String? updatedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ProfileInfoModel(
        id: id ?? this.id,
        creditProfileId: creditProfileId ?? this.creditProfileId,
        name: name ?? this.name,
        email: email ?? this.email,
        number: email ?? this.number,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        isType: isType ?? this.isType,
        address: address ?? this.address,
        addressTwo: address ?? this.addressTwo,
        addressThird: address ?? this.addressThird,
        title: title ?? this.title,
        country: country ?? this.country,
        city: city ?? this.city,
        phone: phone ?? this.phone,
        surname: surname ?? this.surname,
        houseno: houseno ?? this.houseno,
        street: street ?? this.street,
        town: town ?? this.town,
        postcode: postcode ?? this.postcode,
        postcodeD: postcode ?? this.postcodeD,
        accountno: accountno ?? this.accountno,
        balance: balance ?? this.balance,
        expected_gift_aid: expected_gift_aid ?? this.expected_gift_aid,

        account_name: account_name ?? this.account_name,
        account_number: account_number ?? this.account_number,
        account_sortcode: account_sortcode ?? this.account_sortcode,


        
        overdrawnAmount: overdrawnAmount ?? this.overdrawnAmount,
        photo: photo ?? this.photo,
        cImage: cImage ?? this.cImage,
        status: status ?? this.status,
        passwordchk: passwordchk ?? this.passwordchk,
        about: about ?? this.about,
        facebook: facebook ?? this.facebook,
        twitter: twitter ?? this.twitter,
        google: google ?? this.google,
        linkedin: linkedin ?? this.linkedin,
        notification: notification ?? this.notification,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ProfileInfoModel.fromRawJson(String str) => ProfileInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => ProfileInfoModel(
    id: json["id"],
    creditProfileId: json["CreditProfileId"],
    name: json["name"],
    email: json["email"],
    number: json["number"],
    emailVerifiedAt:json["email_verified_at"]==null?"": json["email_verified_at"],
    isType: json["is_type"]==null?"":json["is_type"],
    address:json["address"]==null?"": json["address"],
    addressTwo:json["address_second_line"]==null?"": json["address_second_line"],
    addressThird:json["address_third_line"]==null?"": json["address_third_line"],
    title:json["title"]==null?"": json["title"],
    country: json["country"]==null?"":json["country"],
    city: json["city"]==null?"":json["city"],
    phone:json["phone"]==null?"":  json["phone"],
    surname:json["surname"]==null?"":  json["surname"],
    houseno:json["houseno"]==null?"":  json["houseno"],
    street: json["street"]==null?"": json["street"],
    town: json["town"]==null?"": json["town"],
    postcode:json["post_code"]==null?"":  json["post_code"],
    postcodeD:json["postcode"]==null?"":  json["postcode"],
    accountno:json["accountno"]==null?"":  json["accountno"],

    expected_gift_aid: json["expected_gift_aid"]==null?"":  json["expected_gift_aid"],
    account_name: json["account_name"]==null?"":  json["account_name"],
    account_number: json["account_number"]==null?"":  json["account_number"],
    account_sortcode: json["account_sortcode"]==null?"":  json["account_sortcode"],


    overdrawnAmount: json["overdrawn_amount"],
    photo: json["photo"]==null?"": json["photo"],
    cImage:json["c_image"]==null?"":  json["c_image"],
    status: json["status"]==null?"": json["status"],
    passwordchk:json["passwordchk"]==null?"":  json["passwordchk"],
    about:json["about"]==null?"": json["about"],
    facebook:json["facebook"]==null?"": json["facebook"],
    twitter:json["twitter"]==null?"": json["twitter"],
    google: json["google"]==null?"":json["google"],
    linkedin:json["linkedin"]==null?"": json["linkedin"],
    notification: json["notification"]==null?"": json["notification"],
    updatedBy:json["updated_by"]==null?"": json["updated_by"],
    createdBy: json["created_by"]==null?"": json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "CreditProfileId": creditProfileId,
    "name": name,
    "email": email,
    "number": number,
    "email_verified_at": emailVerifiedAt,
    "is_type": isType,
    "address": address,
    "address_second_line": addressTwo,
    "address_third_line": addressThird,
    "title": title,
    "country": country,
    "city": city,
    "phone": phone,
    "surname": surname,
    "houseno": houseno,
    "street": street,
    "town": town,
    "postcode": postcode,
    "postcodeD": postcodeD,
    "accountno": accountno,
    "balance": balance,
    "expected_gift_aid": expected_gift_aid,

    "account_name":account_name,
    "account_number":account_number,
    "account_sortcode":account_sortcode,

    "overdrawn_amount": overdrawnAmount,
    "photo": photo,
    "c_image": cImage,
    "status": status,
    "passwordchk": passwordchk,
    "about": about,
    "facebook": facebook,
    "twitter": twitter,
    "google": google,
    "linkedin": linkedin,
    "notification": notification,
    "updated_by": '',
    "created_by": '',
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}


