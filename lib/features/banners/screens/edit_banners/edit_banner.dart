import 'package:flutter/widgets.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/banners/screens/edit_banners/responsive_screen/edit_banner_desktop.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: EditBannerDesktopScreen(),
    );
  }
}