import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:stock_savvy/generated/assets.dart';
import 'package:stock_savvy/shared/resources/app_colors.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/shared/resources/app_strings.dart';
import 'package:stock_savvy/shared/resources/app_text.dart';

import '../../../utils/dimensions.dart';

class NotificationBody extends StatelessWidget {
  final String? title;
  final String? msg;
  final Color iconBgColor;
  final String iconString;
  final VoidCallback? onTap;
  final Color titleColor;
  final Color subTitleColor;

  const NotificationBody(
      {super.key,
      this.title,
      this.msg,
      this.iconBgColor = AppColors.sSuccessIconBgColor,
      this.iconString = Assets.iconsSuccessIcon,
      this.titleColor = AppColors.aTextTabTextColor,
      this.subTitleColor = AppColors.sTextTabSecTextColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.getDynamicHeight(AppDimens.sPadding5),
          horizontal: Dimensions.getDynamicWidth(AppDimens.sPadding5),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.sPadding50),
          color: AppColors.sAppWhiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(-1, 7),
                blurRadius: 13,
                spreadRadius: .7,
                color: AppColors.aSecondaryTextColor.withOpacity(.12)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Dimensions.getDynamicHeight(AppDimens.sPadding75),
              width: Dimensions.getDynamicWidth(AppDimens.sPadding75),
              padding: EdgeInsets.all(
                  Dimensions.getDynamicHeight(AppDimens.sPadding20)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBgColor,
              ),
              child: Image.asset(iconString),
            ),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title ?? AppStrings.sProdAddedTitle,
                  size: AppDimens.sFontSize22,
                  fontWeight: FontWeight.w600,
                  color: titleColor,
                ),
                Gap(Dimensions.getDynamicHeight(AppDimens.sPadding5)),
                SizedBox(
                  width: Dimensions.getDynamicWidth(400),
                  child: AppText(
                    text: msg ?? AppStrings.sProdAddedMsg,
                    color: subTitleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
