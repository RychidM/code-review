import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/dimensions.dart';
import '../resources/app_text.dart';

class IconText extends StatelessWidget {
  final String textString;
  final Widget? prefix;
  final Widget? suffix;
  final double spacing;
  final Widget? text;
  final double fontSize;
  final FontWeight fontWeight;
  const IconText({
    Key? key,
    required this.textString,
    this.prefix,
    this.suffix,
    this.spacing = 7,
    this.text, this.fontSize = 33, this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefix ?? Container(),
        Gap(Dimensions.getDynamicWidth(spacing)),
        AppText(
          text: textString,
          size: fontSize,
          fontWeight: fontWeight,
        ),
        Gap(Dimensions.getDynamicWidth(spacing)),
        suffix ?? Container(),
      ],
    );
  }
}