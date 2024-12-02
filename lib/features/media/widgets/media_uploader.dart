import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/widgets/folder_dowpdown.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';

class CustomMediaUploader extends StatelessWidget {
  const CustomMediaUploader({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImageUploaderSection.value 
        ? Column(
            children: [
              // Drag and Drop Area
              CustomRoundedContainer(
                height: 200,
                showborder: true,
                borderColor: CustomColors.borderPrimary,
                backgroundColor: CustomColors.primaryBackground,
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          DropzoneView(
                            mime: const ['image/jpeg', 'image/png', 'image/jpg'],
                            cursor: CursorType.Default,
                            operation: DragOperation.copy,
                            onLoaded: () => print('Zone loaded'),
                            onError: (error) => print('Zone error: $error'),
                            onHover: () => print('Zone hover'),
                            onLeave: () => print('Zone leave'),
                            onCreated: (ctrl) => controller.dropzoneViewController = ctrl,
                            onDropFile: (file) {},
                            onDropInvalid: (value) => print('Invalid file: $value'),
                            onDropFiles: (value) => print('Multiple files: $value'),
                          ),
        
                          Column(
                            children: [
                              Image.asset(CustomImages.defaultMultipleImageIcon, width: 50, height: 50),
                              const SizedBox(height: CustomSizes.spaceBtwItems),
                              const Text(CustomTextStrings.dragAndDropImages),
                              const SizedBox(height: CustomSizes.spaceBtwItems),
                              OutlinedButton(onPressed: () {}, child: const Text(CustomTextStrings.selectImages))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
          
              const SizedBox(height: CustomSizes.spaceBtwItems),
          
              // Locally selected Images
              CustomRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Folders DropDown
                        Row(
                          children: [
                            Text(CustomTextStrings.selectFolder, style: Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: CustomSizes.spaceBtwItems),
                            CustomMediaFoldersDropDown(onChanged: (MediaCategory? value) {
                              if(value != null){
                                controller.selectedCategory.value = value;
                              }
                            }),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(onPressed: () {}, child: const Text(CustomTextStrings.removeAll)),
                            const SizedBox(width: CustomSizes.spaceBtwItems),
                            DeviceUtils.isMobileScreen(context) 
                              ? const SizedBox.shrink() 
                              : SizedBox(
                                  width: CustomSizes.buttonWidth,
                                  child: ElevatedButton(
                                    onPressed: () {}, 
                                    child: const Text(CustomTextStrings.upload),
                                  ),
                                )
                            
                          ],
                        ),
                        
                      ],
                    ),
          
                    const SizedBox(height: CustomSizes.spaceBtwSections),
          
                    const Wrap(
                      alignment: WrapAlignment.start,
                      spacing: CustomSizes.spaceBtwItems / 2,
                      runSpacing: CustomSizes.spaceBtwItems / 2,
                      children: [
                        CustomRoundedImage(
                          width: 90,
                          height: 90,
                          padding: CustomSizes.sm,
                          imageType: ImageType.asset,
                          image: CustomImages.shoeIcon,
                          backgroundColor: CustomColors.primaryBackground,
                        ),
                        CustomRoundedImage(
                          width: 90,
                          height: 90,
                          padding: CustomSizes.sm,
                          imageType: ImageType.asset,
                          image: CustomImages.toyIcon,
                          backgroundColor: CustomColors.primaryBackground,
                        ),
                        CustomRoundedImage(
                          width: 90,
                          height: 90,
                          padding: CustomSizes.sm,
                          imageType: ImageType.asset,
                          image: CustomImages.electronicsIcon,
                          backgroundColor: CustomColors.primaryBackground,
                        ),
                        CustomRoundedImage(
                          width: 90,
                          height: 90,
                          padding: CustomSizes.sm,
                          imageType: ImageType.asset,
                          image: CustomImages.furnitureIcon,
                          backgroundColor: CustomColors.primaryBackground,
                        ),
                        CustomRoundedImage(
                          width: 90,
                          height: 90,
                          padding: CustomSizes.sm,
                          imageType: ImageType.asset,
                          image: CustomImages.clothIcon,
                          backgroundColor: CustomColors.primaryBackground,
                        ),
                      ],
                    ),
          
                    const SizedBox(height: CustomSizes.spaceBtwSections),
                    DeviceUtils.isMobileScreen(context) 
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: const Text(CustomTextStrings.upload),
                          ),
                        )
                      : const SizedBox.shrink()
                  ],
                ),
              )
            ],
          )
        : const SizedBox.shrink(),
    );
  }
}