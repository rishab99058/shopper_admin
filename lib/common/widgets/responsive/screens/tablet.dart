import 'package:flutter/material.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key, this.body});

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
