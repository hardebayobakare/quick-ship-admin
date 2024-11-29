import 'package:get/get.dart';
import 'package:quick_shop_admin/features/orders/models/order_model.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController{
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: 'ORD0012',
      status: OrderStatus.processing,
      totalAmount: 250.0,
      orderDate: DateTime(2024, 11, 25),
      deliveryDate: DateTime(2024, 11, 29),
    ),
    OrderModel(
      id: 'ORD0013',
      status: OrderStatus.shipped,
      totalAmount: 150.0,
      orderDate: DateTime(2024, 11, 26),
      deliveryDate: DateTime(2024, 11, 30),
    ),
    OrderModel(
      id: 'ORD0014',
      status: OrderStatus.delivered,
      totalAmount: 350.0,
      orderDate: DateTime(2024, 11, 27),
      deliveryDate: DateTime(2024, 12, 1),
    ),
    OrderModel(
      id: 'ORD0015',
      status: OrderStatus.processing,
      totalAmount: 450.0,
      orderDate: DateTime(2024, 11, 28),
      deliveryDate: DateTime(2024, 12, 2),
    ),
    OrderModel(
      id: 'ORD0016',
      status: OrderStatus.shipped,
      totalAmount: 550.0,
      orderDate: DateTime(2024, 11, 29),
      deliveryDate: DateTime(2024, 12, 3),
    ),
    OrderModel(
      id: 'ORD0017',
      status: OrderStatus.delivered,
      totalAmount: 650.0,
      orderDate: DateTime(2024, 11, 30),
      deliveryDate: DateTime(2024, 12, 4),
    ),
    OrderModel(
      id: 'ORD0018',
      status: OrderStatus.processing,
      totalAmount: 750.0,
      orderDate: DateTime(2024, 11, 31),
      deliveryDate: DateTime(2024, 12, 4),
    ),
    OrderModel(
      id: 'ORD0019',
      status: OrderStatus.shipped,
      totalAmount: 80.0,
      orderDate: DateTime(2024, 11, 26),
      deliveryDate: DateTime(2024, 12, 4),
    ),
  ];


  @override
  void onInit() {
    super.onInit();
    _calculateWeeklySales();
    _calculateOrderStatus();
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
  
  void _calculateOrderStatus() {
    orderStatusData.clear();
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orders){
      orderStatusData[order.status] = (orderStatusData[order.status] ?? 0) + 1;
      totalAmounts[order.status] = (totalAmounts[order.status] ?? 0) + order.totalAmount;
    }

    
  }


}