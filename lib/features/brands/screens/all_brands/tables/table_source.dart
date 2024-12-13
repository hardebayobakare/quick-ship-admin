import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/data_table/table_action_buttons.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class BrandRows extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const CustomRoundedImage(
                width: 50,
                height: 50,
                padding: CustomSizes.sm,
                image: CustomImages.adidasLogo,
                imageType: ImageType.asset,
                borderRadius: CustomSizes.borderRadiusMd,
                backgroundColor: CustomColors.primaryBackground,
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  'Adidas',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: CustomColors.primaryColor),
                ),
              )
            ],
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: CustomSizes.sm),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: CustomSizes.xs,
                direction: DeviceUtils.isMobileScreen(Get.context!) ? Axis.vertical : Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: DeviceUtils.isMobileScreen(Get.context!) ? 0 : CustomSizes.xs),
                    child: const Chip(label: Text('Shoes'), padding: EdgeInsets.all(CustomSizes.xs)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: DeviceUtils.isMobileScreen(Get.context!) ? 0 : CustomSizes.xs),
                    child: const Chip(label: Text('Tracksuits'), padding: EdgeInsets.all(CustomSizes.xs)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: DeviceUtils.isMobileScreen(Get.context!) ? 0 : CustomSizes.xs),
                    child: const Chip(label: Text('Joggers'), padding: EdgeInsets.all(CustomSizes.xs)),
                  )
                ],
              ),
            )
          )
        ),
        const DataCell(Icon(Iconsax.heart5, color: CustomColors.primaryColor)),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          CustomTableActionButtons(
            onEditPressed: () => Get.toNamed(CustomRoutes.editBrand, arguments: CustomTextStrings.brands),
            onDeletePressed: () => print('Delete'),
          )
        )
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 5;

  @override
  int get selectedRowCount => 0;

}