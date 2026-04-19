import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/appDrawer.dart';
import 'package:shopper_admin/common/widgets/layout/headers/header.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: const AppHeader(),
      body: widget ?? Container(),
    );
  }
}
