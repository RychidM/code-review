import '../../../generated/assets.dart';
import '../models/onboarding_model.dart';

List<OnboardingModel> onBoardingItems = [
  OnboardingModel(
      title: 'Transactions',
      description: 'Get detailed insights of all your transactions',
      imgString: Assets.imagesAfricanWorkerWarehouse,
      isSelected: false,
      iconString: Assets.iconsOnboardTransactionsIcon),
  OnboardingModel(
      title: 'Track Stocks',
      description: 'Track stocks going in and out your warehouses',
      imgString: Assets.imagesManWithTablet,
      isSelected: false,
      iconString: Assets.iconsOnboardTrackingIcon),
  OnboardingModel(
      title: 'Manage Staff',
      description: 'Add a new staff with limited privileges',
      imgString: Assets.imagesManBehindCounter,
      isSelected: false,
      iconString: Assets.iconsOnboardStaffMgtIcon),
  OnboardingModel(
      title: 'Warehouses',
      description: 'Manage all warehouses with ease at one place',
      imgString: Assets.imagesWomanWithTablet,
      isSelected: false,
      iconString: Assets.iconsOnboardWarehouseIcon),
];
