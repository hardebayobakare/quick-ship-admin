import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CreateBannerForm extends StatelessWidget {
  const CreateBannerForm({super.key});

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
              Text(CustomTextStrings.createNewBanner, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CustomRoundedImage(
                      width: 400,
                      height: 200,
                      backgroundColor: CustomColors.primaryBackground,
                      image: CustomImages.defaultImage,
                      imageType: ImageType.asset
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  TextButton(onPressed: () {}, child: const Text(CustomTextStrings.selectImage)),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),

              Text(CustomTextStrings.makeBannerActive, style: Theme.of(context).textTheme.bodyMedium),
              CheckboxMenuButton(value: true, onChanged: (value) {}, child: const Text(CustomTextStrings.active)),

              const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(CustomTextStrings.create),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields * 2),
            ],
          ),
        ),
      ),
    );
  }
}