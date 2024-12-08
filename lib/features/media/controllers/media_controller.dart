import 'dart:typed_data';
import 'package:universal_html/html.dart';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/media/media_repository.dart';
import 'package:quick_shop_admin/features/media/models/image_model.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/popups/dialogs.dart';
import 'package:quick_shop_admin/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_admin/utils/popups/loaders.dart';


class MediaController extends GetxController{
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedCategory = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  final MediaRepository mediaRepository = MediaRepository();


  Future<void> selectLocalImages() async {
    final files = await dropzoneViewController.pickFiles(multiple: true, mime: ['image/jpeg', 'image/png', 'image/jpg']);

    if (files.isNotEmpty) {
      for (var file in files) {
        final bytes = await dropzoneViewController.getFileData(file);
        final String fileName = await dropzoneViewController.getFilename(file);
        final String mimeType = await dropzoneViewController.getFileMIME(file);
        File htmlFile = File([bytes], fileName, {'type': mimeType});
        final image = ImageModel(
          url: '',
          file: htmlFile,
          folder: '',
          filename: htmlFile.name,
          localImageToDisplay: Uint8List.fromList(bytes)
        );
        selectedImagesToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() {
    if (selectedCategory.value == MediaCategory.folders) {
      CustomLoaders.warningSnackBar(title: CustomTextStrings.selectFolder, message: CustomTextStrings.selectUploadFolder);
      return;
    }
    CustomDialogs.defaultDialog
    (context: Get.context!,
      title: CustomTextStrings.uploadImages,
      content: '${CustomTextStrings.uploadImagesConfirmation} ${selectedCategory.value.name.toUpperCase()} folder?',
      onConfirm: () async => await uploadImages(),
    );
  }

  Future<void> uploadImages() async {
    try {
      // Remove the dialog
      Get.back();

      // Start Loader
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.uploadingImage, CustomImages.dataProcess);

      // Get the selected folder
      MediaCategory category = selectedCategory.value;

      // Corresponding List to update
      RxList<ImageModel> targetList;

      // Check the selected folder and update targetList
      switch(category) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          return;
      }

      // Using a reversed loop to avoid 'Concurrent Modification Error'
      for (int i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        var selectedImage = selectedImagesToUpload[i];
        final image = selectedImage.file!;
        

        final ImageModel uploadedImage = await mediaRepository.uploadImageFileInStrage(
          file: image,
          folder: getSelectedPath(),
          imageName: selectedImage.filename,
        );

        uploadedImage.mediaCategory = category.name;
        final String id = await mediaRepository.uploadImageFileInDatabase(uploadedImage);
        uploadedImage.id = id;

        selectedImagesToUpload.removeAt(i);
        targetList.add(uploadedImage);
      }

      CustomFullScreenLoader.closeLoadingDialog();

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      print(e.toString());
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.generalError);
    }
  }

  String getSelectedPath() {
    switch(selectedCategory.value) {
      case MediaCategory.banners:
        return CustomTextStrings.bannersStoragePath;
      case MediaCategory.products:
        return CustomTextStrings.productsStoragePath;
      case MediaCategory.brands:
        return CustomTextStrings.brandsStoragePath;
      case MediaCategory.categories:
        return CustomTextStrings.categoriesStoragePath;
      case MediaCategory.users:
        return CustomTextStrings.usersStoragePath;
      default:
        return CustomTextStrings.othersStoragePath;
    }
  }
}