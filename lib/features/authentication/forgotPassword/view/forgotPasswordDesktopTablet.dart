import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/authenticationScreen/laptopTablet.dart';
import 'package:shopper_admin/features/authentication/forgotPassword/model/forgotPasswordForm.dart';

class ForgotPasswordDesktopTablet extends StatelessWidget {
  const ForgotPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationDesktopLaptop(
        imageUrl:
            "https://res.cloudinary.com/dws1oujlk/image/upload/v1776108473/thinking-young-caucasian-woman-standing-isolated_dvsmv8.jpg",
        title: "",
        widget: ForgotPasswordForm(),
      ),
    );
  }
}
