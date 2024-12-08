import 'dart:typed_data';
import 'package:universal_html/html.dart' as html;

import 'package:quick_shop_admin/features/media/models/image_model.dart';
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
                            onDropFile: (file) async {
                              final bytes = await controller.dropzoneViewController.getFileData(file);
                              final String fileName = await controller.dropzoneViewController.getFilename(file);
                              final String mimeType = await controller.dropzoneViewController.getFileMIME(file);
                              html.File htmlFile = html.File([bytes], fileName, {'type': mimeType});
                              final image = ImageModel(
                                url: '',
                                file: htmlFile,
                                folder: '',
                                filename: file.name,
                                localImageToDisplay: Uint8List.fromList(bytes)
                              );
                              controller.selectedImagesToUpload.add(image);

                            },
                            onDropInvalid: (value) => print('Invalid file: $value'),
                            onDropFiles: (value) => print('Files $value'),
                          ),
        
                          Column(
                            children: [
                              Image.asset(CustomImages.defaultMultipleImageIcon, width: 50, height: 50),
                              const SizedBox(height: CustomSizes.spaceBtwItems),
                              const Text(CustomTextStrings.dragAndDropImages),
                              const SizedBox(height: CustomSizes.spaceBtwItems),
                              OutlinedButton(onPressed: () => controller.selectLocalImages(), child: const Text(CustomTextStrings.selectImages))
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
              if (controller.selectedImagesToUpload.isNotEmpty)
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
                              TextButton(onPressed: () => controller.selectedImagesToUpload.clear(), child: const Text(CustomTextStrings.removeAll)),
                              const SizedBox(width: CustomSizes.spaceBtwItems),
                              DeviceUtils.isMobileScreen(context) 
                                ? const SizedBox.shrink() 
                                : SizedBox(
                                    width: CustomSizes.buttonWidth,
                                    child: ElevatedButton(
                                      onPressed: () => controller.uploadImagesConfirmation(), 
                                      child: const Text(CustomTextStrings.upload),
                                    ),
                                  )
                              
                            ],
                          ),
                          
                        ],
                      ),
            
                      const SizedBox(height: CustomSizes.spaceBtwSections),
            
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: CustomSizes.spaceBtwItems / 2,
                        runSpacing: CustomSizes.spaceBtwItems / 2,
                        children: controller.selectedImagesToUpload.where((image) => image.localImageToDisplay != null).map((image) {
                          return CustomRoundedImage(
                            memoryImage: image.localImageToDisplay,
                            imageType: ImageType.memory,
                            width: 90,
                            height: 90,
                            padding: CustomSizes.sm,
                            backgroundColor: CustomColors.primaryBackground,
                            onTap: () {},
                          );
                        }).toList(),
                      ),
            
                      const SizedBox(height: CustomSizes.spaceBtwSections),
                      DeviceUtils.isMobileScreen(context) 
                        ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller.uploadImagesConfirmation(), 
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