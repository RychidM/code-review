import 'package:stock_savvy/features/home/view/dashboard/model/warehouse.dart';
import 'package:stock_savvy/network/get_api_service.dart';
import 'package:stock_savvy/utils/logger.dart';

import '../../../../../network/api_constants.dart';
import '../../../../../network/models/warehouse_json_response.dart';
import '../../../../auth/utils/auth_utils.dart';
import '../model/warehouse_model.dart';

class DashboardRepo {
  var log = getLogger('DashboardRepo');

  final ApiService _apiService = ApiService();

  late String respCode;

  Future<Object> fetchWarehouses(Map<String, dynamic> payload) async {
    try {
      final request =
          await _apiService.getReq(SApiConstants.sWarehouse, payload: payload);
      respCode = request.body['resp_code'];
      List<Warehouse> warehouse;

      if (respCode == AuthUtils.respCodes[RespCodes.success]) {
        warehouse = List<Warehouse>.from(request.body["data"]!.map((x) => Warehouse.fromJson(x)));
        return warehouse;
      } else {
        return WarehouseResponse.fromJson(request.body);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<Object> createWarehouse(Map<String, dynamic> payload) async {
    try {
      final request =
          await _apiService.postReq(SApiConstants.sWarehouse, payload: payload);
      respCode = request.body['resp_code'];
      WarehouseModel response;

      if (respCode == AuthUtils.respCodes[RespCodes.success]) {
        response = warehouseModelFromJson(request.body);
        return response;
      }
      else {
        return WarehouseResponse.fromJson(request.body);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
