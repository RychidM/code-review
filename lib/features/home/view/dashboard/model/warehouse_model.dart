// To parse this JSON data, do
//
//     final warehouseModel = warehouseModelFromJson(jsonString);

import 'dart:convert';

import 'package:stock_savvy/network/models/warehouse_json_response.dart';

WarehouseModel warehouseModelFromJson(Map<String, dynamic>  str) => WarehouseModel.fromJson(str);

String warehouseModelToJson(WarehouseModel data) => json.encode(data.toJson());

class WarehouseModel extends WarehouseResponse{
    WarehouseModel({
        this.data,
    });

    Data? data;

    WarehouseModel copyWith({
        String? respCode,
        String? respMsg,
        Data? data,
    }) => 
        WarehouseModel(
            data: data ?? this.data,
        );

    factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    @override
      Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.name,
        this.id,
        this.adminId,
        this.location,
    });

    String? name;
    String? id;
    String? adminId;
    String? location;

    Data copyWith({
        String? name,
        String? id,
        String? adminId,
        String? location,
    }) => 
        Data(
            name: name ?? this.name,
            id: id ?? this.id,
            adminId: adminId ?? this.adminId,
            location: location ?? this.location,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["id"],
        adminId: json["admin_id"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "admin_id": adminId,
        "location": location,
    };
}
