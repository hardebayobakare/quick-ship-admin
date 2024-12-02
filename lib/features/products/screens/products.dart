import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/products/screens/responsive_screens/product_desktop.dart';
import 'package:quick_shop_admin/features/products/screens/responsive_screens/product_mobile.dart';
import 'package:quick_shop_admin/features/products/screens/responsive_screens/product_tablet.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: ProductDesktopScreen(),
      tablet: ProductTabletScreen(),
      mobile: ProductMobileScreen(),
    );
  }
}