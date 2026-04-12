import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/container/appBox.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Drawer()),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              AppBox(
                child: Container(),
                onTap: () {},
                width: double.infinity,
                height: 75,
                backgroundColor: Colors.blue.withValues(alpha: 0.2),
              ),
              Expanded(child: widget ?? Container()),
            ],
          ),
        ),
      ],
    );
  }
}
