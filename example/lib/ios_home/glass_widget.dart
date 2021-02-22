import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassWidget extends StatelessWidget {
  GlassWidget({
    @required this.height,
    @required this.width,
    this.child,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        height: height,
        width: width,
        isFrostedGlass: true,
        frostedOpacity: 0.05,
        blur: 20,
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.60),
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.60),
          ],
          stops: [0.0, 0.45, 0.55, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25.0),
        child: child,
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
