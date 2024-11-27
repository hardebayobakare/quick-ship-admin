import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/user/user_repository.dart';
import 'package:quick_shop_admin/features/personalization/models/user_model.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = UserRepository.instance;

  Future<UserModel> fetchUserDetails() async {
    try {
      final user = await  userRepository.fetchAdminUserDetails();
      return user;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return UserModel.empty();
    }
  }

}