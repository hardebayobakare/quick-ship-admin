import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';

class CustomTableActionButtons extends StatelessWidget {
  const CustomTableActionButtons({
    super.key,
    this.view = false,
    this.edit = true,
    this.delete = true,
    this.onViewPressed,
    this.onEditPressed,
    this.onDeletePressed,
  });

  final bool view;
  final bool edit;
  final bool delete;
  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(view)
          IconButton(
            icon: const Icon(Iconsax.eye, color: CustomColors.darkerGrey),
            onPressed: onViewPressed,
          ),
        if(edit)
          IconButton(
            icon: const Icon(Iconsax.pen_add, color: CustomColors.primaryColor),
            onPressed: onEditPressed,
          ),
        if(delete)
          IconButton(
            icon: const Icon(Iconsax.trash, color: CustomColors.error),
            onPressed: onDeletePressed,
          ),
      ],
    );
  }
}