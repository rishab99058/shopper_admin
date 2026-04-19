import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/controller/sidebarController.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class AppMenuItem extends StatelessWidget {
  const AppMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SideBarController());
    return InkWell(
      onTap: () => controller.mennuOnTap(route),
      onHover: (value) => value
          ? controller.updateHoverItem(route)
          : controller.updateHoverItem(""),

      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: controller.isActive(route)
                ? AppColors.primary.withAlpha(50)
                : controller.isHovering(route)
                ? AppColors.warning.withAlpha(50)
                : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.lg,
                  right: AppSizes.md,
                  top: AppSizes.md,
                  bottom: AppSizes.md,
                ),
                child: Icon(icon, color: AppColors.black),
              ),

              Text(
                itemName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.apply(color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
