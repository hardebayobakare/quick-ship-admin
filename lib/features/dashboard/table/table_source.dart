import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/helpers/helper_functions.dart';

class OrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(
      cells: [
        DataCell(
          Text(
            order.id, 
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: CustomColors.primaryColor),
          ),
        ),
        DataCell(Text((order.formattedOrderDate))),
        const DataCell(Text('5 items')),
        DataCell(
          CustomRoundedContainer(
            radius: CustomSizes.cardRadiusSm,
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md, vertical: CustomSizes.xs),
            backgroundColor: CustomHelperFunctions.getStatusColor(order.status).withOpacity(0.1),
            child: Text(
              order.status.name.capitalize.toString(),
              style: TextStyle(color: CustomHelperFunctions.getStatusColor(order.status)),
            ),
          )
        ),
        DataCell(Text('\$${order.totalAmount.toStringAsFixed(2)}')),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;

}