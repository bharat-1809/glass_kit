import 'package:flutter/material.dart';

/// The [CustomPainter] to paint the borders of RRect containers
///
/// Used by GlassContainer to paint the gradient borders
class RectBorderPainter extends CustomPainter {
  RectBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  }) : _paint = Paint();

  final Paint _paint;
  final Radius radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equal to size
    Rect outerRect = Offset.zero & size;
    RRect outerRRect = RRect.fromRectAndRadius(outerRect, radius);

    // create inner rectangle smaller by strokeWidth
    RRect innerRRect = outerRRect.deflate(strokeWidth);

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path outer = Path()..addRRect(outerRRect);
    Path inner = Path()..addRRect(innerRRect);
    Path path = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

/// The [CustomPainter] to paint the borders of circle shaped containers
///
/// Used by GlassContainer to paint the gradient borders
class CircleBorderPainter extends CustomPainter {
  CircleBorderPainter({
    required this.gradient,
    required this.strokeWidth,
  }) : _paint = Paint();

  final Paint _paint;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create an outer box enclosing the circel
    Rect rect = Offset.zero & size;

    // create an outer circle enclosing box
    Rect outerCircle =
        Rect.fromCircle(center: rect.center, radius: size.shortestSide / 2);

    // create an inner circle enclosing box
    Rect innerCircle = outerCircle.deflate(strokeWidth);

    // apply gradient shader
    _paint.shader = gradient.createShader(outerCircle);

    // create difference between outer and inner paths and draw it
    Path outer = Path()..addOval(outerCircle);
    Path inner = Path()..addOval(innerCircle);
    Path path = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
