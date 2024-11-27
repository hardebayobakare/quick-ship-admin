import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/authentication/authentication_repository.dart';
import 'package:quick_shop_admin/features/personalization/models/user_model.dart';
import 'package:quick_shop_admin/utils/exceptions/exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_admin/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async{
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  Future<UserModel> fetchAdminUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
      return UserModel.fromSnapshot(documentSnapshot);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }
}