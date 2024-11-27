import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:quick_shop_admin/features/authentication/screens/reset_password/widget/reset_password_widget.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomLoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}

