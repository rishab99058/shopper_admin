import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/desktop/desktopScreen.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/mobile/mobileScreen.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/responsiveDesign.dart';
import 'package:shopper_admin/common/widgets/layout/responsive/tablet/tabletScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopper Admin',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ResponsiveDesign(
        desktopBody: Desktop(),
        mobileBody: Mobile(),
        tabletBody: Tablet(),
      ),
    );
  }
}
