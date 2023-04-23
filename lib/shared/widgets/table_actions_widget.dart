import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';
import '../resources/app_dimens.dart';

class TableActions extends StatelessWidget {
  const TableActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(
            Assets.iconsAddItem,
            height: Dimensions.getDynamicHeight(AppDimens.sPadding30),
            width: Dimensions.getDynamicWidth(AppDimens.sPadding30),
          ),
        ),
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding11)),
        InkWell(
          onTap: () {},
          child: Image.asset(
            Assets.iconsEditIcon,
            height: Dimensions.getDynamicHeight(AppDimens.sPadding30),
            width: Dimensions.getDynamicWidth(AppDimens.sPadding30),
          ),
        ),
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding11)),
        InkWell(
          onTap: () {},
          child: Image.asset(
            Assets.iconsDeleteIcon,
            height: Dimensions.getDynamicHeight(AppDimens.sPadding30),
            width: Dimensions.getDynamicWidth(AppDimens.sPadding30),
          ),
        ),
      ],
    );
  }
}
