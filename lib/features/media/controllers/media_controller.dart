import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/features/media/widgets/media_content.dart';
import 'package:quick_shop_admin/features/media/widgets/media_uploader.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/loaders/circular_loader.dart';
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

  final RxBool loading = false.obs;

  final int initialLoadCount = 20;
  final int loadMoreCount = 15;

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

  void getMediaImages() async {
    try {
      loading.value = true;

      RxList<ImageModel> targetList = <ImageModel>[].obs;

      if (selectedCategory.value == MediaCategory.banners && allBannerImages.isEmpty) {
        targetList = allBannerImages;
      } else if (selectedCategory.value == MediaCategory.products && allProductImages.isEmpty) {
        targetList = allProductImages;
      } else if (selectedCategory.value == MediaCategory.brands && allBrandImages.isEmpty) {
        targetList = allBrandImages;
      } else if (selectedCategory.value == MediaCategory.categories && allCategoryImages.isEmpty) {
        targetList = allCategoryImages;
      } else if (selectedCategory.value == MediaCategory.users && allUserImages.isEmpty) {
        targetList = allUserImages;
      }

      final images = await mediaRepository.fetchImageFromDatabase(selectedCategory.value, initialLoadCount);
      targetList.assignAll(images);

      loading.value = false;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.generalError);
    }
  }

  void loadMoreImages() async {
    try {
      loading.value = true;

      RxList<ImageModel> targetList = <ImageModel>[].obs;

      if (selectedCategory.value == MediaCategory.banners && allBannerImages.isEmpty) {
        targetList = allBannerImages;
      } else if (selectedCategory.value == MediaCategory.products && allProductImages.isEmpty) {
        targetList = allProductImages;
      } else if (selectedCategory.value == MediaCategory.brands && allBrandImages.isEmpty) {
        targetList = allBrandImages;
      } else if (selectedCategory.value == MediaCategory.categories && allCategoryImages.isEmpty) {
        targetList = allCategoryImages;
      } else if (selectedCategory.value == MediaCategory.users && allUserImages.isEmpty) {
        targetList = allUserImages;
      }

      final DateTime lastCreatedAt = targetList.isNotEmpty
        ? targetList.last.createdAt ?? DateTime.now()
        : DateTime.now();

      final images = await mediaRepository.loadMoreImagesFromDatabase(selectedCategory.value, initialLoadCount, lastCreatedAt);

      targetList.addAll(images);

      loading.value = false;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.generalError);
    }
  }

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

  void deleteImageConfirmation(ImageModel image) {
    CustomDialogs.defaultDialog(
      context: Get.context!,
      title: CustomTextStrings.deleteImage,
      content: CustomTextStrings.deleteImageConfirmation,
      onConfirm: () {
        Get.back();
        removeCloudImage(image);
      }
    );
  }

  void removeCloudImage(ImageModel image) async {
    try {
      Get.back();

      Get.defaultDialog(
        title: CustomTextStrings.deletingImage,
        content: const PopScope(
          canPop: false,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Center(
              child: CustomCircularLoader(),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      await mediaRepository.deleteFileFromStorage(image);

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

      targetList.remove(image);

      update();

      CustomFullScreenLoader.closeLoadingDialog();

      CustomLoaders.successSnackBar(title: CustomTextStrings.imageDeleted, message: CustomTextStrings.imageDeletedMessage);

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.generalError);
    }
  }

  Future<List<ImageModel>?> selectedImagesForMedia({List<String>? selectedUrls, bool allowSelection = true, bool multipleSelection = false}) async {
    showImageUploaderSection.value = true;

    List<ImageModel>? selectedImages = await Get.bottomSheet<List<ImageModel>>(
      isScrollControlled: true,
      backgroundColor: CustomColors.primaryBackground,
      FractionallySizedBox(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                const CustomMediaUploader(),
                CustomMediaContent(allowSelection: allowSelection, 
                allMultipleSelection: multipleSelection,
                alreadySelectedImageUrls: selectedUrls ?? [],)
              ],
            ),
          ),
        ),
      )
    );

    return selectedImages;
  }
}