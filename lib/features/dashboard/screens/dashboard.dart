import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/dashboard/screens/responsive_screen/dashboard_desktop.dart';
import 'package:quick_shop_admin/features/dashboard/screens/responsive_screen/dashboard_mobile.dart';
import 'package:quick_shop_admin/features/dashboard/screens/responsive_screen/dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: DashboardDesktopScreen(),
      tablet: DashboardTabletScreen(),
      mobile: DashboardMobileScreen(),
    );
  }
}