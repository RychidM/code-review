import 'package:flutter/material.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/shared/resources/app_theme.dart';

import '../../utils/dimensions.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintTextStyle;
  final bool? isFilled;
  final bool? obscureText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputDecoration? inputDecoration;
  final InputBorder? inputBorder;
  final ValueChanged<String> onChange;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final double borderRadius;
  final TextStyle? style;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.hintTextStyle,
    this.isFilled = true,
    this.obscureText = false,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputDecoration,
    this.inputBorder,
    required this.onChange,
    this.controller,
    this.validator,
    this.enabled,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.contentPaddingHorizontal = 25,
    this.contentPaddingVertical = 25,
    this.borderRadius = 15,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChange,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enableInteractiveSelection: true,
      onTap: onTap,
      style: style ??
          AppTheme.tableHeaderStyle.copyWith(
              color: Colors.black87,
              fontSize: Dimensions.getDynamicHeight(AppDimens.sPadding20)),
      decoration: inputDecoration ??
          InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.getDynamicWidth(contentPaddingHorizontal),
              vertical: Dimensions.getDynamicWidth(contentPaddingVertical),
            ),
            hintText: hintText ?? AppStrings.sEmailOrPasswordText,
            hintStyle: hintTextStyle ??
                Theme.of(context).textTheme.caption?.copyWith(
                    fontSize:
                        Dimensions.getDynamicHeight(AppDimens.sPadding20)),
            filled: isFilled ?? true,
            fillColor: fillColor ?? AppColors.aTextFieldFillColor,
            prefix: prefixIcon,
            suffixIcon: suffixIcon,
            border: inputBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                        Dimensions.getDynamicHeight(borderRadius))),
            errorMaxLines: 2,
          ),
      validator: validator,
      enabled: enabled,
    );
  }
}
