

import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/categories/screens/create_category/responsive_screen/create_category_desktop.dart';


class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: CreateCategoryDesktopScreen(),
    );
  }
}