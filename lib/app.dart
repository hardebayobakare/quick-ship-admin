import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:quick_shop_admin/routes/app_routes.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';
import 'package:quick_shop_admin/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: CustomTextStrings.appName,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      getPages: CustomAppRoutes.pages,
      initialRoute: CustomRoutes.login,
      unknownRoute: GetPage(name: '/page-not-found', page: () => const Scaffold(body: Center(child: Text('Page Not Found')))),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteLayout(
      desktop: Center(child: Text('Desktop')),
      tablet: Center(child: Text('Tablet')),
      mobile: Center(child: Text('Mobile')),
    );
  }
}