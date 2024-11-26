import 'package:get/get.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/login.dart';
import 'package:quick_shop_admin/routes/route.dart';

class CustomAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: CustomRoutes.login, page: () => const LoginScreen()),
    // GetPage(name: CustomRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    // GetPage(name: CustomRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    // GetPage(name: CustomRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [CustomRouteMiddleware()]),
    // GetPage(name: CustomRoutes.media, page: () => const MediaScreen()),

    // Produts
    // GetPage(name: CustomRoutes.banners, page: () => const ProductsScreen()),


  ];
}