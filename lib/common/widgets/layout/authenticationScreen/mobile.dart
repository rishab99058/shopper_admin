import 'package:flutter/material.dart';

class AuthenticationMobile extends StatelessWidget {
  const AuthenticationMobile({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(padding: const EdgeInsets.all(24.0), child: widget),
        ),
      ),
    );
  }
}
