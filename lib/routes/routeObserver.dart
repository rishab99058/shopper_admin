import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/controller/sidebarController.dart';

class RouteObservers extends GetObserver {
  /// Helper to safely update the sidebar active item
  void _updateSidebar(String? routeName) {
    if (routeName != null && routeName.isNotEmpty) {
      try {
        final sidebarController = Get.find<SideBarController>();
        sidebarController.updateActiveItem(routeName);
      } catch (e) {
        // Controller might not be initialized yet
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _updateSidebar(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      _updateSidebar(previousRoute.settings.name);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _updateSidebar(newRoute.settings.name);
    }
  }
}
