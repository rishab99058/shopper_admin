import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class AppLoaders {
  static void _showCustomSnackBar({
    required String title,
    String message = '',
    required Color color,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(Get.context!).size.width > 450
                ? 400
                : double.infinity,
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: color.withOpacity(0.9),
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.white,
                    size: AppSizes.iconMd,
                  ),
                ),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(Get.context!).textTheme.titleMedium!
                            .apply(color: AppColors.white, fontWeightDelta: 1),
                      ),
                      if (message.isNotEmpty)
                        Text(
                          message,
                          style: Theme.of(
                            Get.context!,
                          ).textTheme.labelLarge!.apply(color: AppColors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static successSnackbar({required title, message = '', duration = 3}) {
    _showCustomSnackBar(
      title: title,
      message: message,
      color: AppColors.success,
      icon: Iconsax.check,
    );
  }

  static warningSnackbar({required title, message = ''}) {
    _showCustomSnackBar(
      title: title,
      message: message,
      color: AppColors.warning,
      icon: Iconsax.warning_2,
    );
  }

  static errorSnackbar({required title, message = ''}) {
    _showCustomSnackBar(
      title: title,
      message: message,
      color: AppColors.error,
      icon: Iconsax.danger,
    );
  }

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(Get.context!).brightness == Brightness.dark
                ? AppColors.darkerGrey.withOpacity(0.9)
                : AppColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }
}
