import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/widgets/media_content.dart';
import 'package:quick_shop_admin/features/media/widgets/media_uploader.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BreadCrumbs
                  const CustomBreadCrumbsWithHeading(heading: 'Media', breadcrumbs: ["Media"]),

                  SizedBox(
                    width: CustomSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                      onPressed: () => controller.showImageUploaderSection.value = !controller.showImageUploaderSection.value, 
                      label: const Text(CustomTextStrings.uploadImages),
                      icon: const Icon(Iconsax.cloud_add),
                    ),
                  )
                ],
              ),
              const SizedBox(height: CustomSizes.defaultSpace),

              // Upload Area
              const CustomMediaUploader(),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Media Content
              const CustomMediaContent(),
            ],
          ),
        ),
      )
    );
  }
}