import 'package:get/get.dart';
import 'package:quick_shop_admin/features/orders/models/order_model.dart';
import 'package:quick_shop_admin/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController{
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  static final List<OrderModel> orders = [];

  @override
  void onInit() {
    super.onInit();
    _calculateWeeklySales();
  }

  // Calculate weekly sales
  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders){
      final DateTime ordersWeekStart = CustomHelperFunctions.getStartofWeek(order.orderDate);

      if (ordersWeekStart.isBefore(DateTime.now()) && ordersWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())){
        final int index = (order.orderDate.weekday - 1) % 7;
        weeklySales[index] += order.totalAmount;
      }

    }
  }
}