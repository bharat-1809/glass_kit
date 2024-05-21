import 'package:flutter/widgets.dart';

/// A [CustomClipper] to clip a widget in a circle shape
///
/// It takes the smallest side of the widget as diameter of the circle
///
class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final radius = size.shortestSide / 2;
    final center = Offset(size.width / 2, size.height / 2);

    return Rect.fromCircle(center: center, radius: radius);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
