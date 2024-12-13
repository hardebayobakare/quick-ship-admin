import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
    this.onPressed,
    this.size,
    this.color,
    this.backgroundColor,
    required this.icon,
  });

  final void Function()? onPressed;
  final double? size;
  final Color? color;
  final IconData icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.xs),
      child: Container(
        width: CustomSizes.iconMd,
        height: CustomSizes.iconMd,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: size, color: color),
      ),
    );
  }
}