import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stock_savvy/features/home/data/home_data.dart';
import 'package:stock_savvy/features/home/view/dashboard/controller/dashboard_binding.dart';
import 'package:stock_savvy/features/home/view/dashboard/controller/dashboard_logic.dart';
import 'package:stock_savvy/features/home/view/dashboard/data/dashboard_data.dart';
import 'package:stock_savvy/features/home/view/inventory/data/inventory_data.dart';
import 'package:stock_savvy/shared/resources/app_colors.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/shared/resources/app_text.dart';
import 'package:stock_savvy/shared/widgets/custom_elevated_btn.dart';
import 'package:stock_savvy/shared/widgets/custom_text_field.dart';
import 'package:stock_savvy/utils/dimensions.dart';
import 'package:stock_savvy/utils/form_validator.dart';

import '../../../../generated/assets.dart';
import '../../../../shared/resources/app_strings.dart';
import '../../../../shared/resources/app_theme.dart';
import '../../../../shared/widgets/table_actions_widget.dart';
import '../../../../shared/widgets/table_title_widget.dart';
import 'controller/inventory_binding.dart';
import 'controller/inventory_logic.dart';

class InventoryPage extends GetView<InventoryLogic> {
  const InventoryPage({super.key});

  get _dialogHeader => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.sBorderRadius7),
                child: Image.asset(
                  Assets.iconsStocksIcon,
                  height: Dimensions.getDynamicHeight(AppDimens.sPadding60),
                  width: Dimensions.getDynamicWidth(AppDimens.sPadding60),
                  filterQuality: FilterQuality.high,
                ),
              ),
              Gap(Dimensions.getDynamicWidth(10)),
              const AppText(
                text: 'Add a new Product',
                size: AppDimens.sFontSize27,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Container(
            height: Dimensions.getDynamicHeight(AppDimens.sPadding45),
            width: Dimensions.getDynamicWidth(AppDimens.sPadding45),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.aPrimaryColor),
          ),
        ],
      );

  Form get _addProductForm {
    DashboardBinding binding = DashboardBinding();
    binding.dependencies();
    var dashLogic = Get.find<DashboardLogic>();
    return Form(
      key: _addNewProductFormKey,
      child: Column(children: [
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            controller: _itemNameController,
            decoration: InputDecoration(
                labelText: 'Item Name *',
                floatingLabelStyle: AppTheme.tableCaptionStyle
                    .copyWith(fontSize: AppDimens.sPadding25),
                labelStyle: AppTheme.tableCaptionStyle
                    .copyWith(fontSize: AppDimens.sPadding20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimens.sPadding12)),
                suffixIcon: SizedBox(
                  height: Dimensions.getDynamicHeight(11),
                  child: Image.asset(
                    Assets.iconsStocksIcon,
                    scale: 7,
                  ),
                )),
          ),
        ),
        Gap(Dimensions.getDynamicHeight(AppDimens.sPadding30)),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                    labelText: 'Quantity *',
                    floatingLabelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding25),
                    labelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding20),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.sPadding12))),
              ),
            ),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding30)),
            Expanded(
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                    labelText: 'Price *',
                    floatingLabelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding25),
                    labelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding20),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.sPadding12))),
              ),
            ),
          ],
        ),
        Gap(Dimensions.getDynamicWidth(AppDimens.sPadding30)),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                items: categoryList
                    .map((category) => DropdownMenuItem(
                          value: category.name,
                          child: AppText(
                            text: category.name.toString(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {},
                borderRadius: BorderRadius.circular(
                    Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
                validator: FormValidator.requiredValidator,
                decoration: InputDecoration(
                    labelText: 'Category *',
                    floatingLabelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding25),
                    labelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding20),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.sPadding12))),
              ),
            ),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding20)),
            Expanded(
              child: DropdownButtonFormField(
                items: dashLogic.state.warehouses
                    .map((warehouse) => DropdownMenuItem(
                          value: warehouse,
                          child: AppText(
                            text: warehouse.name.toString(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {},
                // validator: FormValidator.requiredValidator,
                borderRadius: BorderRadius.circular(
                    Dimensions.getDynamicHeight(AppDimens.sBorderRadius8)),
                decoration: InputDecoration(
                    labelText: 'Warehouse *',
                    floatingLabelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding25),
                    labelStyle: AppTheme.tableCaptionStyle
                        .copyWith(fontSize: AppDimens.sPadding20),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.sPadding12))),
              ),
            ),
          ],
        ),
        Gap(Dimensions.getDynamicHeight(AppDimens.sPadding55)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomElevatedButton(
                btnWidth: AppDimens.sPadding120,
                borderRadius: AppDimens.sPadding50,
                btnColor: Colors.transparent,
                side: const BorderSide(color: AppColors.aPrimaryColor),
                label: 'Cancel',
                labelColor: AppColors.aPrimaryColor,
                onTap: () => Get.back()),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
            CustomElevatedButton(
                borderRadius: AppDimens.sPadding50, label: 'Add', onTap: () {}),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    InventoryBinding inventoryBinding = InventoryBinding();
    inventoryBinding.dependencies();

    int newItemCount = (availableStock.length / 10).ceil();
    return Container(
      padding:
          EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding15)),
      height: double.infinity,
      width: double.maxFinite,
      color: AppColors.aAppBgColor,
      child: Column(
        children: [
          _header(context),
          Gap(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
          _stockTable(),
          Gap(Dimensions.getDynamicHeight(AppDimens.sPadding10)),
          _pagination(newItemCount),
          Gap(Dimensions.getDynamicHeight(AppDimens.sPadding15)),
          _pageProgressIndicator(),
          Gap(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
          _footer()
        ],
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Dimensions.getDynamicWidth(AppDimens.sPadding350),
          child: CustomTextField(
            onChange: (value) {},
            hintText: 'Search',
            contentPaddingVertical: 15,
            contentPaddingHorizontal: 15,
            borderRadius: AppDimens.sBorderRadius7,
            isFilled: false,
            style: GoogleFonts.notoSans(
                fontSize: Dimensions.getDynamicHeight(AppDimens.sPadding15),
                color: Colors.black87),
            inputBorder: const OutlineInputBorder(borderSide: BorderSide()),
          ),
        ),
        CustomElevatedButton(
          btnWidth: AppDimens.sPadding133,
          onTap: () => showDialog(
              context: context,
              builder: (_) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        Dimensions.getDynamicHeight(AppDimens.sPadding20)),
                  ),
                  child: Container(
                    width: Dimensions.getDynamicWidth(AppDimens.sPadding600),
                    padding: EdgeInsets.all(
                        Dimensions.getDynamicHeight(AppDimens.sPadding30)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _dialogHeader,
                        const Divider(),
                        Gap(Dimensions.getDynamicHeight(AppDimens.sPadding30)),
                        _addProductForm
                      ],
                    ),
                  ),
                );
              }),
          label: 'New Product',
          labelTextSize: AppDimens.sPadding12,
          borderRadius: AppDimens.sBorderRadius4,
        ),
      ],
    );
  }

  Row _pagination(int newItemCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppText(
          text: 'showing 1 of 9 entries',
          size: AppDimens.sPadding15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RotatedBox(
                quarterTurns: -2,
                child: Image.asset(
                  Assets.iconsArrowForward,
                  color: AppColors.aOrangeColor,
                  height: Dimensions.getDynamicHeight(7.5),
                )),
            Gap(Dimensions.getDynamicWidth(AppDimens.sPadding10)),
            ...List.generate(
              newItemCount,
              (index) => Container(
                height: Dimensions.getDynamicHeight(AppDimens.sPadding25),
                width: Dimensions.getDynamicWidth(AppDimens.sPadding25),
                margin: EdgeInsets.only(
                    right: Dimensions.getDynamicWidth(AppDimens.sPadding10)),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.aOrangeColor,
                ),
                child: Center(
                  child: AppText(
                    text: '${index + 1}',
                    size: AppDimens.sPadding11,
                    color: AppColors.sAppWhiteColor,
                  ),
                ),
              ),
            ),
            Image.asset(
              Assets.iconsArrowForward,
              color: AppColors.aOrangeColor,
              height: Dimensions.getDynamicHeight(7.5),
            )
          ],
        )
      ],
    );
  }

  SimpleShadow _stockTable() {
    return SimpleShadow(
      offset: const Offset(0, 5),
      color: Colors.grey,
      sigma: 10,
      opacity: 0.3,
      child: Container(
        width: double.maxFinite,
        height: Dimensions.getDynamicHeight(648),
        padding:
            EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
        decoration: BoxDecoration(
          color: AppColors.sAppWhiteColor,
          borderRadius: BorderRadius.circular(AppDimens.sBorderRadius8),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            const TableTitleWidget(),
            Gap(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
            Scrollbar(
              child: SizedBox(
                width: double.maxFinite,
                child: DataTable(
                    columnSpacing:
                        Dimensions.getDynamicWidth(AppDimens.sPadding100),
                    dataRowHeight: Dimensions.getDynamicHeight(70),
                    columns: [
                      DataColumn(
                          label: SizedBox(
                        width:
                            Dimensions.getDynamicWidth(AppDimens.sPadding120),
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
                            text: stock.productCategory,
                            textStyle: AppTheme.tableCaptionStyle,
                          )),
                          DataCell(AppText(
                            text: stock.productPrice.toString(),
                            textStyle: AppTheme.tableCaptionStyle,
                          )),
                          DataCell(AppText(
                            text: stock.qty.toString(),
                            textStyle: AppTheme.tableCaptionStyle,
                          )),
                          DataCell(AppText(
                            text: stock.qty.toString(),
                            textStyle: AppTheme.tableCaptionStyle,
                          )),
                          const DataCell(TableActions()),
                        ],
                      );
                    }).toList()),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  ClipRRect _pageProgressIndicator() {
    int currentIndex = 1;
    double value = currentIndex / (availableStock.length / 10);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: value,
        minHeight: Dimensions.getDynamicHeight(AppDimens.sPadding5),
        backgroundColor: AppColors.aBorderDividerColor,
      ),
    );
  }

  Container _footer() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.getDynamicWidth(AppDimens.sPadding18),
          vertical: Dimensions.getDynamicHeight(AppDimens.sPadding18)),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.aBorderDividerColor),
          borderRadius: BorderRadius.circular(
              Dimensions.getDynamicHeight(AppDimens.sBorderRadius8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: 'Privacy Policy Terms of Use',
            textStyle: AppTheme.tableCaptionStyle,
          ),
          RichText(
            text: TextSpan(
                text: '${DateTime.now().year} ©',
                style: AppTheme.tableCaptionStyle,
                children: [
                  TextSpan(
                      text: ' StockSavvy',
                      style: GoogleFonts.notoSans(
                          color: AppColors.aOrangeColor,
                          fontSize: Dimensions.getDynamicHeight(
                              AppDimens.sPadding15)))
                ]),
          )
        ],
      ),
    );
  }
}

final _addNewProductFormKey = GlobalKey<FormState>();
final _itemNameController = TextEditingController();
final _quantityController = TextEditingController();
final _priceController = TextEditingController();
