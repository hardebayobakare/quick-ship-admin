import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/table_header.dart';
import 'package:quick_shop_admin/features/banners/screens/all_banners/table/data_table.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class BannersDesktopScreen extends StatelessWidget {
  const BannersDesktopScreen({super.key});

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
                  CustomBreadCrumbsWithHeading(heading: CustomTextStrings.banners, breadcrumbs: [CustomTextStrings.banners]),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              CustomRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTableHeader(
                      onPressed: () => Get.toNamed(CustomRoutes.createBanner), 
                      buttonText: CustomTextStrings.createNewBanner, 
                      searchHintText: CustomTextStrings.searchBanners
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwItems),

                    // Table Body
                    const BannersTable()
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