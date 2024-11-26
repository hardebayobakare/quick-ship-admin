import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(width: 100, height: 100, image: AssetImage(CustomImages.darkAppLogo)),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          Text(CustomTextStrings.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: CustomSizes.sm),
          Text(CustomTextStrings.loginSubtitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}