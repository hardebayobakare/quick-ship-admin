import 'package:flutter/widgets.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/products/screens/create_products/responsive_screens/create_product_desktop.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: CreateProductDesktopScreen(),
    );
  }
}