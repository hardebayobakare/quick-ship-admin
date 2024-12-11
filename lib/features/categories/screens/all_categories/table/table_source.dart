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

class CategoryRows extends DataTableSource {
  @override
  DataRow getRow(int index) {
    // final category = CategoryController.categories[index];
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const CustomRoundedImage(
                width: 50,
                height: 50,
                padding: CustomSizes.sm,
                image: CustomImages.shoeIcon,
                imageType: ImageType.asset,
                borderRadius: CustomSizes.borderRadiusMd,
                backgroundColor: CustomColors.primaryBackground,
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  "Name",
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: CustomColors.primaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ),
        const DataCell(Text('Parents')),
        const DataCell(Icon(Iconsax.heart5, color: CustomColors.primaryColor)),
        const DataCell(Text('Date')),
        DataCell(
          CustomTableActionButtons(
            onEditPressed: () => Get.toNamed(CustomRoutes.editCategory, arguments: CustomTextStrings.category),
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