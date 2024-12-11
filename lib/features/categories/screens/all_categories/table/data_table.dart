import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:quick_shop_admin/features/categories/screens/all_categories/table/table_source.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      dataRowHeight: CustomSizes.xl * 1.2,
      columns: const [
        DataColumn2(label: Text(CustomTextStrings.category)),
        DataColumn2(label: Text(CustomTextStrings.parentCategory)),
        DataColumn2(label: Text(CustomTextStrings.featured)),
        DataColumn2(label: Text(CustomTextStrings.date)),
        DataColumn2(label: Text(CustomTextStrings.actions), fixedWidth: 100),
      ],
      source: CategoryRows(),
    );
  }
}