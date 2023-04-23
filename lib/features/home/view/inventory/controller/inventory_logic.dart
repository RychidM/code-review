import 'package:get/get.dart';
import 'package:stock_savvy/features/home/data/model/products_model.dart';
import 'package:stock_savvy/features/home/view/dashboard/controller/dashboard_logic.dart';

class InventoryLogic extends GetxController {
  var dashboard = Get.find<DashboardLogic>();

  @override
  void onInit() {
    dashboard.fetchWarehouses();
    super.onInit();
  }

  RxInt currentPage = 0.obs;
  RxInt itemsPerPage = 5.obs;
  RxList chunks = [].obs;

  Iterable<List<ProductModel>> currentPageStocks(
      List<ProductModel> data, int itemsPerPage) sync* {
    int length = data.length;
    for (var i = 0; i < length; i += itemsPerPage) {
      int size = i + itemsPerPage;
      chunks.value = data.sublist(i, size > length ? length : size);
      yield data.sublist(i, size > length ? length : size);
    }
  }

  // @override
  // void onInit() {
  //   currentPageStocks(availableStock, itemsPerPage.value);
  //   super.onInit();
  // }
}
