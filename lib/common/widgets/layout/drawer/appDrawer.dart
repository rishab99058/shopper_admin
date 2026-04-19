import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/layout/drawer/model/appMenuItem.dart';
import 'package:shopper_admin/routes/AppRoutes.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(right: BorderSide(color: AppColors.grey)),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                    'https://res.cloudinary.com/dws1oujlk/image/upload/v1776000064/9dc66b99-e2d5-46dc-a9d0-2603ad4f94ae.png',
                  ),
                  height: 100,
                  width: 100,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.lg,
                        right: AppSizes.md,
                        top: AppSizes.md,
                        bottom: AppSizes.md,
                      ),
                      child: Text(
                        "MENU",
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                          letterSpacingDelta: 1.2,
                        ),
                      ),
                    ),

                    AppMenuItem(
                      route: AppRoutes.home,
                      icon: Iconsax.status,
                      itemName: "Dashboard",
                    ),

                    SizedBox(height: AppSizes.spaceBtwItems),

                    AppMenuItem(
                      route: AppRoutes.media,
                      icon: Iconsax.image,
                      itemName: "Media",
                    ),

                    SizedBox(height: AppSizes.spaceBtwItems),

                    AppMenuItem(
                      route: AppRoutes.banners,
                      icon: Iconsax.presention_chart,
                      itemName: "Banners",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
