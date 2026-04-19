import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper_admin/features/personalization/controller/userController.dart';
import 'package:shopper_admin/repository/authentication/authenticationRepository.dart';
import 'package:shopper_admin/utils/constants/images.dart';
import 'package:shopper_admin/utils/constants/text.dart';
import 'package:shopper_admin/utils/popups/fullScreenLoader.dart';
import 'package:shopper_admin/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = false.obs;

  final userController = UserController.instance;

  final localStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('email') ?? '';
    password.text = localStorage.read('password') ?? '';
  }

  final _authRepo = AuthenticationRepository.instance;
  final loginFormKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        AppImages.docerAnimation,
      );

      if (!loginFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('email', email.text.trim());
        localStorage.write('password', password.text.trim());
      }
      await _authRepo.signInWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      final user = await userController.fetchMyDetails();

      if (user.role != AppTexts.roleAdmin) {
        AppFullScreenLoader.stopLoading();
        AppLoaders.errorSnackbar(
          title: 'Error',
          message: 'You are not authorized to login as admin',
        );
        return;
      }

      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

      AppLoaders.successSnackbar(
        title: 'Success',
        message: 'Login successful!',
      );
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
