import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTextStrings.email,
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: CustomTextStrings.password,
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Iconsax.eye_slash))
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),
    
            // Remember me & Forgot password
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text(CustomTextStrings.rememberMe, style: Theme.of(context).textTheme.bodyMedium),
                const Spacer(),
                TextButton(onPressed: () => Get.toNamed(CustomRoutes.forgetPassword), child: Text(CustomTextStrings.forgotPassword, style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ),

            const SizedBox(height: CustomSizes.spaceBtwSections),
    
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(CustomTextStrings.signIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}