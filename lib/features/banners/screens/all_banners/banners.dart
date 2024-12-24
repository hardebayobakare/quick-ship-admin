import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/banners/screens/all_banners/responsive_screens/banners_desktop.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: BannersDesktopScreen(),
      // tablet: BannersTabletScreen(),
      // mobile: BannersMobileScreen(),
    );
  }
}