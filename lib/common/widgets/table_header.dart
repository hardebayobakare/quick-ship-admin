

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class CustomTableHeader extends StatelessWidget {
  const CustomTableHeader({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.searchController,
    required this.searchHintText,
    this.onSearchChanged,
  });

  final Function() onPressed;
  final String buttonText;

  final TextEditingController? searchController;
  final String searchHintText;
  final Function(String)? onSearchChanged;  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: DeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(width: 200, child: ElevatedButton(onPressed: onPressed, child: Text(buttonText))),
            ],
          )),

        Expanded(
          flex: DeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: searchHintText,
              prefixIcon: const Icon(Iconsax.search_normal),
            ),
          ),
        ),
      ],
    );
  }
}