import 'package:get/get.dart';
import 'package:quick_shop_admin/features/categories/models/category_model.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  static final List<CategoryModel> categories = [];
}