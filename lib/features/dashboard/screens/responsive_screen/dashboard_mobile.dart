import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/dashboard_card.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/order_status.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/weekly_sales.dart';
import 'package:quick_shop_admin/features/dashboard/table/data_table.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              CustomTextStrings.dashboard,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            // Cards
            const CustomDashboardCard(title: 'Sales', subtitle: '\$12,000', stats: '20'),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            const CustomDashboardCard(title: 'Average Order', subtitle: '\$30', stats: '15'),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            const CustomDashboardCard(title: 'Total Order', subtitle: '100', stats: '44'),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            const CustomDashboardCard(title: 'Visitors', subtitle: '22,521', stats: '2'),
            const SizedBox(height: CustomSizes.spaceBtwItems),

            // Bar Graph
            const CustomWeeklySalesGraph(),
            const SizedBox(height: CustomSizes.spaceBtwItems),

            // Orders
            CustomRoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(CustomTextStrings.recentOrders, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  const DashboardOrderTable(),
                ],
              ),
            ),  
            const SizedBox(height: CustomSizes.spaceBtwItems),

            // Pie Chart
            const CustomOrderStatusPieChart(),      
          ],
        ),
      )
    );
  }
}