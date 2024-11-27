import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/features/authentication/screens/forget_password/responsive_screen/forgetpassword_dektop_tablet.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      useLayout: false,
      desktop: ForgetpasswordScreenDektopTablet(),
      mobile: ForgetpasswordScreenDektopTablet(),
    );
  }
}