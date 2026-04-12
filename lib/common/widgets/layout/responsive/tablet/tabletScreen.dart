import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/container/appBox.dart';

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800, // Increased height for vertical stacking of Box 5 and 6
      child: Column(
        children: [
          // --- TOP CLUSTER (Boxes 1-4) --- Same as Desktop
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: AppBox(
                    child: const Center(child: Text("BOX 1")),
                    onTap: () {},
                    width: double.infinity,
                    height: double.infinity,
                    backgroundColor: Colors.blue.withAlpha(50),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: AppBox(
                          child: const Center(child: Text("BOX 2")),
                          onTap: () {},
                          width: double.infinity,
                          height: double.infinity,
                          backgroundColor: Colors.orange.withAlpha(50),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AppBox(
                                child: const Center(child: Text("BOX 3")),
                                onTap: () {},
                                width: double.infinity,
                                height: double.infinity,
                                backgroundColor: Colors.red.withAlpha(50),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: AppBox(
                                child: const Center(child: Text("BOX 4")),
                                onTap: () {},
                                width: double.infinity,
                                height: double.infinity,
                                backgroundColor: Colors.green.withAlpha(50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Box 5
          Expanded(
            child: AppBox(
              child: const Center(child: Text("BOX 5")),
              onTap: () {},
              width: double.infinity,
              height: double.infinity,
              backgroundColor: Colors.red.withAlpha(30),
            ),
          ),
          const SizedBox(height: 20),

          // Box 6
          Expanded(
            child: AppBox(
              child: const Center(child: Text("BOX 6")),
              onTap: () {},
              width: double.infinity,
              height: double.infinity,
              backgroundColor: Colors.red.withAlpha(30),
            ),
          ),
        ],
      ),
    );
  }
}
