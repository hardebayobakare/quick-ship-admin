import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class CustomWeeklySalesGraph extends StatelessWidget {
  const CustomWeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CustomTextStrings.weeklySales, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: CustomSizes.spaceBtwItems),

          // Graph
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                titlesData: buildFlTitleData(),
                borderData: FlBorderData(show: true, border: const Border(top: BorderSide.none, right: BorderSide.none)),
                gridData: const FlGridData(
                  show: true, 
                  drawHorizontalLine: true, 
                  drawVerticalLine: false,
                  horizontalInterval: 200,
                ),
                barGroups: controller.weeklySales.asMap().entries.map((e) => BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value,
                      width: 20,
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(CustomSizes.sm)
                    )
                  ]
                )).toList(),
                groupsSpace: CustomSizes.spaceBtwItems,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => CustomColors.secondaryColor,
                  ),
                  touchCallback: DeviceUtils.isDesktopScreen(context) 
                    ? (barTouchEvent, barTouchResponse) {} 
                    : null,
                )                                    
              )
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData buildFlTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            final index = value.toInt() % days.length;

            final day = days[index];

            return SideTitleWidget(axisSide: AxisSide.bottom, space: 0, child: Text(day));
          }
        )
      ),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}