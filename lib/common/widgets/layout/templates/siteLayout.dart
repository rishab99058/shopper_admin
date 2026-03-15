import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/responsive/responsiveDesign.dart';
import 'package:shopper_admin/common/widgets/responsive/screens/desktop.dart';
import 'package:shopper_admin/common/widgets/responsive/screens/mobile.dart';
import 'package:shopper_admin/common/widgets/responsive/screens/tablet.dart';

class AppSiteLayout extends StatelessWidget {
  const AppSiteLayout({super.key, this.desktop, this.tablet, this.mobile});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppResponsiveWidget(
        desktop: desktop ?? DesktopView(),
        tablet: tablet ?? TabletView(),
        mobile: mobile ?? MobileView(),
      ),
    );
  }
}
