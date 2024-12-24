import 'package:flutter/widgets.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/products/screens/edit_products/responsive_screens/edit_product_desktop.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: EditProductDesktopScreen(),
    );
  }
}