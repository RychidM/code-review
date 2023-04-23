import 'package:flutter/material.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';

import '../../../shared/resources/app_strings.dart';
import '../../../shared/resources/app_text.dart';
import '../view/dashboard/view/dashboard_view.dart';
import '../view/inventory/inventory_view.dart';

class HomeUtils {
  static getCurrentView(int index, UserInfo user) {
    Map<int, Widget> views = {
      0: DashboardView(user),
      1: const InventoryPage(),
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
