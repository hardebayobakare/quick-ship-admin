import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';

class MediaController extends GetxController{
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedCategory = MediaCategory.folders.obs;
}