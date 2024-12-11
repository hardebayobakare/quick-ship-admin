import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/categories/models/category_model.dart';
import 'package:quick_shop_admin/features/categories/screens/edit_category/responsive_screen/edit_category_desktop.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = CategoryModel.empty();
    return CustomSiteLayout(
      desktop: EditCategoryDesktopScreen(category: category),
    );
  }
}