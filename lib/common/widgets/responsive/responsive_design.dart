import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomResponsiveWidget extends StatelessWidget {
  const CustomResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= CustomSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < CustomSizes.desktopScreenSize && constraints.maxWidth >= CustomSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}