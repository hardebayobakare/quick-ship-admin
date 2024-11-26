import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/spacing_style.dart';

class CustomLoginTemplate extends StatelessWidget {
  const CustomLoginTemplate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: CustomSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            ),
            child: child,
          ),
        ),
      )
    );
  }
}