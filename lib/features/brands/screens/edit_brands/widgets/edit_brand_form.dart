import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/choice_chip.dart';
import 'package:quick_shop_admin/common/widgets/image_uploader.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class EditBrandForm extends StatelessWidget {
  const EditBrandForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: CustomSizes.sm),
              Text(CustomTextStrings.updateBrand, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: CustomTextStrings.brandName,
                  prefixIcon: Icon(Iconsax.box)
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),

              Text(CustomTextStrings.selectCateories, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),
              Wrap(
                spacing: CustomSizes.sm,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: CustomSizes.sm),
                    child: CustomChoiceChip(
                      text: 'Shoes',
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: CustomSizes.sm),
                    child: CustomChoiceChip(
                      text: 'Track Suits',
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: CustomSizes.sm),
                    child: CustomChoiceChip(
                      text: 'T-Shirts',
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: CustomSizes.sm),
                    child: CustomChoiceChip(
                      text: 'Shorts',
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),

              CustomImageUploader(
                width: 80,
                height: 80,
                image: CustomImages.defaultImage,
                imageType: ImageType.asset,
                onIconButtonPressed: () {},
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),

              CheckboxMenuButton(value: true, onChanged: (value) {}, child: const Text(CustomTextStrings.featured)),
              const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(CustomTextStrings.updateBrand),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}