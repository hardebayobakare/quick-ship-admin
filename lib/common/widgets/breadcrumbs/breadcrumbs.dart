import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CustomBreadcrumbs extends StatelessWidget {
  const CustomBreadcrumbs({
    super.key,
    required this.breadcrumbs
  });

  final List<String> breadcrumbs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.offAllNamed(CustomRoutes.dashboard),
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.xs),
            child: Text(CustomTextStrings.dashboard, style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: -1)),
          ),
        ),
        for (int i = 0; i < breadcrumbs.length; i++)
          Row(
            children: [
              const Text('/'),
              InkWell(
                onTap: i == breadcrumbs.length - 1 ? null : () => Get.toNamed(breadcrumbs[i]),
                child: Padding(
                  padding: const EdgeInsets.all(CustomSizes.xs),
                  child: Text(
                    i == breadcrumbs.length - 1 
                      ? breadcrumbs[i].capitalize.toString() 
                      : breadcrumbs[i].substring(1).capitalizeFirst!, 
                    style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: -1)),
                ),
              ),
            ],
          ),
      ],
    );
  }
}