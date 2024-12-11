import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/categories/screens/all_categories/responsive_screen/category_desktop.dart';
import 'package:quick_shop_admin/features/categories/screens/all_categories/responsive_screen/category_mobile.dart';
import 'package:quick_shop_admin/features/categories/screens/all_categories/responsive_screen/category_tablet.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: CategoryDesktopScreen(),
      tablet: CategoryTabletScreen(),
      mobile: CategoryMobileScreen(),
    );
  }
}