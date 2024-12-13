import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/brands/screens/all_brands/responsive_screen/brand_desktop.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSiteLayout(
      desktop: BrandDesktopScreen(),
    );
  }
}