import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/widgets/folder_dowpdown.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CustomMediaContent extends StatelessWidget {
  const CustomMediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meida Images Header
          Row(
            children: [
              Text(CustomTextStrings.selectFolder, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              CustomMediaFoldersDropDown(onChanged: (MediaCategory? value) {
                if(value != null){
                  controller.selectedCategory.value = value;
                }
              }),
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),

          const Wrap(
            alignment: WrapAlignment.start,
            spacing: CustomSizes.spaceBtwItems / 2,
            runSpacing: CustomSizes.spaceBtwItems / 2,
            children: [
              CustomRoundedImage(
                width: 90,
                height: 90,
                padding: CustomSizes.sm,
                imageType: ImageType.asset,
                image: CustomImages.shoeIcon,
                backgroundColor: CustomColors.primaryBackground,
              ),
              CustomRoundedImage(
                width: 90,
                height: 90,
                padding: CustomSizes.sm,
                imageType: ImageType.asset,
                image: CustomImages.toyIcon,
                backgroundColor: CustomColors.primaryBackground,
              ),
              CustomRoundedImage(
                width: 90,
                height: 90,
                padding: CustomSizes.sm,
                imageType: ImageType.asset,
                image: CustomImages.electronicsIcon,
                backgroundColor: CustomColors.primaryBackground,
              ),
              CustomRoundedImage(
                width: 90,
                height: 90,
                padding: CustomSizes.sm,
                imageType: ImageType.asset,
                image: CustomImages.furnitureIcon,
                backgroundColor: CustomColors.primaryBackground,
              ),
              CustomRoundedImage(
                width: 90,
                height: 90,
                padding: CustomSizes.sm,
                imageType: ImageType.asset,
                image: CustomImages.clothIcon,
                backgroundColor: CustomColors.primaryBackground,
              ),
            ],
          ),

          // Load more media button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: CustomSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_down),
                    label: const Text(CustomTextStrings.loadMore),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}