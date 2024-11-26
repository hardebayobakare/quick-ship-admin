import 'package:get/get.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class SidebarController extends GetxController{
  static SidebarController get instance => Get.find();

  final activeItem = CustomRoutes.dashboard.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHover(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if (isActive(route)) return;
    changeActiveItem(route);

    if(DeviceUtils.isMobileScreen(Get.context!)) Get.back();

    Get.toNamed(route);
  }
  
}