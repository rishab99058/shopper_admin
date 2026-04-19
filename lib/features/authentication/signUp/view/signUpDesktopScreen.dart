import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/authenticationScreen/laptopTablet.dart';
import 'package:shopper_admin/features/authentication/signUp/model/signUp.dart';

class SignUpDesktop extends StatelessWidget {
  const SignUpDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationDesktopLaptop(
        imageUrl:
            "https://res.cloudinary.com/dws1oujlk/image/upload/v1776102472/3d-rendering-cartoon-shopping-cart_kty1je.png",
        title: "",
        widget: SignUpForm(),
      ),
    );
  }
}
