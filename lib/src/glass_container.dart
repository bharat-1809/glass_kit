import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'border_painter.dart';
import 'constants.dart';

class GlassContainer extends StatelessWidget {
  GlassContainer({
    Key key,
    @required this.height,
    @required this.width,
    this.alignment,
    this.transform,
    this.transformAlignment,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    BorderRadius borderRadius,
    double borderWidth,
    this.borderColor,
    this.borderGradient,
    double blur,
    bool isFrostedGlass,
    double frostedOpacity,
    double elevation,
    Color shadowColor,
    BoxShape shape = BoxShape.rectangle,
    this.child,
  })  : borderWidth = borderWidth ?? kBorderWidth,
        blur = blur ?? kBlur,
        isFrostedGlass = isFrostedGlass ?? kIsFrosted,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
      elevation = elevation ?? kElevation,
        shadowColor = shadowColor ?? kShadowColor,
        shape = shape,
        borderRadius = shape == BoxShape.rectangle ? (borderRadius ?? kBorderRadius) : null,
        assert(color != null || gradient != null, 'Both color and gradient cannot be null\n'),
        assert(borderColor != null || borderGradient != null,
            'Both borderColor and borderGradient cannot be null\n'),
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]'),
        super(key: key);

  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Gradient gradient;
  final BorderRadius borderRadius;
  final double borderWidth;
  final Gradient borderGradient;
  final Color borderColor;
  final double blur;
  final bool isFrostedGlass;
  final double frostedOpacity;
  final BoxShape shape;
  final double elevation;
  final Color shadowColor;
  final Matrix4 transform;
  final AlignmentGeometry alignment;
  final AlignmentGeometry transformAlignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  Widget _frostedContainer() {
    if (!isFrostedGlass || frostedOpacity == 0.0) {
      return Container();
    } else {
      return _FrostedWidget(
        frostedOpacity: frostedOpacity,
        height: height,
        width: _isCircle ? height : width,
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

  Border _getBorder() {
    if (_colorOnlyBorder) {
      assert(borderColor != null);
      return Border.all(
        color: borderColor,
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
    Widget current = child;

    current = Container(
      // height: height,
      // width: _isCircle ? height : width,
      padding: padding,
      child: current,
      alignment: alignment,
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
            gradient: borderGradient,
            strokeWidth: borderWidth,
          ),
          child: current,
        );
      } else {
        assert(borderRadius != null);
        current = CustomPaint(
          painter: RectBorderPainter(
            radius: borderRadius.topLeft,
            strokeWidth: borderWidth,
            gradient: borderGradient,
          ),
          child: current,
        );
      }
    }

    current = Stack(
      alignment: Alignment.center,
      children: [_backdropFilterContainer(), _frostedContainer(), current],
    );

    if (_isCircle) {
      assert(borderRadius == null);
      current = ClipOval(child: current);
    } else {
      assert(borderRadius != null);
      current = ClipRRect(borderRadius: borderRadius, child: current);
    }

    current = PhysicalModel(
      color: Colors.transparent,
      borderRadius: borderRadius,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      child: current,
    );

    current = Container(
      height: height,
      width: _isCircle ? height : width,
      child: current,
      transform: transform,
      margin: margin,
      transformAlignment: transformAlignment,
    );

    return current;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('borderWidth', borderWidth, defaultValue: kBorderWidth, ifNull: 'no border width'));
    properties.add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, showName: false, defaultValue: null));
    if (gradient != null)
      {properties.add(DiagnosticsProperty<Gradient>('bg', gradient));}
    else
      {properties.add(DiagnosticsProperty<Color>('bg', color));}
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding, defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin, defaultValue: null));
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
    if (borderGradient != null) {
      properties.add(DiagnosticsProperty<Gradient>('borderGradient', borderGradient));
    } else {
      properties.add(DiagnosticsProperty<Color>('borderColor', borderColor));
    }
    properties.add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius, ifNull: 'BoxShape is Circle'));
    properties.add(DiagnosticsProperty<bool>('isfrostedGlass', isFrostedGlass, defaultValue: kIsFrosted, ifNull: '<indeterminate>'));
    properties.add(PercentProperty('frostedOpacity', frostedOpacity, showName: true, ifNull: '<indeterminate>'));
    properties.add(DiagnosticsProperty<double>('blur', blur, defaultValue: kBlur));
    properties.add(EnumProperty<BoxShape>('shape', shape, defaultValue: BoxShape.rectangle, level: DiagnosticLevel.info));
    properties.add(DiagnosticsProperty<Color>('shadowColor', shadowColor, defaultValue: kShadowColor));
    properties.add(DiagnosticsProperty<double>('elevation', elevation, defaultValue: kElevation));
  }
}

class _FrostedWidget extends StatelessWidget {
  _FrostedWidget({
    Key key,
    @required this.frostedOpacity,
    @required this.height,
    @required this.width,
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
          AssetImage(kNoiseImage, package: 'glass_kit'),
          height: height.toInt(),
          width: width.toInt(),
        ),
        excludeFromSemantics: true,
        fit: BoxFit.cover,
        color: Colors.white,
        colorBlendMode: BlendMode.difference,
      ),
    );
  }
}
