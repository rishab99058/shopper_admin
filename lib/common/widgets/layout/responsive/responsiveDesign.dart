import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/desktop/desktopLayout.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/mobile/mobileLayout.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/tablet/tabletLayout.dart';
import 'package:shopper_admin/constants/sizes.dart';

class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({
    super.key,
    required this.desktopBody,
    required this.mobileBody,
    required this.tabletBody,
    this.needLayout = true,
  });

  final Widget desktopBody;
  final Widget mobileBody;
  final Widget tabletBody;
  final bool needLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= AppSizes.desktopScreenSize) {
            return needLayout
                ? DesktopLayout(
                    widget: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: desktopBody,
                      ),
                    ),
                  )
                : Container();
          } else if (constraints.maxWidth >= AppSizes.tabletScreenSize) {
            return needLayout
                ? TabletLayout(
                    widget: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: tabletBody,
                      ),
                    ),
                  )
                : Container();
          } else {
            return needLayout
                ? MobileLayout(
                    widget: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: mobileBody,
                      ),
                    ),
                  )
                : Container();
          }
        },
      ),
    );
  }
}
