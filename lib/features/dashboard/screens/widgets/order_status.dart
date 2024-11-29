import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/circluar_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/helpers/helper_functions.dart';

class CustomOrderStatusPieChart extends StatelessWidget {
  const CustomOrderStatusPieChart({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CustomTextStrings.orderStatus, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          
          // Graph
          SizedBox(
            height: 400,
            child: PieChart(PieChartData(
              sections: controller.orderStatusData.entries.map((entry) {
                final status = entry.key;
                final count = entry.value;
                return PieChartSectionData(
                  value: count.toDouble(),
                  title: count.toString(),
                  titleStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  radius: 100,
                  color: CustomHelperFunctions.getStatusColor(status),
                );
              }).toList(),
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  
                },
                enabled: true,
              ),
            )),
          ),
      
          // Status Meta Data
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ], 
              rows: controller.orderStatusData.entries.map((entry) {
                final OrderStatus status = entry.key;
                final count = entry.value;
                final total = controller.totalAmounts[status] ?? 0.0;
                return DataRow(cells: [
                  DataCell(
                    Row(
                      children: [
                        CustomCircularContainer(width: 20, height: 20, backgroundColor: CustomHelperFunctions.getStatusColor(status)),
                        Expanded(child: Text(' ${CustomHelperFunctions.getStatusString(status)}')),
                      ],
                    )),
                  DataCell(Text(count.toString())),
                  DataCell(Text('\$${total.toStringAsFixed(2)}')),
                ]);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}