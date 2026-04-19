import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/authenticationScreen/mobile.dart';
import 'package:shopper_admin/features/authentication/signUp/model/signUp.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthenticationMobile(widget: SignUpForm()));
  }
}
