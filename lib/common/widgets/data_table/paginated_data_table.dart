import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/loaders/animation_loader.dart';

class CustomPaginatedDataTable extends StatelessWidget {
  const CustomPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = CustomSizes.xl * 2,
    this.sortAscending = true,
    this.minWidth = 1000,
  });

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double tableHeight;
  final double dataRowHeight;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: const CardTheme(
            color: Colors.white,
            elevation: 0,
          ),
        ),
        child: PaginatedDataTable2(
          // Data
          source: source,
          
          // Columns and Rows properties
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: dataRowHeight,
          
          // Pagination
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          rowsPerPage: rowsPerPage,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},
          availableRowsPerPage: const [10, 20, 30, 40, 50],

          //Checkbox
          showCheckboxColumn: true,

          // Header Style
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith((states) => CustomColors.primaryBackground),
          empty: const CustomAnimationLoaderWidget(text: CustomTextStrings.nothingFound, animation: CustomImages.emptyPackage, height: 200, width:200),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(CustomSizes.borderRadiusMd),
              topRight: Radius.circular(CustomSizes.borderRadiusMd),
            ),
          ),

          // Sorting
          sortAscending: sortAscending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (bool ascending, bool sorted) {
            if (sorted) {
              return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down, size: CustomSizes.iconSm);
            } else {
              return const Icon(Iconsax.arrow_3, size: CustomSizes.iconSm);
            }
          },
          sortArrowIcon: Icons.line_axis,
          
        ),
      ),
    );
  }

}