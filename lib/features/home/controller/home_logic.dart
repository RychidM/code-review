import 'package:get/get.dart';
import 'package:stock_savvy/features/auth/models/admin_auth_model.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';

class HomeLogic extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxBool isOpen = false.obs;

  final _user = UserInfo().obs;
  UserInfo get user => _user.value;
  set user(UserInfo value) => _user.value = value;

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  openCloseSideMenu() {
    isOpen.value = !isOpen.value;
  }

  @override
  void onInit() {
    // TODO: handle this properly when API is working
    // admin.adminId != null ? admin = Get.arguments : 
    user = Get.arguments;
    
    super.onInit();
  }
}
