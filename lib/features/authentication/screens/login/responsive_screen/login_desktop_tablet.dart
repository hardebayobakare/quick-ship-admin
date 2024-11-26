import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/widgets/login_form.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/widgets/login_header.dart';


class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomLoginTemplate(
      child: Column(
        children: [
          // Header
          CustomLoginHeader(),

          //Form
          CustomLoginForm()
        ],
      )
    );
  }
}



