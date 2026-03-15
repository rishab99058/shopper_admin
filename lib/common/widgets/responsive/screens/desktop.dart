import 'package:flutter/material.dart';
import 'package:shopper_admin/widgets/roundedContainer/roundedContainer.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Drawer()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                AppRoundedContainer(
                  width: double.infinity,
                  height: 100,
                  backgroundColor: Colors.blue.withValues(alpha: 0.2),
                  child: const Center(child: Text("Box 1")),
                ),

                body ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
