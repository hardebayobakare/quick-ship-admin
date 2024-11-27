import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/user/user_repository.dart';
import 'package:quick_shop_admin/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_admin/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    
  }
}