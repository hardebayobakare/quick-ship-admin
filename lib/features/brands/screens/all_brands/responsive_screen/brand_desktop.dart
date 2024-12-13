import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/table_header.dart';
import 'package:quick_shop_admin/features/brands/screens/all_brands/tables/data_table.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class BrandDesktopScreen extends StatelessWidget {
  const BrandDesktopScreen({super.key});

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
                  CustomBreadCrumbsWithHeading(heading: CustomTextStrings.brands, breadcrumbs: [CustomTextStrings.brands]),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              CustomRoundedContainer(
                child: Column(
                  children: [
                    CustomTableHeader(
                      onPressed: () => Get.toNamed(CustomRoutes.createBrand), 
                      buttonText: CustomTextStrings.createNewBrand,
                      searchHintText: CustomTextStrings.searchBrand,
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwItems),

                    BrandTable()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}