import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/circular_image.dart';
import 'package:quick_shop_admin/common/widgets/circular_icon.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomImageUploader extends StatelessWidget {
  const CustomImageUploader({
    super.key,
    this.image,
    this.onIconButtonPressed,
    this.memoryImage,
    this.width = 100,
    this.height = 100,
    required this.imageType,
    this.circular = false,
    this.icon = Iconsax.edit_2,
    this.top,
    this.bottom = 0,
    this.right,
    this.left = 0,
  });

  final bool circular;
  final double height;
  final IconData icon;
  final ImageType imageType;
  final String? image;
  final void Function()? onIconButtonPressed;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;
  final double width;
  final Uint8List? memoryImage;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        circular 
          ? CustomCircularImage(
              width: width,
              height: height,
              image: image,
              imageType: imageType,
              memoryImage: memoryImage,
              backgroundColor: CustomColors.primaryBackground,
            )
          : CustomRoundedImage(
              width: width,
              height: height,
              image: image,
              imageType: imageType,
              memoryImage: memoryImage,
              backgroundColor: CustomColors.primaryBackground,
            ),
        Positioned(
          top: top,
          bottom: bottom,
          right: right,
          left: left,
          child: CustomCircularIcon(
            onPressed: onIconButtonPressed,
            size: CustomSizes.md,
            color: Colors.white,
            icon: icon,
            backgroundColor: CustomColors.primaryColor.withOpacity(0.9),
          ),
        )
      ],
    );
  }
}