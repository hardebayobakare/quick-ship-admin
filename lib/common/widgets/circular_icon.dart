import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
    this.onPressed,
    this.size,
    this.color,
    required this.icon,
  });

  final void Function()? onPressed;
  final double? size;
  final Color? color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.xs),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: size,
        color: color,
      ),
    );
  }
}