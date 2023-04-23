import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/dimensions.dart';
import 'app_colors.dart';
import 'app_dimens.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
        fontFamily: 'NotoSans',
        brightness: Brightness.light,
        primaryColor: AppColors.aPrimaryColor,
        primaryColorLight: AppColors.aPrimaryColorLight,
        scaffoldBackgroundColor: AppColors.sAppWhiteColor,
        backgroundColor: AppColors.aAppBgColor);
  }

  static TextStyle tableHeaderStyle = GoogleFonts.notoSans(
    fontSize: Dimensions.getDynamicHeight(
      AppDimens.sPadding18,
    ),
    color: AppColors.aTextTabTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle tableCaptionStyle = GoogleFonts.notoSans(
    fontSize: Dimensions.getDynamicHeight(
      AppDimens.sFontSize14,
    ),
    color: AppColors.sTextTabSecTextColor,
    fontWeight: FontWeight.w400,
  );
}
