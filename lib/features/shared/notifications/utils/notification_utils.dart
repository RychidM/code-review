import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_savvy/features/shared/notifications/notification_body.dart';
import 'package:stock_savvy/features/shared/utils/utils.dart';
import 'package:stock_savvy/generated/assets.dart';
import 'package:stock_savvy/shared/resources/app_colors.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/shared/resources/app_strings.dart';
import 'package:stock_savvy/utils/dialogs.dart';

class NotificationUtils {
  static NotificationBody get couldNotProcessRequest {
    return const NotificationBody(
      iconString: Assets.iconsWarningIcon,
      iconBgColor: AppColors.sWarningIconBgColor,
      title: AppStrings.sErrProcessingReqTitle,
      msg: AppStrings.sErrProcessingReqMsg,
    );
  }

  static NotificationBody get successfullyAdded {
    return const NotificationBody();
  }

  static NotificationBody get successfullyRemovedProduct {
    return const NotificationBody(
      title: 'Product successfully removed',
      msg:
          'Product name with quantity was successfully removed from warehouse 5',
    );
  }

  static void showErrorOccurredNotification(
      {VoidCallback? onTap, int duration = 5}) async {
    switch (await Utils.checkConnectivity()) {
      case InternetConnectionStatus.connected:
        InAppNotification.show(
          child: NotificationUtils.couldNotProcessRequest,
          context: ContextHolder.currentContext,
          onTap: onTap,
          duration: Duration(seconds: duration),
        );
        break;
      case InternetConnectionStatus.disconnected:
        Dialogs.showNoInternetSnackbar();
        break;
    }
  }
}
