

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/image_uploader.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/features/categories/models/category_model.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/validators/validation.dart';

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({
    super.key,
    required this.category
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
     return CustomRoundedContainer(
      width: 500,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const SizedBox(height: CustomSizes.sm),
            Text(CustomTextStrings.updateCategory, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            TextFormField(
              validator: (value) => CustomValidator.validateOtherText("Name", value),
              initialValue: category.name,
              decoration: const InputDecoration(
                labelText: CustomTextStrings.categoryName,
                prefixIcon: Icon(Iconsax.category),
              ),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: CustomTextStrings.parentCategory,
                hintText: CustomTextStrings.parentCategory,
                prefixIcon: Icon(Iconsax.bezier),
              ),
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('item.name')
                    ],
                  ),
                )
              ],
              onChanged: (newValue) {}
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

            CheckboxMenuButton(
              value: true, 
              onChanged: (value) {}, 
              child: const Text(CustomTextStrings.featured),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(CustomTextStrings.save),
              ),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}