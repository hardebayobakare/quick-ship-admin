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
                      Center(child: Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2))),
                      const SizedBox(height: CustomSizes.spaceBtwItems),

                      //Menu Items
                      const CustomMenuItem(icon: Iconsax.status, title: 'Dashboard', route: CustomRoutes.dashboard),
                      const CustomMenuItem(icon: Iconsax.gallery, title: 'Media', route: CustomRoutes.media),  
                      const CustomMenuItem(icon: Iconsax.quote_up_square, title: 'Banners', route: CustomRoutes.banners),
                      const CustomMenuItem(icon: Iconsax.bag_2, title: 'Products', route: CustomRoutes.products),
                      const CustomMenuItem(icon: Iconsax.folder_open, title: 'Categories', route: CustomRoutes.categories),
                      const CustomMenuItem(icon: Iconsax.box, title: 'Brands', route: CustomRoutes.brands), 
                      const CustomMenuItem(icon: Iconsax.people, title: 'Customers', route: CustomRoutes.customers),
                      const CustomMenuItem(icon: Iconsax.shopping_bag, title: 'Orders', route: CustomRoutes.orders),
                      const CustomMenuItem(icon: Iconsax.cloud_snow, title: 'Coupons', route: CustomRoutes.coupons),                   
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

