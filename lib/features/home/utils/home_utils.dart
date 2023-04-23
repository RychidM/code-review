import 'package:flutter/material.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';

import '../../../shared/resources/app_strings.dart';
import '../../../shared/resources/app_text.dart';
class HomeUtils {
  static getCurrentView(int index, UserInfo user) {
    Map<int, Widget> views = {
      0: const Center(
        child: AppText(
          text: AppStrings.sDashboard,
        ),
      ),
      1: const Center(
        child: AppText(
          text: AppStrings.sInventory,
        ),
      ),
      2: const Center(
        child: AppText(
          text: AppStrings.sReport,
        ),
      ),
      3: const Center(
          child: AppText(
        text: AppStrings.sProfile,
      )),
    };

    return views[index];
  }
}
