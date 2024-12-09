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
  const CustomMediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meida Images Header
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
          const SizedBox(height: CustomSizes.spaceBtwSections),

          Obx(
            () {
              List<ImageModel> images = _getSelectedFolderImages(controller);

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
                            _buildSimpleListImage(image),
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
}