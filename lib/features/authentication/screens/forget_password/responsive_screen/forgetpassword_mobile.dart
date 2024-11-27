import 'package:flutter/material.dart';
import 'package:quick_shop_admin/features/authentication/screens/forget_password/widgets/forgetpassword_form.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class ForgetpasswordScreenMobile extends StatelessWidget {
  const ForgetpasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: ForgetPasswordForm(),
        ),
      ),
    );
  }
}