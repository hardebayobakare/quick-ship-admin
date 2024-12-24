import 'package:flutter/widgets.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/banners/screens/create_banners/responsive_screen/create_banner_desktop.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: CreateBannerDesktopScreen(),
    );
  }
}