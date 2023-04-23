import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text.dart';

class TableTitleWidget extends StatelessWidget {
  final String title;
  const TableTitleWidget({
    Key? key,
    this.title = AppStrings.sStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontWeight: FontWeight.w600,
        ),
        Row(
          children: [
            Image.asset(
              Assets.iconsRefreshIcon,
              height: Dimensions.getDynamicHeight(AppDimens.sPadding22),
              width: Dimensions.getDynamicWidth(AppDimens.sPadding20),
            ),
            Image.asset(
              Assets.iconsThreeDotsIcon,
              color: Colors.grey,
              height: Dimensions.getDynamicHeight(AppDimens.sPadding22),
              width: Dimensions.getDynamicWidth(AppDimens.sPadding20),
            )
          ],
        ),
      ],
    );
  }
}
