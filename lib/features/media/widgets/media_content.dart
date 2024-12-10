import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/models/image_model.dart';
import 'package:quick_shop_admin/features/media/widgets/folder_dowpdown.dart';
import 'package:quick_shop_admin/features/media/widgets/view_image_details.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/loaders/animation_loader.dart';
import 'package:quick_shop_admin/utils/loaders/loader_animation.dart';

class CustomMediaContent extends StatelessWidget {
  CustomMediaContent({
    super.key,
    required this.allowSelection,
    required this.allMultipleSelection,
    this.alreadySelectedImageUrls,
    this.onImageSelected,
  });

  final bool allowSelection;
  final bool allMultipleSelection;
  final List<String>? alreadySelectedImageUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImageSelected;

  @override
  Widget build(BuildContext context) {
    bool loadingPreviousImages = false;
    final controller = MediaController.instance;
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meida Images Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(CustomTextStrings.selectFolder, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(width: CustomSizes.spaceBtwItems),
                  CustomMediaFoldersDropDown(onChanged: (MediaCategory? value) {
                    if(value != null){
                      controller.selectedCategory.value = value;
                      controller.getMediaImages();
                    }
                  }),
                ],
              ),

              if (allowSelection) buildAddSelectedImagesButton(),
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),

          Obx(
            () {
              List<ImageModel> images = _getSelectedFolderImages(controller);

              if (!loadingPreviousImages){
                if (alreadySelectedImageUrls != null && alreadySelectedImageUrls!.isNotEmpty) {
                final selectedUrlSet = Set<String>.from(alreadySelectedImageUrls!);
                for (var image in images) {
                  image.isSelected.value = selectedUrlSet.contains(image.url);
                  if (image.isSelected.value) {
                    selectedImages.add(image);
                  }
                }
                } else {
                  for (var image in images) {
                    image.isSelected.value = false;
                  }
                }
                loadingPreviousImages = true;
              } 

              if (controller.loading.value && images.isEmpty) {
                return const CustomLoaderAnimation();
              }

              if (controller.selectedCategory.value == MediaCategory.folders) {
                return _buildSelectFolderAnimationWidget(context);
              }

              if (images.isEmpty) {
                return _buildEmptyAnimationWidget(context);
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: CustomSizes.spaceBtwItems / 2,
                    runSpacing: CustomSizes.spaceBtwItems / 2,
                    children: images.map((image) => GestureDetector(
                      onTap: () => Get.dialog(ImagePopup(image: image)),
                      child: SizedBox(
                        width: 140,
                        height: 180,
                        child: Column(
                          children: [
                            allowSelection ? _buildListImageWithCheckbox(image) :_buildSimpleListImage(image),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: CustomSizes.sm),
                                child: Text(image.filename, maxLines: 1, overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ),
                    )).toList(),
                  ),            

                // Load more media button
                if (!controller.loading.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: CustomSizes.buttonWidth,
                          child: ElevatedButton.icon(
                            onPressed: () => controller.loadMoreImages(),
                            icon: const Icon(Iconsax.arrow_down),
                            label: const Text(CustomTextStrings.loadMore),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),

          
        ],
      ),
    );
  }
  
  List<ImageModel> _getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];

    if (controller.selectedCategory.value == MediaCategory.banners) {
      images = controller.allBannerImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedCategory.value == MediaCategory.products) {
      images = controller.allProductImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedCategory.value == MediaCategory.brands) {
      images = controller.allBrandImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedCategory.value == MediaCategory.categories) {
      images = controller.allCategoryImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedCategory.value == MediaCategory.users) {
      images = controller.allUserImages.where((image) => image.url.isNotEmpty).toList();
    }

    return images;
  }
  
  Widget _buildEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
      child: CustomAnimationLoaderWidget(
        width: 300,
        height: 300,
        text: CustomTextStrings.folderIsEmpty,
        animation: CustomImages.emptyPackage,
        showAction: false,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
  
  _buildSimpleListImage(ImageModel image) {
    return CustomRoundedImage(
      isNetworkImage: true,
      imageType: ImageType.network,
      image:image.url,
      height: 140,
      width: 140,
      fit: BoxFit.cover,
    );
  }

  _buildListImageWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        CustomRoundedImage(
          isNetworkImage: true,
          imageType: ImageType.network,
          image:image.url,
          height: 140,
          width: 140,
          fit: BoxFit.cover,
          padding: CustomSizes.sm,
          margin: CustomSizes.spaceBtwItems / 2,
        ),
        Positioned(
          top: CustomSizes.md,
          right: CustomSizes.md,
          child: Obx(
            () => Checkbox(
              value: image.isSelected.value,
              onChanged: (value) {
                if (value != null) {
                  image.isSelected.value = value;
                  if (value) {
                    if(!allMultipleSelection){
                      for (var img in selectedImages) {
                        if (img != image) {
                          img.isSelected.value = false;
                        } 
                      }
                      selectedImages.clear();
                    }
                    selectedImages.add(image);
                  } else {
                    selectedImages.remove(image);
                  }
                }
              }
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildSelectFolderAnimationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
      child: CustomAnimationLoaderWidget(
        width: 300,
        height: 300,
        text: CustomTextStrings.selectFolder,
        animation: CustomImages.emptyPackage,
        showAction: false,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
  
  Widget buildAddSelectedImagesButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(onPressed: () => Get.back(), label: const Text(CustomTextStrings.close), icon: const Icon(Iconsax.close_circle)),
        ), 
        const SizedBox(width: CustomSizes.spaceBtwItems),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
            onPressed: () => Get.back(result: selectedImages),
            label: const Text('Add'),
            icon: const Icon(Iconsax.image),
          ),
        ),
      ],
    );
  }
}