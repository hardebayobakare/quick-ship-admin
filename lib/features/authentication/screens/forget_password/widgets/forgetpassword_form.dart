import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Text(CustomTextStrings.forgetPassowrdTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Text(CustomTextStrings.forgetPassowrdSubtitle, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: CustomSizes.spaceBtwSections * 2),
        
        
        // Form
        Form(
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: CustomTextStrings.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwSections),
    
        // Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(CustomRoutes.resetPassword, parameters: {'email': 'support@binfotech.ca'}),
            child: const Text(CustomTextStrings.submit),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwSections * 2),
      ],
    );
  }
}