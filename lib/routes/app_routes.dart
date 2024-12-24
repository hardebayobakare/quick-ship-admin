import 'package:get/get.dart';
import 'package:quick_shop_admin/features/authentication/screens/forget_password/forget_password.dart';
import 'package:quick_shop_admin/features/authentication/screens/login/login.dart';
import 'package:quick_shop_admin/features/authentication/screens/reset_password/reset_password.dart';
import 'package:quick_shop_admin/features/banners/screens/all_banners/banners.dart';
import 'package:quick_shop_admin/features/banners/screens/create_banners/create_banner.dart';
import 'package:quick_shop_admin/features/banners/screens/edit_banners/edit_banner.dart';
import 'package:quick_shop_admin/features/brands/screens/all_brands/brand.dart';
import 'package:quick_shop_admin/features/brands/screens/create_brands/create_brand.dart';
import 'package:quick_shop_admin/features/brands/screens/edit_brands/edit_brand.dart';
import 'package:quick_shop_admin/features/categories/screens/all_categories/categories.dart';
import 'package:quick_shop_admin/features/categories/screens/create_category/create_category.dart';
import 'package:quick_shop_admin/features/categories/screens/edit_category/edit_category.dart';
import 'package:quick_shop_admin/features/dashboard/screens/dashboard.dart';
import 'package:quick_shop_admin/features/media/screens/media.dart';
import 'package:quick_shop_admin/features/products/screens/all_products/products.dart';
import 'package:quick_shop_admin/features/products/screens/create_products/create_product.dart';
import 'package:quick_shop_admin/features/products/screens/edit_products/edit_product.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/routes/route_middleware.dart';

class CustomAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: CustomRoutes.login, page: () => const LoginScreen()),
    GetPage(name: CustomRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: CustomRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: CustomRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.media, page: () => const MediaScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.banners, page: () => const BannersScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.products, page: () => const ProductsScreen(), middlewares: [CustomRouteMiddleware()]),
    
    // Categories
    GetPage(name: CustomRoutes.categories, page: () => const CategoriesScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.createCategory, page: () => const CreateCategoryScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.editCategory, page: () => const EditCategoryScreen(), middlewares: [CustomRouteMiddleware()]),

    // Brands
    GetPage(name: CustomRoutes.brands, page: () => const BrandScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.createBrand, page: () => const CreateBrandScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.editBrand, page: () => const EditBrandScreen(), middlewares: [CustomRouteMiddleware()]),

    // Banners
    GetPage(name: CustomRoutes.banners, page: () => const BannersScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.editBanner, page: () => const EditBannerScreen(), middlewares: [CustomRouteMiddleware()]),

    // Produts
    GetPage(name: CustomRoutes.banners, page: () => const ProductsScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [CustomRouteMiddleware()]),
    GetPage(name: CustomRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [CustomRouteMiddleware()]),


  ];
}