
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';

class AppRoutesMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = true;

    if(isAuthenticated){
      return const RouteSettings(name: AppRoutes.home);
    }
    return null;
  }

}