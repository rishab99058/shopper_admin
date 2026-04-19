import 'package:flutter/material.dart';
import 'package:shopper_admin/utils/constants/colors.dart';
import 'package:shopper_admin/utils/constants/sizes.dart';

class App3DCard extends StatefulWidget {
  const App3DCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSizes.md),
    this.borderRadius = AppSizes.cardRadiusLg,
    this.onTap,
    this.backgroundColor,
    this.gradient,
    this.depth = 10.0,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double depth;

  @override
  State<App3DCard> createState() => _App3DCardState();
}

class _App3DCardState extends State<App3DCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: isHovered
              ? (Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective
                  ..rotateX(-0.05)
                  ..rotateY(0.05)
                  ..scale(1.02))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color:
                widget.backgroundColor ??
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkGrey
                    : AppColors.light),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: widget.gradient,
            boxShadow: [
              // High-end 3D shadow system
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.2 : 0.1),
                offset: Offset(
                  0,
                  isHovered ? widget.depth * 1.5 : widget.depth,
                ),
                blurRadius: isHovered ? 30 : 20,
                spreadRadius: -5,
              ),
              if (isHovered)
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  offset: const Offset(0, 0),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(padding: widget.padding, child: widget.child),
          ),
        ),
      ),
    );
  }
}
