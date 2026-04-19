import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/bindings/generalBindings.dart';
import 'package:shopper_admin/routes/AppPages.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';
import 'package:shopper_admin/routes/routeObserver.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopper Admin',
      theme: ThemeData(primarySwatch: Colors.blue),

      // 1. Define the starting route
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      initialBinding: GeneralBindings(),

      // Sync browser history with Sidebar Controller using custom RouteObserver
      navigatorObservers: [RouteObservers()],

      unknownRoute: GetPage(
        name: AppRoutes.home,
        page: () => Container(child: Text("404")),
      ),

      // 2. Map named routes to their respective screens
    );
  }
}
