import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_shop_admin/data/repository/authentication/authentication_repository.dart';
import 'package:quick_shop_admin/data/repository/user/user_repository.dart';
import 'package:quick_shop_admin/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_admin/features/personalization/models/user_model.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/constants/image_strings.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/helpers/network_manager.dart';
import 'package:quick_shop_admin/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_admin/utils/popups/loaders.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    if (localStorage.read('REMEMBER_ME') != null) {
      if (localStorage.read('REMEMBER_ME') == true) {
        rememberMe.value = localStorage.read('REMEMBER_ME');
        email.text = localStorage.read('REMEMBER_ME_EMAIL');
        password.text = localStorage.read('REMEMBER_ME_PASSWORD');
      }
    }
  }


  Future<void> emailAndPasswordLogin() async {
    try {
      // Start loading dialog
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.signingIn, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate form
      if (!loginFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // If remember me
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME', true);
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        if (localStorage.read('REMEMBER_ME') != null) {
          localStorage.remove('REMEMBER_ME');
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }
      }

      // Sign in
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      final user = await UserController.instance.fetchUserDetails();

      // Close loading dialog
      CustomFullScreenLoader.closeLoadingDialog();

      if (user.role == AppRole.admin) {
        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      } else {
        await AuthenticationRepository.instance.signOut();
        CustomLoaders.errorSnackBar(title: CustomTextStrings.notAuthorized, message: CustomTextStrings.notAdmin);
      }


    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  Future<void> registerAdmin() async {
    // Start loading dialog
    try {
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.registeringAdmin, CustomImages.dataProcess);
      
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }
  
      // Register Admin
      await AuthenticationRepository.instance.registerWithEmailAndPassword(CustomTextStrings.adminEmail, CustomTextStrings.adminPassword);
      
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(
        UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          email: CustomTextStrings.adminEmail,
          firstName: 'Admin',
          lastName: 'Admin',
          role: AppRole.admin,
          createdAt: DateTime.now(),
        )
      );
      
      // Close loading dialog
      CustomFullScreenLoader.closeLoadingDialog();
      
      // Show success message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.adminRegisterd);
      
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }

  }

}