import 'package:flutter/material.dart';

class AuthenticationDesktopLaptop extends StatelessWidget {
  const AuthenticationDesktopLaptop({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.widget,
  });

  final String imageUrl;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              border: Border(
                right: BorderSide(color: Colors.grey.withOpacity(1), width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Right Side - Login Form (60-70% width)
        Expanded(
          flex: 3, // ~60% width
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                padding: const EdgeInsets.all(32.0),
                child: widget,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
