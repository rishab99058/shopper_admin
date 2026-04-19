import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/features/personnalization/controller/userController.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';
import 'package:shopper_admin/utils/helpers/appDeviceHelper.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.black),
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: AppColors.grey, height: 1),
      ),
      leading: AppDeviceHelper.isDesktopScreen(context)
          ? null
          : Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Iconsax.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
      centerTitle: false,
      title: AppDeviceHelper.isDesktopScreen(context)
          ? SizedBox(
              width: 400,
              child: TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Iconsax.search_normal),
                  hintText: "Search....",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            )
          : null,

      actions: [
        if (!AppDeviceHelper.isDesktopScreen(context))
          IconButton(icon: const Icon(Iconsax.search_normal), onPressed: () {}),
        IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Obx(() {
          final user = userController.user.value;
          return Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  user.profilePicture.isNotEmpty
                      ? user.profilePicture
                      : "https://res.cloudinary.com/dws1oujlk/image/upload/v1775892229/man_fxjywz.png",
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              if (AppDeviceHelper.isDesktopScreen(context))
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hii ${user.firstName} ${user.lastName}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
            ],
          );
        }),
        const SizedBox(width: AppSizes.spaceBtwItems),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppDeviceHelper.getAppBarHeight() + 1);
}
