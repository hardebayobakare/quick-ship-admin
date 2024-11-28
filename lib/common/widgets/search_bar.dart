import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: CustomTextStrings.search,
        prefixIcon: Icon(Iconsax.search_normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(CustomSizes.borderRadiusSm)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: CustomColors.primaryBackground,
      ),
    );
  }
}