import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:quick_shop_admin/features/authentication/screens/forget_password/widgets/forgetpassword_form.dart';

class ForgetpasswordScreenDektopTablet extends StatelessWidget {
  const ForgetpasswordScreenDektopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomLoginTemplate(
      child: ForgetPasswordForm()
    );
  }
}

