import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/features/media/models/image_model.dart';
import 'package:quick_shop_admin/utils/exceptions/exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/platform_exceptions.dart';
import 'package:universal_html/html.dart' as html;

class MediaRepository extends GetxController{
  static MediaRepository get instance => Get.find();

  final FirebaseStorage _storage = FirebaseStorage.instance;


  Future<ImageModel> uploadImageFileInStrage({
    required html.File file,
    required String folder,
    required String imageName,
  }) async {
    try {
      final Reference ref = _storage.ref('$folder/$imageName');

      await ref.putBlob(file);

      final String downloadUrl = await ref.getDownloadURL();

      final FullMetadata metadata = await ref.getMetadata();

      return ImageModel.fromFirebaseMetadata(metadata, folder, imageName, downloadUrl);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on SocketException catch (e) {
      throw CustomFormatException(e.toString());
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }


  Future<String> uploadImageFileInDatabase(ImageModel image) async {
    try {
      final data = await FirebaseFirestore.instance.collection('Images').add(image.toJson());
      return data.id;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on SocketException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }
}