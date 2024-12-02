import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';

class CustomMediaFoldersDropDown extends StatelessWidget {
  const CustomMediaFoldersDropDown({
    super.key,
    this.onChanged,
  });

  final void Function(MediaCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => SizedBox(
        width: 140,
        child: DropdownButtonFormField(
          isExpanded: false,
          value: controller.selectedCategory.value,
          items: MediaCategory.values.map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.capitalize.toString()),
            ),
          ).toList(),
          onChanged: onChanged),
      ),
    );
  }
}