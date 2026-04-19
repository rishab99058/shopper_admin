import 'package:get/get.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';
import 'package:shopper_admin/utils/helpers/appDeviceHelper.dart';

class SideBarController extends GetxController {
  final activeItem = AppRoutes.home.obs;
  final hoverItem = "".obs;

  void updateActiveItem(String item) => activeItem.value = item;
  void updateHoverItem(String item) {
    if (item != activeItem.value) {
      hoverItem.value = item;
    }
  }

  bool isHovering(String item) => hoverItem.value == item;
  bool isActive(String item) => activeItem.value == item;

  void mennuOnTap(String route) {
    if (AppDeviceHelper.isMobileScreen(Get.context!) ||
        AppDeviceHelper.isTabletScreen(Get.context!)) {
      Get.back();
    }

    if (!isActive(route)) {
      updateActiveItem(route);
      Get.toNamed(route);
    }
  }
}
