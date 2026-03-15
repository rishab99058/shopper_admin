import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_admin/widgets/roundedContainer/roundedContainer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopper Admin',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResponsiveDesignScreen(),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1300) {
                return Desktop();
              } else {
                return const Center(child: Text("Mobile"));
              }
            },
          ),
        ),
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppRoundedContainer(
            height: 450,
            width: 200,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
            child: const Center(child: Text("Box 1")),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: AppRoundedContainer(
            height: 450,
            width: 200,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
            child: const Center(child: Text("Box 2")),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: AppRoundedContainer(
            height: 450,
            width: 200,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
            child: const Center(child: Text("Box 3")),
          ),
        ),
      ],
    );
  }
}
