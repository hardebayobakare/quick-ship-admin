import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(CustomRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
    
        const Image(image: AssetImage(CustomImages.successVerification), width: 300, height: 300),
        const SizedBox(height: CustomSizes.spaceBtwSections),
    
        Text(CustomTextStrings.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Text(email, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Text(CustomTextStrings.changeYourPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium, ),
        const SizedBox(height: CustomSizes.spaceBtwSections),

        // Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(CustomRoutes.login),
            child: const Text(CustomTextStrings.done),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () {}, child: const Text(CustomTextStrings.resendEmail))
        ),
      ],
    );
  }
}