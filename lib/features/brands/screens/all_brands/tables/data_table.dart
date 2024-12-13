import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:quick_shop_admin/features/brands/screens/all_brands/tables/table_source.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(      
      minWidth: 700,
      tableHeight: 760,
      dataRowHeight: CustomSizes.xl * 2,
      columns: [
        DataColumn2(label: const Text(CustomTextStrings.brand), fixedWidth: DeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        const DataColumn2(label: Text(CustomTextStrings.categories)),
        DataColumn2(label: const Text(CustomTextStrings.featured), fixedWidth: DeviceUtils.isMobileScreen(Get.context!) ? null : 100),
        DataColumn2(label: const Text(CustomTextStrings.date), fixedWidth: DeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(label: const Text(CustomTextStrings.actions), fixedWidth: DeviceUtils.isMobileScreen(Get.context!) ? null : 100),
      ],
      source: BrandRows(),
    );
  }
}