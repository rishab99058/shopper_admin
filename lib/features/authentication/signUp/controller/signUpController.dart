import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/model/authModel/userModel.dart';
import 'package:shopper_admin/repository/authentication/authenticationRepository.dart';
import 'package:shopper_admin/repository/user/userRepository.dart';
import 'package:shopper_admin/utils/constants/images.dart';
import 'package:shopper_admin/utils/constants/text.dart';
import 'package:shopper_admin/utils/popups/fullScreenLoader.dart';
import 'package:shopper_admin/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  final RxBool hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();

  final _auth = AuthenticationRepository.instance;
  final _user = Get.put(UserRepository());

  void togglePasswordVisibility() => hidePassword.toggle();

  Future<void> registerUser() async {
    try {
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }
      AppFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        AppImages.docerAnimation,
      );

      final userCredential = await _auth.signUpWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      final user = userCredential.user;

      final userModel = UserModel(
        id: user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phone: phoneNumber.text.trim(),
        userName: userName.text.trim(),
        profilePicture: '',
        role: AppTexts.roleAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _user.saveUserRecord(userModel);

      AppFullScreenLoader.stopLoading();

      _auth.screenRedirect();

      AppLoaders.successSnackbar(title: 'Account created successfully');
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
