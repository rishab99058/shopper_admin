import 'package:flutter/material.dart';
import 'package:shopper_admin/common/widgets/layout/container/appBox.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          // --- TOP CLUSTER (Boxes 1-4) ---
          Expanded(
            flex: 2,
            child: Row(
              children: [
                // Box 1
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

                // Sub-Column for 2, 3, 4
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Box 2
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

                      // Box 3 & 4 Row
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

          // --- BOTTOM ROW (Boxes 5-6) ---
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppBox(
                    child: const Center(child: Text("BOX 5")),
                    onTap: () {},
                    width: double.infinity,
                    height: double.infinity,
                    backgroundColor: Colors.red.withAlpha(30),
                  ),
                ),
                const SizedBox(width: 20),
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
          ),
        ],
      ),
    );
  }
}
