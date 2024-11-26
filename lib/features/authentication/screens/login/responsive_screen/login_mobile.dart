import 'package:flutter/material.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/widgets/login_form.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/widgets/login_header.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Header
              CustomLoginHeader(),

              // Form
              CustomLoginForm(),
            ],
          ),
        ),
      )
    );
  }
}