// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

import 'package:stock_savvy/network/models/json_response.dart';

UserAuthModel userAuthModelFromJson(dynamic str) => UserAuthModel.fromJson(str);

String userAuthModelToJson(UserAuthModel data) => json.encode(data.toJson());

UserInfo userInfoFromJson(dynamic str) => UserInfo.fromJson(str);

class UserAuthModel extends JsonResponse {
  UserAuthModel({
    this.data,
  });

  UserInfo? data;

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    data = json["data"] == null ? null : UserInfo.fromJson(json["data"]);
    return super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    map["data"] = data?.toJson();
    return super.toJson();
  }
}

class UserInfo {
  UserInfo({
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.adminId,
    this.userId,
    this.password,
    this.phoneNumber,
  });
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? adminId;
  String? userId;
  String? password;
  String? phoneNumber;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        email: json["email"],
        adminId: json["admin_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "email": email,
        "admin_id": adminId,
        "password": password,
        "phone_number": phoneNumber,
        "user_id": userId,
      };

  UserInfo copyWith({
    String? firstName,
    String? lastName,
    String? role,
    String? email,
    String? adminId,
    String? userId,
    String? password,
    String? phoneNumber,
  }) =>
      UserInfo(
        adminId: adminId ?? this.adminId,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
        email: email ?? this.email,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}
