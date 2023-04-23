import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/generated/assets.dart';
import 'package:stock_savvy/shared/resources/app_colors.dart';
import 'package:stock_savvy/shared/widgets/custom_text_field.dart';
import 'package:stock_savvy/utils/form_validator.dart';

import '../shared/resources/app_dimens.dart';
import '../shared/resources/app_text.dart';
import '../shared/resources/app_theme.dart';
import '../shared/widgets/custom_elevated_btn.dart';
import 'dimensions.dart';

class Dialogs {
  /// custom toast message
  static Future showToast(
      {required String msg, Color? bgColor, Color? textColor}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      textColor: textColor,
      backgroundColor: bgColor,
    );
  }

  showAddWarehouseDialog() {
    return Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: '',
      middleText: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: Container(
        width: Dimensions.getDynamicWidth(AppDimens.sPadding500),
        decoration: const BoxDecoration(),
        child: Container(
          padding:
              EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding30)),
          child: Stack(
            children: [_dialogCloseBtn, _dialogContent],
          ),
        ),
      ),
    );
  }

  Column get _dialogContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.sBorderRadius7),
              child: Image.asset(
                Assets.iconsTruckIcon,
                height: Dimensions.getDynamicHeight(AppDimens.sPadding60),
                width: Dimensions.getDynamicWidth(AppDimens.sPadding60),
                filterQuality: FilterQuality.high,
              ),
            ),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding15)),
            const AppText(
              text: 'Create Warehouse',
              size: AppDimens.sFontSize27,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Gap(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
        Form(
          child: Column(
            children: [
              _warehouseNameField,
              Gap(Dimensions.getDynamicWidth(AppDimens.sPadding30)),
              _warehouseLocationField,
              Gap(Dimensions.getDynamicHeight(AppDimens.sPadding55)),
              _closeCancelBtn,
            ],
          ),
        ),
      ],
    );
  }

  Row get _closeCancelBtn {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomElevatedButton(
            btnWidth: AppDimens.sPadding120,
            borderRadius: AppDimens.sPadding50,
            btnColor: Colors.transparent,
            side: const BorderSide(color: AppColors.aPrimaryColor),
            label: 'Cancel',
            labelColor: AppColors.aPrimaryColor,
            onTap: () => Get.back()),
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
        CustomElevatedButton(
            borderRadius: AppDimens.sPadding50, label: 'Create', onTap: () {}),
      ],
    );
  }

  CustomTextField get _warehouseLocationField => CustomTextField(
        onChange: (value) {},
        keyboardType: TextInputType.name,
        inputDecoration: InputDecoration(
            labelText: 'Location *',
            floatingLabelStyle: AppTheme.tableCaptionStyle
                .copyWith(fontSize: AppDimens.sPadding25),
            labelStyle: AppTheme.tableCaptionStyle
                .copyWith(fontSize: AppDimens.sPadding20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.sPadding12))),
        validator: FormValidator.requiredValidator,
      );

  CustomTextField get _warehouseNameField => CustomTextField(
        onChange: (value) {},
        inputDecoration: InputDecoration(
          labelText: 'Name *',
          floatingLabelStyle: AppTheme.tableCaptionStyle
              .copyWith(fontSize: AppDimens.sPadding25),
          labelStyle: AppTheme.tableCaptionStyle
              .copyWith(fontSize: AppDimens.sPadding20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.sPadding12)),
        ),
        validator: FormValidator.requiredValidator,
      );

  static Positioned get _dialogCloseBtn {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: Dimensions.getDynamicHeight(AppDimens.sPadding50),
        width: Dimensions.getDynamicWidth(AppDimens.sPadding50),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.aPrimaryColor),
      ),
    );
  }

  static showNoInternetSnackbar() {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 4),
      maxWidth: Dimensions.getDynamicWidth(250),
      animationDuration: const Duration(seconds: 1),
      borderRadius: Dimensions.getDynamicHeight(AppDimens.sBorderRadius8),
      messageText: const AppText(
        text: 'There is no internet connection',
        size: AppDimens.sFontSize14,
        color: AppColors.sAppWhiteColor,
      ),
      icon: Padding(
        padding: EdgeInsets.only(left: Dimensions.getDynamicWidth(10)),
        child: SizedBox(
          height: Dimensions.getDynamicHeight(35),
          child: Image.asset(
            Assets.iconsErrorIcon,
            color: AppColors.sAppWhiteColor,
          ),
        ),
      ),
    ));
  }
}
