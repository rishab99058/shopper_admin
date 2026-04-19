import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/repository/authentication/authenticationRepository.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';

class RouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authRepo = AuthenticationRepository.instance;
    if (!authRepo.isAuthenticated) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
