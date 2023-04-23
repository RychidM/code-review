import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/dimensions.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int maxLines = 2;

  const AppText(
      {Key? key,
      required this.text,
      this.size = 19.1,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w400, this.textOverflow, this.textAlign, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyle ?? GoogleFonts.notoSans(
          fontSize: Dimensions.getDynamicHeight(size),
          color: color,
          fontWeight: fontWeight,
          textStyle: TextStyle(overflow: textOverflow)
        ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
