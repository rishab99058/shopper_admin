import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/appDrawer.dart';
import 'package:shopper_admin/common/widgets/layout/headers/header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(flex: 1, child: AppDrawer()),
          Expanded(
            flex: 3,
            child: Scaffold(
              appBar: const AppHeader(),
              body: widget ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}
