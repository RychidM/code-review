import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';

import '../model/warehouse.dart';

class DashboardState {
  /// [greeting] variable holds the current greeting value
  RxString greeting = ''.obs;

  /// [_warehouseSelectedIndex] variable holds the current selected warehouse index
  final RxInt _warehouseSelectedIndex = 0.obs;
  int get warehouseSelectedIndex => _warehouseSelectedIndex.value;
  set warehouseSelectedIndex(int value) =>
      _warehouseSelectedIndex.value = value;

  /// [_warehouses] holds a list of warehouses available
  /// created getters and setters for this variable
  final RxList<Warehouse> _warehouses = <Warehouse>[].obs;
  List<Warehouse> get warehouses => _warehouses;
  set warehouses(List<Warehouse> value) => _warehouses.assignAll(value);

  /// [_userInfo] variable holds the current user's information
  /// with setter and getter
  final Rx<UserInfo> _userInfo = UserInfo().obs;
  UserInfo get userInfo => _userInfo.value;
  set userInfo(UserInfo value) => _userInfo.value = value;

  /// warehouse information
  final _warehouseName = ''.obs;
  String get warehouseName => _warehouseName.value;
  set warehouseName(String value) => _warehouseName.value = value;

  final _warehouseLocation = ''.obs;
  String get warehouseLocation => _warehouseLocation.value;
  set warehouseLocation(String value) => _warehouseLocation.value = value;

  /// [_createWarehouseKey] holds the form key for create
  /// warehouse form
  final _createWarehouseKey = GlobalKey<FormState>();
  GlobalKey<FormState> get createWarehouseKey => _createWarehouseKey;

  /// [_warehouseNameController] holds the text editing controller
  /// for the warehouse form textfield
  /// create getters and setters for the variable
  final _warehouseNameController = TextEditingController().obs;
  TextEditingController get warehouseNameController =>
      _warehouseNameController.value;
  set warehouseNameController(TextEditingController value) =>
      _warehouseNameController.value = value;

  /// [_warehouseLocationController] holds the text editing controller 
  /// for the warehouse form textfield
  /// create getters and setters for the variable
  final _warehouseLocationController = TextEditingController().obs;
  TextEditingController get warehouseLocationController =>
      _warehouseLocationController.value;
  set warehouseLocationController(TextEditingController value) =>
      _warehouseLocationController.value = value;
}
