import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:quick_shop_admin/features/dashboard/table/table_source.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: CustomSizes.xl * 1.2,
      columns: const [
        DataColumn2(label: Text('Order ID')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Items')),
        DataColumn2(label: Text('Status')),
        DataColumn2(label: Text('Amount')),
      ],
      source: OrderRows(),
    );
  }
}