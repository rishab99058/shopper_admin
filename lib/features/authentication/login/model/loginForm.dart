import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/layout/button/appElevatedButton.dart';
import 'package:shopper_admin/common/widgets/layout/button/appOutlinedButton.dart';
import 'package:shopper_admin/features/authentication/login/controller/loginController.dart';
import 'package:shopper_admin/routes/appRoutes.dart';
import 'package:shopper_admin/utils/validation/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      key: loginController.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(
              "https://res.cloudinary.com/dws1oujlk/image/upload/v1776000064/9dc66b99-e2d5-46dc-a9d0-2603ad4f94ae.png",
            ),
            height: 100,
            width: 100,
          ),
          Text(
            "Welcome Back",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            "Please enter your details to sign in.",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 48),

          // Email Field
          TextFormField(
            controller: loginController.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct_right),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Password Field
          Obx(
            () => TextFormField(
              controller: loginController.password,
              validator: (value) => Validator.validatePassword(value),
              obscureText: loginController.hidePassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(
                    loginController.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                  onPressed: () {
                    loginController.hidePassword.value =
                        !loginController.hidePassword.value;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Remember Me & Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: loginController.rememberMe.value,
                      onChanged: (value) {
                        loginController.rememberMe.value = value!;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const Text("Remember me"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Login Button
          AppElevatedButton(
            text: "Sign In",
            onPressed: () => loginController.signIn(),
          ),

          const SizedBox(height: 32),

          // Login Button
          AppOutlinedButton(
            text: "Create Account",
            onPressed: () => Get.toNamed(AppRoutes.signUp),
          ),
        ],
      ),
    );
  }
}
