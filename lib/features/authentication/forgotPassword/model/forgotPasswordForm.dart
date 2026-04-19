import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper_admin/common/widgets/layout/button/appElevatedButton.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          "Forgot Password",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        Text(
          "Please enter your email address to reset your password.",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 48),

        // Email Field
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Iconsax.direct_right),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        const SizedBox(height: 24),

        const SizedBox(height: 32),

        // Login Button
        AppElevatedButton(text: "Reset Password", onPressed: () {}),
      ],
    );
  }
}
