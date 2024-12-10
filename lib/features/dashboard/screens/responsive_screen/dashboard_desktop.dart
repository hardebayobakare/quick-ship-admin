import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/dashboard_card.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/order_status.dart';
import 'package:quick_shop_admin/features/dashboard/screens/widgets/weekly_sales.dart';
import 'package:quick_shop_admin/features/dashboard/table/data_table.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
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
              const Row(
                children: [
                  Expanded(child: CustomDashboardCard(title: CustomTextStrings.sales, subtitle: '\$12,000', stats: '20')),
                  SizedBox(width: CustomSizes.spaceBtwItems),
                  Expanded(child: CustomDashboardCard(title: CustomTextStrings.averageOrder, subtitle: '\$30', stats: '15')),
                  SizedBox(width: CustomSizes.spaceBtwItems),
                  Expanded(child: CustomDashboardCard(title: CustomTextStrings.totalOrder, subtitle: '100', stats: '44')),
                  SizedBox(width: CustomSizes.spaceBtwItems),
                  Expanded(child: CustomDashboardCard(title: CustomTextStrings.visitors, subtitle: '22,521', stats: '2')),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Graphs
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // Bar Graoh
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
                        )  
                      ],
                    )
                  ),
                  const SizedBox(width: CustomSizes.spaceBtwItems),

                  // Pie Chart
                  const Expanded(
                    child: CustomOrderStatusPieChart()
                  ),
                ],
              )
            
            ],
          ),
        ),
      )
    );
  }
}

