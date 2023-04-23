import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';
import 'package:stock_savvy/shared/resources/app_theme.dart';
import 'package:stock_savvy/utils/dialogs.dart';

import '../../../../../generated/assets.dart';
import '../../../../../shared/resources/app_colors.dart';
import '../../../../../shared/resources/app_dimens.dart';
import '../../../../../shared/resources/app_strings.dart';
import '../../../../../shared/resources/app_text.dart';
import '../../../../../shared/widgets/custom_elevated_btn.dart';
import '../../../../../shared/widgets/table_actions_widget.dart';
import '../../../../../shared/widgets/table_title_widget.dart';
import '../../../../../utils/dimensions.dart';
import '../../../controller/home_binding.dart';
import '../../../controller/home_logic.dart';
import '../../../data/home_data.dart';
import '../controller/dashboard_binding.dart';
import '../controller/dashboard_logic.dart';
import '../data/dashboard_data.dart';
import '../model/warehouse.dart';

class DashboardView extends GetView<DashboardLogic> {
  final UserInfo user;

  const DashboardView(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardBinding binding = DashboardBinding();
    // HomeBinding homeBinding = HomeBinding();
    binding.dependencies();
    // homeBinding.dependencies();
    controller.setUserInfo(user);
    Dimensions.init(context);
    return _body;
  }

  Container get _body {
    return Container(
      padding:
          EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding15)),
      height: double.infinity,
      width: double.maxFinite,
      color: AppColors.aAppBgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _upperBody,
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding12)),
            _midBody,
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding12)),
            lowerBody,
          ],
        ),
      ),
    );
  }

  Row get lowerBody {
    return Row(
      children: [
        _chartOverview,
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding11)),
        _warehouseManagerContainer,
      ],
    );
  }

  SimpleShadow get _warehouseManagerContainer {
    bool hasManager = true;
    return SimpleShadow(
      offset: const Offset(0, 5),
      color: Colors.grey,
      opacity: .12,
      sigma: 6,
      child: Container(
        height: Dimensions.getDynamicHeight(AppDimens.sPadding305),
        width: Dimensions.getDynamicWidth(AppDimens.sPadding461),
        padding:
            EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.getDynamicHeight(AppDimens.sPadding10),
              left: Dimensions.getDynamicWidth(AppDimens.sPadding10),
              right: Dimensions.getDynamicWidth(AppDimens.sPadding10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: AppStrings.sManagerDetails,
                    fontWeight: FontWeight.w600,
                  ),
                  Image.asset(
                    Assets.iconsThreeDotsIcon,
                    color: Colors.grey,
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding17),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: hasManager == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.iconsUserIcon,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding133)),
                            Gap(Dimensions.getDynamicWidth(
                                AppDimens.sPadding30)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TODO: handle this once API is ready
                                const AppText(
                                    text: 'Franck Ocean',
                                    size: AppDimens.sFontSize27,
                                    fontWeight: FontWeight.w600),
                                const AppText(
                                  text: 'Warehouse 1 manager',
                                  color: Color(0xFF686868),
                                ),
                                Gap(Dimensions.getDynamicHeight(
                                    AppDimens.sPadding40)),
                                CustomElevatedButton(
                                    onTap: () {},
                                    btnColor: AppColors.aOrangeColor,
                                    btnWidth: Dimensions.getDynamicWidth(
                                        AppDimens.sPadding150),
                                    btnHeight: Dimensions.getDynamicHeight(
                                        AppDimens.sPadding60),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.iconsBriefcaseIcon,
                                          height: Dimensions.getDynamicHeight(
                                              AppDimens.sPadding30),
                                        ),
                                        Gap(Dimensions.getDynamicWidth(
                                            AppDimens.sPadding25)),
                                        const AppText(
                                          text: AppStrings.sActivities,
                                          size: AppDimens.sFontSize17,
                                          color: Colors.white,
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.illustrationsAddManagerIllustration,
                          width:
                              Dimensions.getDynamicWidth(AppDimens.sPadding150),
                          height: Dimensions.getDynamicHeight(
                              AppDimens.sPadding150),
                        ),
                        Gap(Dimensions.getDynamicHeight(AppDimens.sPadding10)),
                        CustomElevatedButton(
                          onTap: () {},
                          btnWidth: AppDimens.sPadding190,
                          child: const AppText(
                            text: '+ ${AppStrings.sNewManager}',
                            color: AppColors.sAppWhiteColor,
                            size: AppDimens.sFontSize17,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded get _chartOverview {
    return Expanded(
      child: SimpleShadow(
        offset: const Offset(0, 5),
        color: Colors.grey,
        opacity: .12,
        sigma: 6,
        child: Container(
          height: Dimensions.getDynamicHeight(AppDimens.sPadding305),
          width: double.maxFinite,
          padding:
              EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
            color: AppColors.sAppWhiteColor,
          ),
          child: Stack(
            children: [
              Positioned(
                  left: Dimensions.getDynamicWidth(AppDimens.sPadding10),
                  right: Dimensions.getDynamicWidth(AppDimens.sPadding10),
                  top: Dimensions.getDynamicHeight(AppDimens.sPadding10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: AppStrings.sOverview,
                        fontWeight: FontWeight.w600,
                      ),
                      Image.asset(
                        Assets.iconsRefreshIcon,
                        height:
                            Dimensions.getDynamicHeight(AppDimens.sPadding22),
                        width: Dimensions.getDynamicWidth(AppDimens.sPadding20),
                      ),
                    ],
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Assets.illustrationsChartImage,
                  height: Dimensions.getDynamicHeight(AppDimens.sPadding305),
                  width: Dimensions.getDynamicWidth(AppDimens.sPadding600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SimpleShadow get _midBody {
    bool isEmpty = false;
    return SimpleShadow(
      offset: const Offset(0, 5),
      color: Colors.grey,
      opacity: .12,
      sigma: 6,
      child: Container(
        height: Dimensions.getDynamicHeight(AppDimens.sPadding345),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
          color: Colors.white,
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                      right: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                      top: Dimensions.getDynamicWidth(AppDimens.sPadding20)),
                  child: const TableTitleWidget(),
                ),
                isEmpty == false
                    ? GetBuilder<HomeLogic>(builder: (logic) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: DataTable(
                            horizontalMargin: 0,
                            columnSpacing: Dimensions.getDynamicWidth(
                                AppDimens.sPadding150),
                            dataRowHeight: Dimensions.getDynamicHeight(
                                AppDimens.sPadding50),
                            columns: [
                              DataColumn(
                                  label: SizedBox(
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding125),
                                child: AppText(
                                  text: AppStrings.sAvailableItems,
                                  textStyle: AppTheme.tableHeaderStyle,
                                ),
                              )),
                              DataColumn(
                                  label: AppText(
                                text: AppStrings.sCategory,
                                textStyle: AppTheme.tableHeaderStyle,
                              )),
                              DataColumn(
                                  numeric: true,
                                  label: AppText(
                                    text: AppStrings.sPrice,
                                    textStyle: AppTheme.tableHeaderStyle,
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: AppText(
                                    text: AppStrings.sQuantity,
                                    textStyle: AppTheme.tableHeaderStyle,
                                  )),
                              DataColumn(
                                  label: AppText(
                                text: AppStrings.sAction,
                                textStyle: AppTheme.tableHeaderStyle,
                              )),
                            ],
                            rows: availableStock.map((stock) {
                              return DataRow(
                                selected: false,
                                onSelectChanged: (selected) {},
                                cells: [
                                  DataCell(AppText(
                                    text: stock.productName,
                                    textStyle: AppTheme.tableCaptionStyle,
                                  )),
                                  DataCell(AppText(
                                    textStyle: AppTheme.tableCaptionStyle,
                                    text: stock.productCategory,
                                  )),
                                  DataCell(AppText(
                                    text: stock.productPrice.toString(),
                                    textStyle: AppTheme.tableCaptionStyle,
                                  )),
                                  DataCell(AppText(
                                    text: stock.qty.toString(),
                                    textStyle: AppTheme.tableCaptionStyle,
                                  )),
                                  const DataCell(TableActions()),
                                ],
                              );
                            }).toList(),
                          ),
                        );
                      })
                    : addItemIllustration,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column get addItemIllustration {
    return Column(
      children: [
        Image.asset(
          Assets.illustrationsAddItemsIllustration,
          height: Dimensions.getDynamicHeight(AppDimens.sPadding200),
        ),
        CustomElevatedButton(
          onTap: () {},
          child: const AppText(
            text: '+ ${AppStrings.sNewItem}',
            color: Colors.white,
            size: AppDimens.sFontSize14,
          ),
        ),
      ],
    );
  }

  Row get _upperBody {
    return Row(
      children: [
        /*-------- Greeting container --------*/
        _greetingsContainer,
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
        /*------- stock details containers ----------*/
        Expanded(
          child: SimpleShadow(
            offset: const Offset(0, 5),
            color: Colors.grey,
            opacity: .12,
            sigma: 6,
            child: Container(
              height: Dimensions.getDynamicHeight(AppDimens.sPadding172),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding173),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding225),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.getDynamicHeight(
                              AppDimens.sBorderRadius8)),
                      color: AppColors.sAppWhiteColor,
                    ),
                    margin: EdgeInsets.only(
                        right:
                            Dimensions.getDynamicWidth(AppDimens.sPadding11)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sPadding5)),
                              child: Image.asset(
                                Assets.iconsCornerImg,
                                color: overviewItems[0].cornerImgColor,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding15),
                              )),
                        ),
                        Positioned(
                          right:
                              Dimensions.getDynamicWidth(AppDimens.sPadding10),
                          top:
                              Dimensions.getDynamicHeight(AppDimens.sPadding10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsRefreshIcon,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding20),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getDynamicWidth(
                                  AppDimens.sPadding17),
                              vertical: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.sBorderRadius7),
                                  child: Image.asset(
                                    overviewItems[0].img,
                                    height: Dimensions.getDynamicHeight(
                                        AppDimens.sPadding40),
                                    width: Dimensions.getDynamicWidth(
                                        AppDimens.sPadding40),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Gap(Dimensions.getDynamicWidth(
                                    AppDimens.sPadding17)),
                                AppText(
                                  text: overviewItems[0].title,
                                  size: AppDimens.sFontSize14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.aSecondaryTextColor,
                                ),
                              ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible:
                                        overviewItems[0].hasCurrency ?? false,
                                    child: const AppText(
                                      text: AppStrings.sGhCediSymbol,
                                    ),
                                  ),
                                  AppText(
                                    text:
                                        overviewItems[0].totalStock.toString(),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.sPadding5),
                                child: LinearProgressIndicator(
                                  value: overviewItems[0].progressValue,
                                  backgroundColor: overviewItems[0]
                                      .cornerImgColor
                                      .withOpacity(.2),
                                  color: overviewItems[0].cornerImgColor,
                                  minHeight: Dimensions.getDynamicHeight(
                                      AppDimens.sPadding5),
                                ),
                              ),
                              Gap(Dimensions.getDynamicHeight(1))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding173),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding225),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.getDynamicHeight(
                              AppDimens.sBorderRadius8)),
                      color: AppColors.sAppWhiteColor,
                    ),
                    margin: EdgeInsets.only(
                        right:
                            Dimensions.getDynamicWidth(AppDimens.sPadding11)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsCornerImg,
                                color: overviewItems[1].cornerImgColor,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding15),
                              )),
                        ),
                        Positioned(
                          right:
                              Dimensions.getDynamicWidth(AppDimens.sPadding10),
                          top:
                              Dimensions.getDynamicHeight(AppDimens.sPadding10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsRefreshIcon,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding20),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getDynamicWidth(
                                  AppDimens.sPadding17),
                              vertical: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.sBorderRadius7),
                                  child: Image.asset(
                                    overviewItems[1].img,
                                    height: Dimensions.getDynamicHeight(40),
                                    width: Dimensions.getDynamicWidth(40),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Gap(Dimensions.getDynamicWidth(
                                    AppDimens.sPadding17)),
                                AppText(
                                  text: overviewItems[1].title,
                                  size: AppDimens.sFontSize14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.aSecondaryTextColor,
                                ),
                              ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible:
                                        overviewItems[1].hasCurrency ?? false,
                                    child: const AppText(
                                      text: AppStrings.sGhCediSymbol,
                                    ),
                                  ),
                                  AppText(
                                    text: overviewItems[1].itemValue.toString(),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.sPadding5),
                                child: LinearProgressIndicator(
                                  value: overviewItems[1].progressValue,
                                  backgroundColor: overviewItems[1]
                                      .cornerImgColor
                                      .withOpacity(.2),
                                  color: overviewItems[1].cornerImgColor,
                                  minHeight: Dimensions.getDynamicHeight(
                                      AppDimens.sPadding5),
                                ),
                              ),
                              Gap(Dimensions.getDynamicHeight(1))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding173),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding225),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.getDynamicHeight(
                              AppDimens.sBorderRadius8)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(
                        right:
                            Dimensions.getDynamicWidth(AppDimens.sPadding11)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsCornerImg,
                                color: overviewItems[2].cornerImgColor,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding15),
                              )),
                        ),
                        Positioned(
                          right:
                              Dimensions.getDynamicWidth(AppDimens.sPadding10),
                          top:
                              Dimensions.getDynamicHeight(AppDimens.sPadding10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                Dimensions.getDynamicHeight(
                                    AppDimens.sBorderRadius7)),
                            child: Image.asset(
                              Assets.iconsRefreshIcon,
                              height: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding22),
                              width: Dimensions.getDynamicWidth(
                                  AppDimens.sPadding20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getDynamicWidth(
                                  AppDimens.sPadding17),
                              vertical: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.sBorderRadius7),
                                    child: Image.asset(
                                      overviewItems[2].img,
                                      height: Dimensions.getDynamicHeight(
                                          AppDimens.sPadding40),
                                      width: Dimensions.getDynamicWidth(
                                          AppDimens.sPadding40),
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                  Gap(Dimensions.getDynamicWidth(17)),
                                  AppText(
                                    text: overviewItems[2].title,
                                    size: AppDimens.sFontSize14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.aSecondaryTextColor,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible:
                                        overviewItems[2].hasCurrency ?? false,
                                    child: const AppText(
                                      text: AppStrings.sGhCediSymbol,
                                    ),
                                  ),
                                  AppText(
                                    text: overviewItems[2].totalIn.toString(),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.sPadding5),
                                child: LinearProgressIndicator(
                                  value: overviewItems[2].progressValue,
                                  backgroundColor: overviewItems[2]
                                      .cornerImgColor
                                      .withOpacity(.2),
                                  color: overviewItems[2].cornerImgColor,
                                  minHeight: Dimensions.getDynamicHeight(
                                      AppDimens.sPadding5),
                                ),
                              ),
                              Gap(Dimensions.getDynamicHeight(1))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding173),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding225),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.getDynamicHeight(
                              AppDimens.sBorderRadius8)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(
                        right:
                            Dimensions.getDynamicWidth(AppDimens.sPadding11)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsCornerImg,
                                color: overviewItems[3].cornerImgColor,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding15),
                              )),
                        ),
                        Positioned(
                          right:
                              Dimensions.getDynamicWidth(AppDimens.sPadding10),
                          top:
                              Dimensions.getDynamicHeight(AppDimens.sPadding10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius7)),
                              child: Image.asset(
                                Assets.iconsRefreshIcon,
                                height: Dimensions.getDynamicHeight(
                                    AppDimens.sPadding22),
                                width: Dimensions.getDynamicWidth(
                                    AppDimens.sPadding20),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getDynamicWidth(
                                  AppDimens.sPadding17),
                              vertical: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.sBorderRadius7),
                                  child: Image.asset(
                                    overviewItems[3].img,
                                    height: Dimensions.getDynamicHeight(
                                        AppDimens.sPadding40),
                                    width: Dimensions.getDynamicWidth(
                                        AppDimens.sPadding40),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Gap(Dimensions.getDynamicWidth(
                                    AppDimens.sPadding17)),
                                AppText(
                                  text: overviewItems[3].title,
                                  size: AppDimens.sFontSize14,
                                  color: AppColors.aSecondaryTextColor,
                                ),
                              ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible:
                                        overviewItems[3].hasCurrency ?? false,
                                    child: const AppText(
                                      text: AppStrings.sGhCediSymbol,
                                    ),
                                  ),
                                  AppText(
                                    text: overviewItems[3].totalOut.toString(),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.sPadding5),
                                child: LinearProgressIndicator(
                                  value: overviewItems[3].progressValue,
                                  backgroundColor: overviewItems[3]
                                      .cornerImgColor
                                      .withOpacity(.2),
                                  color: overviewItems[3].cornerImgColor,
                                  minHeight: Dimensions.getDynamicHeight(
                                      AppDimens.sPadding5),
                                ),
                              ),
                              Gap(Dimensions.getDynamicHeight(1))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  SimpleShadow get _greetingsContainer {
    Dialogs dialogs = Dialogs();
    return SimpleShadow(
      offset: const Offset(0, 5),
      color: Colors.grey,
      opacity: .12,
      sigma: 6,
      child: Container(
        height: Dimensions.getDynamicHeight(AppDimens.sPadding172),
        width: Dimensions.getDynamicWidth(AppDimens.sPadding450),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            /*-------- corner design --------*/
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      Dimensions.getDynamicHeight(AppDimens.sBorderRadius7)),
                  child: Image.asset(
                    Assets.iconsCornerImg,
                    height: Dimensions.getDynamicHeight(AppDimens.sPadding22),
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding15),
                  )),
            ),
            /*---------- greeting ----------*/
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.getDynamicHeight(AppDimens.sPadding15),
                  left: Dimensions.getDynamicWidth(AppDimens.sPadding20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return AppText(
                          text:
                              '${controller.state.greeting}, ${user.firstName ?? ''}',
                          size: AppDimens.sFontSize27,
                          fontWeight: FontWeight.w600,
                        );
                      }),
                      Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.getDynamicHeight(
                                AppDimens.sPadding10),
                            vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.getDynamicHeight(
                                    AppDimens.sPadding18)),
                            color: AppColors.aDarkBlue),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.getDynamicHeight(
                                  AppDimens.sBorderRadius4),
                              width: Dimensions.getDynamicWidth(
                                  AppDimens.sBorderRadius4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.aOrangeColor),
                            ),
                            Gap(Dimensions.getDynamicHeight(
                                AppDimens.sBorderRadius4)),
                            AppText(
                              text: user.role ?? '',
                              size: Dimensions.getDynamicHeight(
                                  AppDimens.sPadding12),
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: Dimensions.getDynamicWidth(AppDimens.sPadding20),
                      top: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                      bottom: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: Dimensions.getDynamicHeight(
                                AppDimens.sPadding60),
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: AppColors.aBorderColor),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.getDynamicHeight(
                                      AppDimens.sBorderRadius8)),
                            ),
                            child: _buildWarehouses,
                          ),
                        ),
                        Gap(Dimensions.getDynamicWidth(
                            AppDimens.sBorderRadius8)),
                        /*-------- add new warehouse button ---------*/
                        CustomElevatedButton(
                          btnWidth: AppDimens.sPadding105,
                          btnHeight: AppDimens.sPadding55,
                          onTap: () => dialogs.showAddWarehouseDialog(),
                          child: const AppText(
                            text: '+ ${AppStrings.sNewWH}',
                            color: AppColors.sAppWhiteColor,
                            size: AppDimens.sFontSize14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx get _buildWarehouses {
    List<Warehouse> warehouses = controller.state.warehouses;
    return Obx(() => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, wareIndex) => InkWell(
            onTap: () => controller.getCurrentIndex(wareIndex),
            child: Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.getDynamicWidth(8)),
                height: Dimensions.getDynamicHeight(AppDimens.sPadding50),
                width: Dimensions.getDynamicWidth(AppDimens.sPadding98),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Dimensions.getDynamicHeight(AppDimens.sBorderRadius7)),
                  color: controller.state.warehouseSelectedIndex == wareIndex
                      ? const Color(0x12407FFB)
                      : Colors.transparent,
                ),
                child: Center(
                    child: AppText(
                  text: controller.state.warehouses[wareIndex].name ?? '',
                  size: Dimensions.getDynamicHeight(AppDimens.sPadding11),
                  color: controller.state.warehouseSelectedIndex == wareIndex
                      ? AppColors.aPrimaryColor
                      : AppColors.aDisableTextColor,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )),
              );
            }),
          ),
          itemCount: warehouses.length <= 3
              ? warehouses.length
              : warehouses.getRange(0, 4).length,
        ));
  }
}
