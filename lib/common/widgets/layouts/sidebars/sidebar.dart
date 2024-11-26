import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/circular_image.dart';
import 'package:quick_shop_admin/common/widgets/layouts/sidebars/menu_item.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomCircularImage(
                  width: 100,
                  height: 100,
                  image: CustomImages.darkAppLogo,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: CustomSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.all(CustomSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Menu', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),

                      //Menu Items
                      const CustomMenuItem(icon: Iconsax.status, title: 'Dashboard', route: CustomRoutes.dashboard),                      
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

