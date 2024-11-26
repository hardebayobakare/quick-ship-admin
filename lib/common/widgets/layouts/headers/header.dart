import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({
    super.key,
    this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.white,
        border: Border(bottom: BorderSide(color: CustomColors.grey)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md, vertical: CustomSizes.sm),
      child: AppBar(
        leading: !DeviceUtils.isDesktopScreen(context) 
          ? IconButton(
            onPressed: () => scaffoldKey?.currentState?.openDrawer(), 
            icon: const Icon(Iconsax.menu)
          ) 
          : null,
        title: DeviceUtils.isDesktopScreen(context) 
          ? SizedBox(
              width: 400,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search anything',
                  prefixIcon: Icon(Iconsax.search_normal),
                  border: InputBorder.none,
                ),
              ),
            )
          : null,
        actions: [
          // Search Icon for Tablet and Mobile
          if (!DeviceUtils.isDesktopScreen(context))
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Iconsax.search_normal)
            ),
          
          // Notification Icon
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Iconsax.notification)
          ),
          const SizedBox(width: CustomSizes.spaceBtwItems / 2),

          // User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomRoundedImage(
                width: 40,
                padding: 2,
                height: 40,
                imageType: ImageType.asset, 
                image: CustomImages.user
              ),
              const SizedBox(width: CustomSizes.sm),

              // Name and Email
              if(!DeviceUtils.isMobileScreen(context))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Adebayo Bakare', style: Theme.of(context).textTheme.titleLarge),
                    Text('support@binfotech.ca', style: Theme.of(context).textTheme.labelMedium),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight() + 15);
}