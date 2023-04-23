import 'package:flutter/cupertino.dart';

class Dimensions {
  static late MediaQueryData _mediaQueryData;
  static late double phoneScreenWidth;
  static late double phoneScreenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    phoneScreenHeight = _mediaQueryData.size.height;
    phoneScreenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }

  static double getDynamicWidth(double width) {
    double screenWidth = Dimensions.phoneScreenWidth;
    double designWidth = 1440;
    return (width / designWidth) * screenWidth;
  }

  static double getDynamicHeight(double height) {
    double screenHeight = Dimensions.phoneScreenHeight;
    double designHeight = 960;
    return (height / designHeight) * screenHeight;
  }
}
