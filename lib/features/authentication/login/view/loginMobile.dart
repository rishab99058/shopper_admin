import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/authenticationScreen/mobile.dart';
import 'package:shopper_admin/features/authentication/login/model/loginForm.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthenticationMobile(widget: LoginForm()));
  }
}
