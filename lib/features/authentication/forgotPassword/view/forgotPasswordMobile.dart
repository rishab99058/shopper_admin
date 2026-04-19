import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/authenticationScreen/mobile.dart';
import 'package:shopper_admin/features/authentication/forgotPassword/model/forgotPasswordForm.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthenticationMobile(widget: ForgotPasswordForm()));
  }
}
