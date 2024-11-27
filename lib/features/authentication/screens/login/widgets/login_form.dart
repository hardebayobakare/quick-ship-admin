import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/features/authentication/controllers/login_controller.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/validators/validation.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => CustomValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTextStrings.email,
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => CustomValidator.validateOtherText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: CustomTextStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),)
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),
    
            // Remember me & Forgot password
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.rememberMe.value, 
                    onChanged: (value) => controller.rememberMe.value = value!,
                  ),
                ),
                Text(CustomTextStrings.rememberMe, style: Theme.of(context).textTheme.bodyMedium),
                const Spacer(),
                TextButton(onPressed: () => Get.toNamed(CustomRoutes.forgetPassword), child: Text(CustomTextStrings.forgotPassword, style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ),

            const SizedBox(height: CustomSizes.spaceBtwSections),
    
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordLogin(),
                child: const Text(CustomTextStrings.signIn),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () => controller.registerAdmin(),
            //     child: const Text(CustomTextStrings.registerAdmin),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}