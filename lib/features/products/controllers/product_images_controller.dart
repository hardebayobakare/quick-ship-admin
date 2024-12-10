import 'package:get/get.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/models/image_model.dart';

class ProductImagesController extends GetxController{
  static ProductImagesController get instance => Get.find();

  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  final RxList<String> additionalProductImagesUrl = <String>[].obs;

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectedImagesForMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel selectedImage = selectedImages.first;

      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    final selectedImages = await controller.selectedImagesForMedia(multipleSelection: true, selectedUrls: additionalProductImagesUrl);

    if (selectedImages != null && selectedImages.isNotEmpty) {

      additionalProductImagesUrl.assignAll(selectedImages.map((e) => e.url));
    }
  }

  Future<void> removeImage(int index) async {
    additionalProductImagesUrl.removeAt(index);
    
  }
}