import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_savvy/features/home/view/dashboard/controller/dashboard_state.dart';
import 'package:stock_savvy/features/home/view/dashboard/model/warehouse.dart';
import 'package:stock_savvy/features/home/view/dashboard/model/warehouse_model.dart';

import '../../../../../network/models/warehouse_json_response.dart';
import '../../../../../shared/resources/app_strings.dart';
import '../../../../../utils/dialogs.dart';
import '../../../../auth/models/user_auth_model.dart';
import '../../../../shared/utils/utils.dart';
import '../network/dashboard_repo.dart';

class DashboardLogic extends GetxController {
  final state = DashboardState();
  final DashboardRepo _dashboardRepo = DashboardRepo();

  /// this function returns the appropriate greeting based
  /// on ths time
  getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      state.greeting.value = AppStrings.sGoodMorning;
    } else if (hour < 17) {
      state.greeting.value = AppStrings.sGoodAfternoon;
    } else {
      state.greeting.value = AppStrings.sGoodEvening;
    }
  }

  /// this function sets the current selected warehouse
  /// index
  getCurrentIndex(int index) {
    state.warehouseSelectedIndex = index;
  }

  fetchWarehouses() async {
    String adminId = state.userInfo.adminId!;
    var payload = UserInfo(adminId: adminId).toJson();
    List<Warehouse> warehouses;

    var res = await _dashboardRepo.fetchWarehouses(payload);

    if (res.runtimeType == List<Warehouse>) {
      warehouses = res as List<Warehouse>;

      state.warehouses = warehouses;
    } else {
      Dialogs.showToast(msg: 'An error occurred');
    }
  }

  updateWarehouseNameString(String warehouseName) {
    state.warehouseName = warehouseName;
  }

  updateWarehouseLocationString(String warehouseLocation) {
    state.warehouseLocation = warehouseLocation;
  }

  /// function to create a new warehouse
  createWarehouse() async {
    var payload = Warehouse(
      name: state.warehouseName,
      location: state.warehouseLocation,
      adminId: state.userInfo.adminId,
    ).toJson();

    if (state.createWarehouseKey.currentState!.validate()) {
      switch (await Utils.checkConnectivity()) {
        case InternetConnectionStatus.connected:
          var response = await _dashboardRepo.createWarehouse(payload);
          _checkRuntimeType(response);
          break;
        case InternetConnectionStatus.disconnected:
          Dialogs.showNoInternetSnackbar();
          break;
      }
    }
  }

  /// [_checkRuntimeType] checks the current runtime type
  /// of the response object returned by the api call
  /// and return appropriate response to the user
  void _checkRuntimeType(Object response) {
    switch (response.runtimeType) {
      case WarehouseModel:
        fetchWarehouses();
        break;
      case WarehouseResponse:
        Dialogs.showToast(msg: AppStrings.sWarehouseCreationErr);
    }
  }

  /// this function gets the userInfo object homeState
  /// to dashboardState
  setUserInfo(UserInfo userInfo) {
    state.userInfo = userInfo;
  }

  @override
  void onReady() {
    Get.showOverlay(asyncFunction: () async {
      fetchWarehouses();
    });
    super.onReady();
  }

  @override
  void onInit() {
    getGreeting();
    super.onInit();
  }
}
