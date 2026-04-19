import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/desktop/desktopScreen.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/mobile/mobileScreen.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/responsiveDesign.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/tablet/tabletScreen.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/siteTemplate.dart';
import 'package:shopper_admin/features/authentication/forgotPassword/view/forgotPasswordDesktopTablet.dart';
import 'package:shopper_admin/features/authentication/forgotPassword/view/forgotPasswordMobile.dart';
import 'package:shopper_admin/features/authentication/login/view/loginDesktopTablet.dart';
import 'package:shopper_admin/features/authentication/login/view/loginMobile.dart';
import 'package:shopper_admin/features/authentication/signUp/view/signUpDesktopScreen.dart';
import 'package:shopper_admin/features/authentication/signUp/view/signUpMobileScreen.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';
import 'package:shopper_admin/routes/routesMiddleware.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const ResponsiveDesign(
        desktopBody: Desktop(),
        mobileBody: Mobile(),
        tabletBody: Tablet(),
      ),
      middlewares: [RouteMiddleware()],
    ),

    GetPage(
      name: AppRoutes.media,
      page: () => ResponsiveDesign(
        desktopBody: Container(child: const Text("Media Desktop")),
        mobileBody: Container(child: const Text("Media Mobile")),
        tabletBody: Container(child: const Text("Media Tablet")),
      ),
      middlewares: [RouteMiddleware()],
    ),

    GetPage(
      name: AppRoutes.banners,
      page: () => ResponsiveDesign(
        desktopBody: Container(child: const Text("Banners Desktop")),
        mobileBody: Container(child: const Text("Banners Mobile")),
        tabletBody: Container(child: const Text("Banners Tablet")),
      ),
      middlewares: [RouteMiddleware()],
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const SiteTemplate(
        desktop: LoginDesktopTablet(),
        mobile: LoginMobile(),
        tablet: LoginMobile(),
      ),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const SiteTemplate(
        desktop: ForgotPasswordDesktopTablet(),
        mobile: ForgotPasswordMobile(),
        tablet: ForgotPasswordMobile(),
      ),
    ),

    GetPage(
      name: AppRoutes.signUp,
      page: () => const SiteTemplate(
        desktop: SignUpDesktop(),
        mobile: SignUpMobile(),
        tablet: SignUpMobile(),
      ),
    ),
  ];
}
