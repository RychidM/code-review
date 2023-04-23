import 'package:flutter/material.dart';

class WarehouseOverViewModel {
  String title;
  String img;
  double? itemValue;
  int? totalStock;
  int? totalIn;
  int? totalOut;
  double? progressValue;
  Color cornerImgColor;
  bool? hasCurrency;

  WarehouseOverViewModel({
    required this.title,
    required this.img,
    this.itemValue = 0.00,
    required this.cornerImgColor,
    this.progressValue = .02,
    this.hasCurrency = false,
    this.totalIn = 0,
    this.totalOut = 0,
    this.totalStock = 0,
  });
}

