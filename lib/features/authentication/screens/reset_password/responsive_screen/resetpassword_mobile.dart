import 'package:flutter/material.dart';
import 'package:quick_shop_admin/features/authentication/screens/reset_password/widget/reset_password_widget.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}