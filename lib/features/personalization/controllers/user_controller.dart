import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/user/user_repository.dart';
import 'package:quick_shop_admin/features/personalization/models/user_model.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = UserRepository.instance;
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final user = await  userRepository.fetchAdminUserDetails();
      this.user.value = user;
      isLoading.value = false;
      return user;
    } catch (e) {
      isLoading.value = false;
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return UserModel.empty();
    }
  }

}