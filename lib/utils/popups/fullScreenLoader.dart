import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/common/widgets/loaders/animationLoaderWidget.dart';
import 'package:shopper_admin/utils/constants/colors.dart';

/// A utility class for managing a full-screen loading dialog.
class AppFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// The dialog can't be dismissed by tapping outside it.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: Theme.of(Get.context!).brightness == Brightness.dark
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100), // Adjust the spacing as needed
                AppAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static void stopLoading() {
    Navigator.of(
      Get.overlayContext!,
    ).pop(); // Close the dialog using the Navigator
  }
}
