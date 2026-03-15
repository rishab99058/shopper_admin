import 'package:flutter/material.dart';
import 'package:shopper_admin/constants/sizes.dart';

class AppResponsiveWidget extends StatelessWidget {
  const AppResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= AppSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < AppSizes.desktopScreenSize &&
            constraints.maxWidth >= AppSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
