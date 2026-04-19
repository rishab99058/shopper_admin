import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/appDrawer.dart';
import 'package:shopper_admin/common/widgets/layout/headers/header.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppHeader(),
      body: widget ?? Container(),
    );
  }
}
