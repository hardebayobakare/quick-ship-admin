import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/data_table/table_action_buttons.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/features/banners/models/banner_model.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class BannersRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        const DataCell(
          CustomRoundedImage(
            width: 180,
            height: 100,
            padding: CustomSizes.sm,
            image: CustomImages.banner1,
            imageType: ImageType.asset,
            borderRadius: CustomSizes.borderRadiusMd,
            backgroundColor: CustomColors.primaryBackground,
          )
        ),
        const DataCell(Icon(Iconsax.eye, color: CustomColors.primaryColor)),
        DataCell(
          CustomTableActionButtons(
            onEditPressed: () => Get.toNamed(CustomRoutes.editBanner, arguments: BannerModel.empty()),
            onDeletePressed: () {},
          )
        )
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;

}