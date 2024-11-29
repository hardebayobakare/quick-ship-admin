import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';

class CustomHelperFunctions {
  CustomHelperFunctions._();

  static DateTime getStartofWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0, 0, 0);
  }

  static Color getStatusColor(OrderStatus value){
    if (OrderStatus.pending == value){
      return Colors.blue;
    } else if (OrderStatus.processing == value){
      return Colors.orange;
    } else if (OrderStatus.shipped == value){
      return Colors.purple;
    } else if (OrderStatus.delivered == value){
      return Colors.green;
    } else if (OrderStatus.cancelled == value){
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  static String getStatusString(OrderStatus value){
    if (OrderStatus.pending == value){
      return 'Pending';
    } else if (OrderStatus.processing == value){
      return 'Processing';
    } else if (OrderStatus.shipped == value){
      return 'Shipped';
    } else if (OrderStatus.delivered == value){
      return 'Delivered';
    } else if (OrderStatus.cancelled == value){
      return 'Cancelled';
    } else {
      return 'Unknown';
    }
  }

  static Color? getColor(String value){
    if (value == 'Green'){
      return Colors.green;
    } else if (value == 'Red'){
      return Colors.red;
    } else if (value == 'Blue'){
      return Colors.blue;
    } else if (value == 'Pink'){
      return Colors.pink;
    } else if (value == 'Yellow'){
      return Colors.yellow;
    } else if (value == 'Purple'){
      return Colors.purple;
    } else if (value == 'Black'){
      return Colors.black;
    } else if (value == 'White'){
      return Colors.white;
    } else if (value == 'Grey'){
      return Colors.grey;
    } else if (value == 'Orange'){
      return Colors.orange;
    } else if (value == 'Brown'){
      return Colors.brown;
    } else if (value == 'Cyan'){
      return Colors.cyan;
    } else if (value == 'Teal'){
      return Colors.teal;
    } else if (value == 'Amber'){
      return Colors.amber;
    } else if (value == 'Lime'){
      return Colors.lime;
    } else if (value == 'Indigo'){
      return Colors.indigo;
    } else if (value == 'Light Blue'){
      return Colors.lightBlue;
    } else if (value == 'Deep Purple'){
      return Colors.deepPurple;
    } else if (value == 'Light Green'){
      return Colors.lightGreen;
    } else if (value == 'Deep Orange'){
      return Colors.deepOrange;
    } else if (value == 'Blue Grey'){
      return Colors.blueGrey;
    } else if (value == 'Grey'){
      return Colors.grey;
    } else {
      return null;
    }
  }

  static void showToastMessage(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message),
    ));
  }

  static void showAlert(String title, String message){
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void naviagteToScreen(BuildContext context, Widget screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static String truncateText(String text, int maxLength){
    if (text.length <= maxLength){
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize){
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
