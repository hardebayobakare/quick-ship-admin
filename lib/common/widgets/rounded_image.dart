import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/loaders/shimmer.dart';


class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    this.overlayColor,
    this.image,
    this.file,
    required this.imageType,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding = CustomSizes.sm,
    this.isNetworkImage = false,
    this.onTap,
    this.borderRadius = CustomSizes.md,
    this.margin,
  });

  final double width, height, padding;
  final String? image;
  final Uint8List? memoryImage;
  final File? file;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? overlayColor;
  final ImageType imageType;
  final double? margin;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin != null ? EdgeInsets.all(margin!) : null,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: _buildImageWidget(),
      )
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
    }

    return ClipRRect(
      borderRadius: applyImageRadius ? BorderRadius.circular(CustomSizes.md) : BorderRadius.zero,
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overlayColor,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) => CustomShimmerEffect(width: width, height: height),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image.memory(
        memoryImage!,
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image.asset(
        image!,
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image.file(
        file!,
        fit: fit,
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }
}