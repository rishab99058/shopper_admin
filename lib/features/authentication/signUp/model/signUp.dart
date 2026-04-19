import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/layout/button/appElevatedButton.dart';
import 'package:shopper_admin/common/widgets/layout/button/appOutlinedButton.dart';
import 'package:shopper_admin/features/authentication/signUp/controller/signUpController.dart';
import 'package:shopper_admin/routes/appRoutes.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';
import 'package:shopper_admin/utils/validation/validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
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
            "Create Account",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            "Please enter your details to register.",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 48),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      Validator.validateEmptyText(value, "First Name"),
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      Validator.validateEmptyText(value, "Last Name"),
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Email Field
          TextFormField(
            controller: controller.email,

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

          TextFormField(
            controller: controller.phoneNumber,

            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Iconsax.call),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Password Field
          Obx(
            () => TextFormField(
              controller: controller.password,

              validator: (value) => Validator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                  onPressed: () {
                    controller.hidePassword.toggle();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),

          // Remember Me & Forgot Password
          const SizedBox(height: 32),

          // Login Button
          AppElevatedButton(
            text: "Create Account",
            onPressed: controller.registerUser,
          ),

          const SizedBox(height: 32),

          // Login Button
          AppOutlinedButton(
            text: "Back to Login",
            onPressed: () => Get.toNamed(AppRoutes.login),
          ),
        ],
      ),
    );
  }
}
