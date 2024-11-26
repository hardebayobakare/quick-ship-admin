import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/routes/route.dart';

class RouteMiddleware extends GetMiddleware{
  
  
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = true;
    return isAuthenticated ? null : const RouteSettings(name: CustomRoutes.login);
  }
}