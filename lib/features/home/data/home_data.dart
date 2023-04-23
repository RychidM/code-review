import 'dart:ui';

import 'package:stock_savvy/shared/resources/app_colors.dart';

import '../../../generated/assets.dart';
import '../../../shared/resources/app_strings.dart';
import 'model/warehouse_overview_model.dart';

class SideMenu {
  String title;
  String icon;
  bool? isSelected;

  SideMenu({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}

List<SideMenu> menuItems = [
  SideMenu(
    title: AppStrings.sDashboard,
    icon: Assets.iconsDashboardIcon,
  ),
  SideMenu(
    title: AppStrings.sInventory,
    icon: Assets.iconsInventoryIconNw,
  ),
  SideMenu(
    title: AppStrings.sReport,
    icon: Assets.iconsTransactionIcon,
  ),
  SideMenu(
    title: AppStrings.sProfile,
    icon: Assets.iconsUserRounded,
  ),
];

List<WarehouseOverViewModel> overviewItems = [
  WarehouseOverViewModel(
    title: 'Total Stock',
    img: Assets.iconsStocksIcon,
    cornerImgColor: AppColors.aOrangeColor,
    totalStock: 27865,
    progressValue: 0.9,
  ),
  WarehouseOverViewModel(
      title: 'Total cost',
      hasCurrency: true,
      img: Assets.iconsCostIcon,
      itemValue: 743987.98,
      progressValue: 0.44,
      cornerImgColor: const Color(0xFF00CC39)),
  WarehouseOverViewModel(
      title: 'Items In',
      img: Assets.iconsTruckIcon,
      totalIn: 240,
      progressValue: 0.62,
      cornerImgColor: const Color(0xFF4100CC)),
  WarehouseOverViewModel(
      title: 'Items Out',
      img: Assets.iconsTruckIcon,
      totalOut: 50,
      progressValue: 0.83,
      cornerImgColor: const Color(0xFF4100CC))
];

List warehouses = [
  'Warehouse 1',
  'Warehouse 2',
  'Warehouse 3',
  'Warehouse 4',
];
