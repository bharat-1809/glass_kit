import 'dart:ui';

import 'package:flutter/material.dart';
import 'border_painter.dart';
import '../glass_kit.dart';

class GlassContainer extends StatelessWidget {
  GlassContainer({
    Key? key,
    required this.height,
    required this.width,
    this.color,
    this.gradient,
    BorderRadius? borderRadius,
    double? borderWidth,
    this.borderColor,
    this.borderGradient,
    double? blur,
    bool? isFrostedGlass,
    double? frostedOpacity,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    this.child,
  })  : this.borderWidth = borderWidth ?? kBorderWidth,
        this.blur = blur ?? kBlur,
        this.isFrostedGlass = isFrostedGlass ?? kIsFrosted,
        this.frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        this.elevation = elevation ?? kElevation,
        this.shadowColor = shadowColor ?? kShadowColor,
        this.shape = shape,
        this.borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        assert(color != null || gradient != null,
            'Both color and gradient cannot be null\n'),
        assert(borderColor != null || borderGradient != null,
            'Both borderColor and borderGradient cannot be null\n'),
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]'),
        super(key: key);

  final Widget? child;
  final double height;
  final double width;
  final Color? color;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Gradient? borderGradient;
  final Color? borderColor;
  final double blur;
  final bool isFrostedGlass;
  final double frostedOpacity;
  final BoxShape shape;
  final double elevation;
  final Color shadowColor;

  Widget _frostedContainer() {
    if (!isFrostedGlass || frostedOpacity == 0.0) {
      return Container();
    } else {
      return _FrostedWidget(
        frostedOpacity: frostedOpacity,
        height: height,
        width: width,
      );
    }
  }

  BackdropFilter _backdropFilterContainer() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }

  Border? _getBorder() {
    if (_colorOnlyBorder) {
      assert(borderColor != null);
      return Border.all(
        color: borderColor!,
        width: borderWidth,
      );
    } else {
      return null;
    }
  }

  bool get _isCircle => shape == BoxShape.circle;
  bool get _colorOnlyBorder => borderGradient == null;

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    current = Container(
      height: height,
      width: width,
      child: current,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: _getBorder(),
        shape: shape,
      ),
    );

    if (!_colorOnlyBorder) {
      assert(borderGradient != null);
      if (_isCircle) {
        assert(borderRadius == null);
        current = CustomPaint(
          painter: CircleBorderPainter(
            radius: height / 2,
            gradient: borderGradient!,
            strokeWidth: borderWidth,
          ),
          child: current,
        );
      } else {
        assert(borderRadius != null);
        current = CustomPaint(
          painter: RectBorderPainter(
            radius: borderRadius!.topLeft,
            strokeWidth: borderWidth,
            gradient: borderGradient!,
          ),
          child: current,
        );
      }
    }

    current = Stack(
      alignment: Alignment.center,
      children: [
        _backdropFilterContainer(),
        _frostedContainer(),
        current,
      ],
    );

    current = PhysicalModel(
      color: Colors.transparent,
      borderRadius: borderRadius,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      child: current,
    );

    if (_isCircle) {
      assert(borderRadius == null);
      current = ClipOval(child: current);
    } else {
      assert(borderRadius != null);
      current = ClipRRect(borderRadius: borderRadius, child: current);
    }

    current = Container(
      child: current,
    );

    return current;
  }
}

class _FrostedWidget extends StatelessWidget {
  _FrostedWidget({
    Key? key,
    required this.frostedOpacity,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double frostedOpacity;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: frostedOpacity,
      child: Image(
        image: ResizeImage(
          AssetImage(kNoiseImage, package: "glass_kit"),
          height: height.toInt(),
          width: width.toInt(),
        ),
        fit: BoxFit.cover,
        color: Colors.white,
        colorBlendMode: BlendMode.difference,
      ),
    );
  }
}
