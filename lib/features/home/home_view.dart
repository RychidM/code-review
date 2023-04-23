import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/features/home/utils/home_utils.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';

import '../../generated/assets.dart';
import '../../shared/resources/app_colors.dart';
import '../../shared/resources/app_strings.dart';
import '../../shared/resources/app_text.dart';
import '../../utils/dimensions.dart';
import 'controller/home_binding.dart';
import 'controller/home_logic.dart';
import 'data/home_data.dart';

class HomeView extends GetView<HomeLogic> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    HomeBinding homeBinding = HomeBinding();
    homeBinding.dependencies();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(body: _body),
    );
  }

  Column get _body {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              /*--------- Side menu ---------*/
              _sideMenu,
              _verticalDivider,
              /*-------- Contents ---------*/
              _mainViews
            ],
          ),
        ),
      ],
    );
  }

  Expanded get _mainViews {
    return Expanded(
      child: Scaffold(
        appBar: _appBar,
        body: Obx(() {
          return HomeUtils.getCurrentView(
              controller.selectedIndex.value, controller.user);
        }),
      ),
    );
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      leadingWidth: Dimensions.getDynamicWidth(AppDimens.sPadding350),
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: Dimensions.getDynamicHeight(AppDimens.sPadding45),
      leading: Row(
        children: [
          Gap(Dimensions.getDynamicWidth(AppDimens.sPadding25)),
          Opacity(
            opacity: .5,
            child: Image.asset(Assets.iconsMenuIcon,
                height: Dimensions.getDynamicHeight(AppDimens.sPadding15)),
          ),
          Gap(Dimensions.getDynamicWidth(AppDimens.sBorderRadius8)),
          AppText(
            text: AppStrings.sAppName,
            size: Dimensions.getDynamicHeight(AppDimens.sPadding15),
            color: AppColors.aDisableTextColor,
          ),
          Gap(Dimensions.getDynamicWidth(AppDimens.sPadding5)),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: Dimensions.getDynamicHeight(AppDimens.sPadding18),
            color: AppColors.aDisableTextColor,
          ),
          Obx(() {
            return AppText(
              text: menuItems[controller.selectedIndex.value].title,
              size: Dimensions.getDynamicHeight(AppDimens.sPadding15),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            );
          }),
        ],
      ),
      actions: [
        // TODO: work on settings icon
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            Assets.iconsSettingsIcon,
            height: Dimensions.getDynamicHeight(AppDimens.sPadding30),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            Assets.iconsUserIconNew,
            height: Dimensions.getDynamicHeight(AppDimens.sPadding55),
          ),
        ),
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding20)),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.getDynamicHeight(1)),
        child: _horizontalDivider,
      ),
    );
  }

  Container get _horizontalDivider {
    return Container(
      width: double.maxFinite,
      height: Dimensions.getDynamicHeight(1),
      color: AppColors.aBorderDividerColor,
    );
  }

  Container get _verticalDivider {
    return Container(
      width: Dimensions.getDynamicHeight(1),
      height: double.maxFinite,
      color: AppColors.aBorderDividerColor,
    );
  }

  Obx get _sideMenu {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: AppDimens.sDuration150),
        height: double.infinity,
        width: !controller.isOpen.value
            ? Dimensions.getDynamicWidth(AppDimens.sPadding240)
            : Dimensions.getDynamicWidth(AppDimens.sPadding100),
        color: AppColors.sAppWhiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getDynamicWidth(AppDimens.sPadding20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => controller.openCloseSideMenu(),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: AppDimens.sDuration150),
                      height: !controller.isOpen.value
                          ? Dimensions.getDynamicHeight(AppDimens.sPadding70)
                          : Dimensions.getDynamicHeight(AppDimens.sPadding50),
                      child: Image.asset(
                        Assets.iconsStockAppLogo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
            ListView.builder(
                itemCount: menuItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom:
                            Dimensions.getDynamicHeight(AppDimens.sPadding20)),
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding80),
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        /*--------- select indicator ---------*/
                        Obx(() {
                          return Positioned(
                            left: 0,
                            child: InkWell(
                              onTap: () =>
                                  controller.updateSelectedIndex(index),
                              child: Container(
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding60),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding240),
                                color: controller.selectedIndex.value == index
                                    ? AppColors.aMenuIndicatorColor
                                    : Colors.transparent,
                                child: Row(
                                  children: [
                                    AnimatedOpacity(
                                      opacity: controller.selectedIndex.value ==
                                              index
                                          ? 1
                                          : 0,
                                      duration: Duration(
                                          milliseconds: AppDimens.sDuration50),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.getDynamicWidth(
                                                AppDimens.sPadding10)),
                                        child: Container(
                                          height: Dimensions.getDynamicHeight(
                                              AppDimens.sPadding10),
                                          width: Dimensions.getDynamicWidth(
                                              AppDimens.sPadding10),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.aOrangeColor),
                                        ),
                                      ),
                                    ),
                                    Gap(Dimensions.getDynamicWidth(
                                        AppDimens.sPadding20)),
                                    AnimatedOpacity(
                                      duration: Duration(
                                          milliseconds: AppDimens.sDuration50),
                                      opacity: controller.selectedIndex.value ==
                                              index
                                          ? 1
                                          : .3,
                                      child: Image.asset(
                                        menuItems[index].icon,
                                        height: AppDimens.sPadding30,
                                        width: AppDimens.sPadding30,
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? AppColors.aPrimaryColor
                                            : null,
                                      ),
                                    ),
                                    Gap(Dimensions.getDynamicWidth(
                                        AppDimens.sPadding17)),
                                    Obx(() {
                                      return AnimatedOpacity(
                                        opacity:
                                            !controller.isOpen.value ? 1 : 0,
                                        duration: Duration(
                                            milliseconds:
                                                AppDimens.sDuration50),
                                        child: AppText(
                                          text: menuItems[index].title,
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? AppColors.aPrimaryColor
                                                  : AppColors.aDisableTextColor,
                                          fontWeight: FontWeight.w400,
                                          size: Dimensions.getDynamicHeight(
                                              AppDimens.sFontSize14),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }),
          ],
        ),
      );
    });
  }
}
