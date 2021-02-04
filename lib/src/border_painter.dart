import 'package:flutter/material.dart';

class RectBorderPainter extends CustomPainter {
  RectBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  }) : this._paint = Paint();

  final Paint _paint;
  final Radius radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
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

class CircleBorderPainter extends CustomPainter {
  CircleBorderPainter({
    required this.radius,
    required this.gradient,
    required this.strokeWidth,
  }) : this._paint = Paint();

  final Paint _paint;
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Rect outerCircle = Rect.fromCircle(center: rect.center, radius: radius);
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
