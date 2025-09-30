import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassWidget extends StatelessWidget {
  GlassWidget({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      isFrostedGlass: true,
      frostedOpacity: 0.05,
      blur: 20,
      gradient: LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.25),
          Colors.white.withValues(alpha: 0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.60),
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.60),
        ],
        stops: [0.0, 0.45, 0.55, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 20.0)
      ],
      borderRadius: BorderRadius.circular(25.0),
      padding: EdgeInsets.all(16.0),
      child: child,
    );
  }
}
