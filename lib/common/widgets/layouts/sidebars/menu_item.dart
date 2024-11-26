import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.title,
  });

  final String route;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap:() => menuController.menuOnTap(route),
      onHover: (value) => value ? menuController.changeHoverItem(route) : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: CustomSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuController.isActive(route) ? CustomColors.primaryColor : menuController.isHover(route) ? CustomColors.lightGrey : Colors.transparent,
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: CustomSizes.lg, right: CustomSizes.md, bottom: CustomSizes.md, top: CustomSizes.md),
                  child: menuController.isActive(route) 
                    ? Icon(icon, color: CustomColors.white, size: 22) 
                    : Icon(icon, color: menuController.isHover(route) ? CustomColors.darkGrey : CustomColors.darkerGrey, size: 22),
                ),
                if(menuController.isActive(route))
                  Flexible(child: Text(title, style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.white)))
                else if(menuController.isHover(route))
                  Flexible(child: Text(title, style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.darkGrey)))
                else
                  Flexible(child: Text(title, style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.darkGrey))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}