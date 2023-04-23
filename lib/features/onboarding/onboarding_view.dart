import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/features/onboarding/binding.dart';
import 'package:stock_savvy/features/onboarding/data/onboarding_data.dart';
import 'package:stock_savvy/generated/assets.dart';
import 'package:stock_savvy/shared/resources/app_colors.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/shared/resources/app_text.dart';
import 'package:stock_savvy/shared/widgets/custom_elevated_btn.dart';
import 'package:stock_savvy/utils/dimensions.dart';

import '../../shared/widgets/icon_text.dart';
import '../../shared/widgets/onboard_image_card.dart';
import 'logic.dart';

class OnBoardingView extends GetView<OnboardingLogic> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingBinding binding = OnboardingBinding();
    binding.dependencies();
    Dimensions.init(context);
    return Scaffold(
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.getDynamicHeight(40)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _pageIndicator,
                          Gap(Dimensions.getDynamicHeight(
                              AppDimens.sPadding40)),
                          _onBoardDescription,
                          Gap(Dimensions.getDynamicHeight(
                              AppDimens.sPadding45)),
                          _onBoardItems
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Obx(() => CustomElevatedButton(
                              onTap: () => controller.onNextBtnClicked(),
                              label: controller.currentIndex.value == 3
                                  ? 'Continue'
                                  : 'Next',
                              btnWidth: AppDimens.sPadding173,
                              borderRadius: AppDimens.sPadding25,
                              btnColor: AppColors.aPrimaryColor,
                            )),
                      )
                    ],
                  ),
                ),
                Gap(Dimensions.getDynamicWidth(AppDimens.sPadding20)),
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() => ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: OnBoardImagesWidget(
                              imgString: onBoardingItems[index].imgString,
                              isSelected:
                                  controller.currentIndex.value == index,
                            ),
                          ));
                    },
                    itemCount: onBoardingItems.length,
                    onPageChanged: (value) {
                      controller.selectedIndexUpdated(value);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container get _onBoardItems {
    return Container(
      height: Dimensions.getDynamicHeight(AppDimens.sPadding450),
      padding:
          EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.sPadding25),
          color: AppColors.aOnBoardContainerBgColor),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller.scrollController,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
                onTap: () => controller.animateToIndex(index),
                child: Container(
                  padding: EdgeInsets.all(
                      Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  width: Dimensions.getDynamicWidth(AppDimens.sPadding215),
                  margin: EdgeInsets.only(
                      right: Dimensions.getDynamicWidth(AppDimens.sPadding20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.sPadding20),
                      color: controller.currentIndex.value == index
                          ? AppColors.aOnBoardContainerColor
                          : Colors.transparent),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: controller.currentIndex.value == index,
                        child: Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            height: Dimensions.getDynamicHeight(
                                AppDimens.sPadding25),
                            width: Dimensions.getDynamicWidth(
                                AppDimens.sPadding25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimens.sBorderRadius7),
                                color: AppColors.aPrimaryColor),
                            child: const Icon(
                              Icons.check,
                              color: AppColors.aOnBoardContainerColor,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding70),
                              child: Image.asset(
                                onBoardingItems[index].iconString,
                                color: controller.currentIndex.value == index
                                    ? AppColors.sAppWhiteColor
                                    : AppColors.aPrimaryColor,
                              ),
                            ),
                            Gap(Dimensions.getDynamicHeight(
                                AppDimens.sPadding10)),
                            AppText(
                              text: onBoardingItems[index].title,
                              size: AppDimens.sPadding20,
                              color: controller.currentIndex.value == index
                                  ? AppColors.sAppWhiteColor
                                  : Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
        itemCount: onBoardingItems.length,
      ),
    );
  }

  SizedBox get _onBoardDescription {
    return SizedBox(
      width: Dimensions.getDynamicWidth(AppDimens.sPadding600),
      child: Obx(() => AppText(
            text: onBoardingItems[controller.currentIndex.value].description,
            size: AppDimens.sPadding55,
            fontWeight: FontWeight.w500,
          )),
    );
  }

  Widget get _pageIndicator {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(
              prefix: SizedBox(
                  height: Dimensions.getDynamicHeight(35),
                  child: Image.asset(Assets.imagesAppLogo)),
              textString: 'StockSavvy',
            ),
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding15)),
            SizedBox(
              height: Dimensions.getDynamicHeight(8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding5),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.sBorderRadius7),
                      color: AppColors.aOrangeColor,
                    ),
                  ),
                  Gap(Dimensions.getDynamicWidth(5)),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding5),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.sBorderRadius7),
                      color: controller.currentIndex.value >= 1
                          ? AppColors.aPrimaryColor
                          : AppColors.aDisabledColor,
                    ),
                  ),
                  Gap(Dimensions.getDynamicWidth(5)),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding5),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.sBorderRadius7),
                      color: controller.currentIndex.value >= 2
                          ? AppColors.aOrangeColor
                          : AppColors.aDisabledColor,
                    ),
                  ),
                  Gap(Dimensions.getDynamicWidth(5)),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding5),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.sBorderRadius7),
                      color: controller.currentIndex.value >= 3
                          ? AppColors.aPrimaryColor
                          : AppColors.aDisabledColor,
                    ),
                  ),
                ],
              ),
            ),
            Gap(Dimensions.getDynamicHeight(7)),
            AppText(
              text: '${controller.currentIndex.value + 1} of 4',
              color: AppColors.aTabColor,
              size: AppDimens.sPadding15,
            )
          ],
        ));
  }
}
