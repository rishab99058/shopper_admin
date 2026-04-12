import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/container/appBox.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    /* 
       MOBILE BEST PRACTICE:
       On mobile, we usually don't use 'Expanded' inside a ScrollView. 
       Instead, we give items a fixed height and let them stack naturally.
       This prevents layout crashes and provides a better scrolling experience.
    */
    return Column(
      children: [
        AppBox(
          child: const Center(child: Text("BOX 1")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.blue.withAlpha(50),
        ),
        const SizedBox(height: 20),
        AppBox(
          child: const Center(child: Text("BOX 2")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.orange.withAlpha(50),
        ),
        const SizedBox(height: 20),
        AppBox(
          child: const Center(child: Text("BOX 3")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.red.withAlpha(50),
        ),
        const SizedBox(height: 20),
        AppBox(
          child: const Center(child: Text("BOX 4")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.green.withAlpha(50),
        ),
        const SizedBox(height: 20),
        AppBox(
          child: const Center(child: Text("BOX 5")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.red.withAlpha(30),
        ),
        const SizedBox(height: 20),
        AppBox(
          child: const Center(child: Text("BOX 6")),
          onTap: () {},
          width: double.infinity,
          height: 200,
          backgroundColor: Colors.red.withAlpha(30),
        ),
      ],
    );
  }
}
