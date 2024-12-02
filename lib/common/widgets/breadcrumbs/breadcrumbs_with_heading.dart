import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:quick_shop_admin/common/widgets/page_heading.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomBreadCrumbsWithHeading extends StatelessWidget {
  const CustomBreadCrumbsWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbs,
    this.returnToPreviousScreen = false,
  });

  final String heading;
  final List<String> breadcrumbs;
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumbs trail
        CustomBreadcrumbs(breadcrumbs: breadcrumbs),

        const SizedBox(height: CustomSizes.sm),
        // Heading
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (returnToPreviousScreen) IconButton(onPressed: () => Get.back, icon: const Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen)  const SizedBox(width: CustomSizes.spaceBtwItems),
            CustomPageHeading(
              heading: heading,
              
            ),
          ],
        ),
      ],
    );
  }
}