import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../resources/app_colors.dart';
import '../resources/app_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final String label;
  final double labelTextSize;
  final Color labelColor;
  final VoidCallback onTap;
  final Color btnColor;
  final double btnHeight;
  final double btnWidth;
  final double borderRadius;
  final double elevation;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final EdgeInsetsGeometry? margin;

  const CustomElevatedButton({
    Key? key,
    this.child,
    this.label = 'Label',
    this.labelTextSize = 14.0,
    this.labelColor = AppColors.sAppWhiteColor,
    required this.onTap,
    this.btnColor = AppColors.aPrimaryColor,
    this.btnHeight = 55.0,
    this.btnWidth = 105.0,
    this.elevation = 0,
    this.borderRadius = 9.0,
    this.shape,
    this.side,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Container(
      height: Dimensions.getDynamicHeight(btnHeight),
      width: (Dimensions.getDynamicWidth(btnWidth)),
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: btnColor,
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.getDynamicHeight(borderRadius),
                  ),
                  side: side ?? BorderSide.none),
        ),
        onPressed: onTap,
        child: child ??
            AppText(
              text: label,
              color: labelColor,
              size: Dimensions.getDynamicHeight(labelTextSize),
            ),
      ),
    );
  }
}
