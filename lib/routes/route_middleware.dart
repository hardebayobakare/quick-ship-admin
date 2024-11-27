import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_admin/data/repository/authentication/authentication_repository.dart';
import 'package:quick_shop_admin/routes/route.dart';

class CustomRouteMiddleware extends GetMiddleware{
  
  
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: CustomRoutes.login);
  }
}