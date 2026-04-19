import 'package:flutter/material.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

/// A template for rendering responsive design without the persistent app layouts (sidebar, header).
/// Ideal for full screen pages like Login, Sign Up, or Splash screens.
class SiteTemplate extends StatelessWidget {
  const SiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
  });

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppSizes.desktopScreenSize) {
          return desktop ?? tablet ?? mobile ?? const SizedBox();
        } else if (constraints.maxWidth >= AppSizes.tabletScreenSize) {
          return tablet ?? desktop ?? mobile ?? const SizedBox();
        } else {
          return mobile ?? tablet ?? desktop ?? const SizedBox();
        }
      },
    );
  }
}
