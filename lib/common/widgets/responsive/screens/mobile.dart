import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: body ?? Container(),
    );
  }
}
