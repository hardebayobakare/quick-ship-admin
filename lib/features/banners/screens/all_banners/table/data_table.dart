import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:quick_shop_admin/features/banners/screens/all_banners/table/table_source.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class BannersTable extends StatelessWidget {
  const BannersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(      
      minWidth: 700,
      tableHeight: 900,
      dataRowHeight: 110,
      columns: const [
        DataColumn2(label: Text(CustomTextStrings.banners)),
        DataColumn2(label: Text(CustomTextStrings.active)),
        DataColumn2(label: Text(CustomTextStrings.actions), fixedWidth: 100),
      ],
      source: BannersRows(),
    );
  }
}