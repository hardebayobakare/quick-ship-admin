import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:quick_shop_admin/features/categories/models/category_model.dart';
import 'package:quick_shop_admin/features/categories/screens/edit_category/widgets/edit_category_form.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class EditCategoryDesktopScreen extends StatelessWidget {
  const EditCategoryDesktopScreen({
    super.key,
    required this.category
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBreadCrumbsWithHeading(returnToPreviousScreen:true, heading: CustomTextStrings.updateCategory, breadcrumbs: [CustomRoutes.categories, CustomTextStrings.updateCategory]),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Form Body
              EditCategoryForm(category: category)

            ],
          ),
        ),
      )
    );
  }
}