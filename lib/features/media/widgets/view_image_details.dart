import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_admin/common/widgets/rounded_container.dart';
import 'package:quick_shop_admin/common/widgets/rounded_image.dart';
import 'package:quick_shop_admin/features/media/controllers/media_controller.dart';
import 'package:quick_shop_admin/features/media/models/image_model.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/device/device_utitlty.dart';
import 'package:quick_shop_admin/utils/popups/loaders.dart';

class ImagePopup extends StatelessWidget {
  final ImageModel image;

  const ImagePopup({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomSizes.borderRadiusLg),
        ),
        child: CustomRoundedContainer(
          width: DeviceUtils.isDesktopScreen(context) ? MediaQuery.of(context).size.width * 0.4 : double.infinity,
          padding: const EdgeInsets.all(CustomSizes.spaceBtwItems),
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    CustomRoundedContainer(
                      backgroundColor: CustomColors.primaryBackground,
                      child: CustomRoundedImage(
                        image: image.url,
                        applyImageRadius: true,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: DeviceUtils.isDesktopScreen(context) ? MediaQuery.of(context).size.width * 0.4 : double.infinity,
                        imageType: ImageType.network,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Iconsax.close_circle),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              Row(
                children: [
                  Expanded(child: Text(CustomTextStrings.imageName, style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(flex: 6, child: Text(image.filename, style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis)),
                ],
              ),

              Row(
                children: [
                  Expanded(child: Text(CustomTextStrings.imageUrl, style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(flex: 6, child: Text(image.url, style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  Expanded(child: OutlinedButton(
                    onPressed: () {
                      FlutterClipboard.copy(image.url).then((value) => CustomLoaders.customToast(message: CustomTextStrings.urlCopied));
                    }, child: const Icon(Iconsax.copy, size: 20),
                  )),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: TextButton(
                      onPressed: () => controller.deleteImageConfirmation(image), 
                      child: const Text(CustomTextStrings.deleteImage, style: TextStyle(color: CustomColors.error))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}