import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';


class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.padding = const EdgeInsets.all(CustomSizes.md),
    this.showborder = false,
    this.boxShadow = true,
    this.radius = CustomSizes.cardRadiusLg,
    this.backgroundColor = CustomColors.white,
    this.borderColor = CustomColors.borderPrimary,
    this.onTap,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showborder;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool boxShadow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showborder ? Border.all(color: borderColor) : null,
        boxShadow: [
          if (boxShadow)
            BoxShadow(
              color: CustomColors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
        ]
      ),
      child: child,
    );
  }
}