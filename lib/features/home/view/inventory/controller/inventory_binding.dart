import 'package:get/get.dart';

import 'inventory_logic.dart';

class InventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventoryLogic());
  }
}
