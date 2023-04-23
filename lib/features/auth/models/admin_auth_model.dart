// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

import 'package:stock_savvy/network/models/json_response.dart';

AdminAuthModel authModelFromJson(dynamic str) => AdminAuthModel.fromJson(str);

String adminAuthModelToJson(AdminAuthModel data) => json.encode(data.toJson());

AdminInfo adminInfoFromJson(dynamic str) => AdminInfo.fromJson(str);

class AdminAuthModel extends JsonResponse {
  AdminAuthModel({
    this.data,
  });

  AdminInfo? data;

  AdminAuthModel.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    data = json["data"] == null ? null : AdminInfo.fromJson(json["data"]);
    return super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    map["data"] = data?.toJson();
    return super.toJson();
  }
}

class AdminInfo {
  AdminInfo({
    this.firstName,
    this.lastName,
    this.identifier,
    this.email,
    this.adminId,
    this.password,
    this.phoneNumber,
  });
  String? firstName;
  String? lastName;
  String? identifier;
  String? email;
  String? adminId;
  String? password;
  String? phoneNumber;

  factory AdminInfo.fromJson(Map<String, dynamic> json) => AdminInfo(
        firstName: json["first_name"],
        lastName: json["last_name"],
        identifier: json["identifier"],
        email: json["email"],
        adminId: json["admin_id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "identifier": identifier,
        "email": email,
        "admin_id": adminId,
        "password": password,
        "phone_number": phoneNumber,
      };

  AdminInfo copyWith({
    String? firstName,
    String? lastName,
    String? identifier,
    String? email,
    String? adminId,
    String? password,
    String? phoneNumber,
  }) =>
      AdminInfo(
        adminId: adminId ?? this.adminId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        identifier: identifier ?? this.identifier,
        email: email ?? this.email,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}
