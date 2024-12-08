import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/utils/formatters/formatter.dart';
import 'package:universal_html/html.dart';

class ImageModel {
  String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  String mediaCategory;
  final String filename;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;


  final Uint8List? localImageToDisplay;
  RxBool isSelected = false.obs;
  final File? file;

  ImageModel({
    this.id = '',
    required this.url,
    required this.folder,
    required this.filename,
    this.sizeBytes,
    this.mediaCategory = '',
    this.fullPath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    
    this.localImageToDisplay,
    this.file,
  });

  static ImageModel empty() => ImageModel(url: '', folder: '', filename: '');

  String get createdAtFormatted => CustomFormatter.formatDate(createdAt);

  String get updatedAtFormatted => CustomFormatter.formatDate(updatedAt);

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'folder': folder,
    'sizeBytes': sizeBytes,
    'mediaCategory': mediaCategory,
    'filename': filename,
    'fullPath': fullPath,
    'createdAt': createdAt?.toUtc(),
    'contentType': contentType,
  };

  factory ImageModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return ImageModel(
        id: document.id,
        url: data['url'] ?? '',
        folder: data['folder'] ?? '',
        sizeBytes: data['sizeBytes'] ?? 0,
        mediaCategory: data['mediaCategory'] ?? '',
        filename: data['filename'] ?? '',
        fullPath: data['fullPath'] ?? '',
        createdAt: data.containsKey('createdAt') ? data['createdAt']?.toDate() : null,
        updatedAt: data.containsKey('updatedAt') ? data['updatedAt']?.toDate() : null,
        contentType: data['contentType'] ?? '',
      );
    } else {
      return ImageModel.empty();
    }
  }

  factory ImageModel.fromFirebaseMetadata(FullMetadata metadata, String folder, String filename, String downloadUrl) {
    return ImageModel(
      url: downloadUrl,
      folder: folder,
      filename: filename,
      sizeBytes: metadata.size,
      mediaCategory: folder,
      fullPath: metadata.fullPath,
      createdAt: metadata.timeCreated,
      updatedAt: metadata.updated,
      contentType: metadata.contentType,
    );
  }
}