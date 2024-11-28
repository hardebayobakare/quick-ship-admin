import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  var filteredDatalist = <Map<String, dynamic>>[].obs;
  var dataList = <Map<String, dynamic>>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  final seachController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void fetchDummyData() {
    selectedRows.addAll(List.generate(100, (index) => false));
    dataList.addAll(List.generate(
      100,
          (index) => {
        'Column1': 'Data ${index + 1} - 1',
        'Column2': 'Data ${index + 1} - 2',
        'Column3': 'Data ${index + 1} - 3',
      }));
    filteredDatalist.addAll(dataList);    
  }

  void sortbyId(int columnIndex, bool ascending) {
    sortAscending.value = ascending;
    sortColumnIndex.value = columnIndex;
    filteredDatalist.sort((a, b) {
      if (ascending) {
        final c = a;
        a = b;
        b = c;
      }
      return a.values.elementAt(columnIndex).compareTo(b.values.elementAt(columnIndex));
    });
    sortColumnIndex.value = columnIndex;
  }

  void searchQuery(String query) {
    filteredDatalist.clear();
    if (query.isEmpty) {
      filteredDatalist.addAll(dataList);
    } else {
      filteredDatalist.assignAll(dataList.where((element) => element['Column1'].toString().toLowerCase().contains(query.toLowerCase())));
    }
  }
}