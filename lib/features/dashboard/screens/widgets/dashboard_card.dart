import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/section_heading.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class CustomDashboardCard extends StatelessWidget {
  const CustomDashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.iconColor = CustomColors.success,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String stats;
  final IconData icon;
  final Color iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(CustomSizes.lg),
      child: Column(
        children: [
          // Heading
          CustomSectionHeading(title: title, textColor: CustomColors.secondaryColor, showActionButton: false),
          const SizedBox(height: CustomSizes.spaceBtwSections),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 10, child: Text(subtitle, style: Theme.of(context).textTheme.headlineMedium, overflow: TextOverflow.ellipsis)),    
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(icon, color: CustomColors.success, size: CustomSizes.iconSm),
                          Text('$stats%', style: Theme.of(context).textTheme.titleLarge!.apply(color: CustomColors.success, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),                  
                    SizedBox(
                      child: Text(
                        'Compared to last month',
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          
    
        ],
      ),
    );
  }
}




