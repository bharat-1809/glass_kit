import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glass_kit/src/circle_clipper.dart';
import 'border_painter.dart';
import 'constants.dart';

/// A widget that combines common painting, sizing and positioning widgets
/// to implement Glass Morphism.
///
/// A GlassContainer surrounds the child in a [Container] with necessary
/// decoration properties like [color], [gradient], [borderRadius] and [shape].
/// Preference is given to [gradient] and [borderGradient] during painting.
///
/// GlassContainer paints border using [CustomPaint] with [RectBorderPainter]
/// or [CircleBorderPainter] depending on the box shape.
///
/// [BackdropFilter], frosted layer and container are stacked and clipped using
/// [ClipOval] or [ClipRRect] to implement the Glass Effect

class GlassContainer extends StatelessWidget {
  /// Creates a widget by combining common painting, sizing, and positioning widgets
  /// to implement Glass Morphism.
  ///
  /// * The arguments `height` and `width` must not be `null`.
  /// * Both [color] and [gradient] cannot be `null`. Same goes for [borderColor] and
  ///   [borderGradient]. Preference is given to [gradient] during painting.
  /// * The [borderRadius] argument must be `null` if the [shape] is [BoxShape.Circle]
  /// * By default [borderWidth] is `1.0`, [isFrosted] is set to `false` and [blur] value
  ///   is set to `12.0`.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// The [shape] argument must not be `null`.
  GlassContainer({
    Key? key,
    this.child,
    this.width,
    this.color,
    this.height,
    this.margin,
    this.padding,
    double? blur,
    this.gradient,
    this.alignment,
    this.boxShadow,
    this.transform,
    this.borderColor,
    double? elevation,
    Color? shadowColor,
    double? borderWidth,
    this.borderGradient,
    bool? isFrostedGlass,
    double? frostedOpacity,
    this.transformAlignment,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  })  : shape = shape,
        blur = blur ?? kBlur,
        borderWidth = borderWidth ?? kBorderWidth,
        isFrostedGlass = isFrostedGlass ?? kIsFrosted,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        assert(color != null || gradient != null,
            'Both color and gradient cannot be null\n'),
        assert(borderColor != null || borderGradient != null,
            'Both borderColor and borderGradient cannot be null\n'),
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  /// Creates a widget that extends [GlassContainer] to implement a clear glass
  /// effect.
  /// Its a default implementation of the effect with editable decorations
  ///
  /// * If `color` and `gradient` are null, default value is assigned to gradient.
  ///   Same goes for `borderColor` and `borderGradient`.
  /// * Default values are assigned to [borderWidth], [blur], [elevation], and
  ///   [shadowColor] properties if not specified.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// See [Constants](https://pub.dev/documentation/glass_kit/latest/glass_kit/glass_kit-library.html#constants)
  GlassContainer.clearGlass({
    Key? key,
    double? height,
    double? width,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Gradient? gradient,
    Color? color,
    BorderRadius? borderRadius,
    double? borderWidth,
    Gradient? borderGradient,
    Color? borderColor,
    double? blur,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    Widget? child,
    List<BoxShadow>? boxShadow,
  })  : height = height,
        width = width,
        isFrostedGlass = false,
        frostedOpacity = 0.0,
        blur = blur ?? kBlur,
        gradient = gradient ?? (color == null ? kGradientFill : null),
        color = color,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        borderColor = borderColor,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        borderWidth = borderWidth ?? kBorderWidth,
        margin = margin,
        padding = padding,
        shape = shape,
        transform = transform,
        transformAlignment = transformAlignment,
        alignment = alignment,
        child = child,
        boxShadow = boxShadow,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  /// Creates a widget that extends [GlassContainer] to implement a frosted glass
  /// effect.
  /// Its a default implementation of the effect with editable decorations
  ///
  /// * If `color` and `gradient` are null, default value is assigned to gradient.
  ///   Same goes for `borderColor` and `borderGradient`.
  /// * Default values are assigned to [borderWidth], [blur], [elevation], [frostedOpacity] and
  ///   [shadowColor] properties if not specified.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// See [Constants](https://pub.dev/documentation/glass_kit/latest/glass_kit/glass_kit-library.html#constants)
  GlassContainer.frostedGlass({
    Key? key,
    double? height,
    double? width,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Gradient? gradient,
    Color? color,
    BorderRadius? borderRadius,
    double? borderWidth,
    Gradient? borderGradient,
    Color? borderColor,
    double? blur,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    double? frostedOpacity,
    Widget? child,
    List<BoxShadow>? boxShadow,
  })  : height = height,
        width = width,
        isFrostedGlass = true,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        blur = blur ?? kBlur,
        gradient = gradient ?? (color == null ? kGradientFill : null),
        color = color,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        borderColor = borderColor,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        borderWidth = borderWidth ?? kBorderWidth,
        margin = margin,
        padding = padding,
        shape = shape,
        transform = transform,
        transformAlignment = transformAlignment,
        alignment = alignment,
        child = child,
        boxShadow = boxShadow,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  /// The [child] contained by the GlassContainer.
  final Widget? child;

  /// The height of the GlassContainer
  final double? height;

  // The width of the GlassContainer
  final double? width;

  /// The color to fill in the background of the box.
  ///
  /// The color is filled into the [shape] of the box (e.g., either a rectangle,
  /// potentially with a [borderRadius], or a circle).
  ///
  /// This is ignored if [gradient] is non-null.
  final Color? color;

  /// A gradient to use when filling the box.
  ///
  /// If this is specified, [color] has no effect.
  final Gradient? gradient;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// Applies only to boxes with rectangular shapes; Must be null if [shape] is
  /// [BoxShape.circle].
  final BorderRadius? borderRadius;

  /// The strokeWidth of the border
  ///
  /// By default its value is `1.0`
  final double borderWidth;

  /// A gradient to use when painting the border
  ///
  /// If this is specified [borderColor] has no effect
  final Gradient? borderGradient;

  /// The color to fill in the border
  ///
  /// This is ignored if [borderGradient] is non-null
  final Color? borderColor;

  /// The value of sigmaX and sigmaY properties of Gaussian Blur.
  /// In simple words its the extent to which the backdrop of GlassContainer
  /// is blurred
  ///
  /// By default its value is `12.0`
  final double blur;

  /// Whether the GlassContainer will have frosted effect or not.
  ///
  /// By default it is set to `false`.
  final bool isFrostedGlass;

  /// Opacity value of the frosted layer.
  /// Specifically its the opacity of the white-noise image used for
  /// the effect.
  ///
  /// By default its value is `0.10`
  final double frostedOpacity;

  /// The shape to fill the background [color], [gradient] into and
  /// to cast as the shadow. The [heigth] is used as the diameter of the circle
  ///
  /// If this is [BoxShape.circle] then [borderRadius] must be `null`.
  final BoxShape shape;

  /// The transformation matrix to apply before painting the GlassContainer.
  final Matrix4? transform;

  /// The alignment of the origin, relative to the size of the GlassContainer,
  /// if [transform] is specified.
  ///
  /// When [transform] is null, the value of this property is ignored.
  ///
  /// See also:
  ///
  ///  * [Transform.alignment], which is set by this property.
  final AlignmentGeometry? transformAlignment;

  /// Align the [child] within the GlassContainer.
  ///
  /// If non-null, the GlassContainer will position its
  /// child within itself according to the given value.
  ///
  /// Ignored if [child] is null.
  final AlignmentGeometry? alignment;

  /// Empty space to inscribe inside the GlassContainer. The [child], if any, is
  /// placed inside this padding.
  final EdgeInsetsGeometry? padding;

  /// Empty space to surround the GlassContainer's decoration and child.
  final EdgeInsetsGeometry? margin;

  /// A list of shadows cast by this container behind it.
  ///
  /// The shadow follows the [shape] of the container.
  final List<BoxShadow>? boxShadow;

  /// Returns an empty [Container] or [_FrostedContainer] depending on the
  /// [isFrosted] flag and the [frostedOpacity] property.
  /// If the app is running on web then also a container is returned
  Widget get _frostedContainer {
    if (!isFrostedGlass || frostedOpacity == 0.0 || kIsWeb) {
      return SizedBox.shrink();
    } else {
      return LayoutBuilder(builder: (context, constraints) {
        final height = getHeight(constraints);
        final width = getWidth(constraints);

        return _FrostedWidget(
          height: height,
          frostedOpacity: frostedOpacity,
          width: _isCircle ? height : width,
        );
      });
    }
  }

  /// Returns a [BackdropFilter] with the Gaussian Blur
  BackdropFilter get _backdropFilterContainer {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: LayoutBuilder(builder: (context, constraints) {
        final height = getHeight(constraints);
        final width = getWidth(constraints);
        return Container(
          height: height,
          width: _isCircle ? height : width,
          decoration: BoxDecoration(shape: shape, color: Colors.transparent),
        );
      }),
    );
  }

  /// If its color-only-border, then return [Border] to be used
  /// in the decoration of the container.
  Border? get _border {
    if (_colorOnlyBorder || kIsWeb) {
      assert(borderColor != null);
      return Border.all(color: borderColor!, width: borderWidth);
    } else {
      return null;
    }
  }

  bool get _isCircle => shape == BoxShape.circle;
  bool get _colorOnlyBorder => borderGradient == null;

  double? getHeight([BoxConstraints? constraints]) =>
      height ??
      (constraints?.hasBoundedHeight ?? false ? constraints!.maxHeight : null);
  double? getWidth([BoxConstraints? constraints]) =>
      width ??
      (constraints?.hasBoundedWidth ?? false ? constraints!.maxWidth : null);

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    // Enclose the child within a container with padding, alignment and decoration
    current = Container(
      height: height,
      padding: padding,
      alignment: alignment,
      width: _isCircle ? height : width,
      child: SizedBox.expand(child: current),
      decoration: BoxDecoration(
        shape: shape,
        color: color,
        border: _border,
        gradient: gradient,
        borderRadius: borderRadius,
      ),
    );

    // If the border is gradient border then paint the border according to the shape
    // Incase the app is compiled to run on web then CustomPaint wont work
    if (!_colorOnlyBorder && !kIsWeb) {
      assert(borderGradient != null);
      if (_isCircle) {
        assert(borderRadius == null);
        current = CustomPaint(
          child: current,
          painter: CircleBorderPainter(
            strokeWidth: borderWidth,
            gradient: borderGradient!,
          ),
        );
      } else {
        assert(borderRadius != null);
        current = CustomPaint(
          child: current,
          painter: RectBorderPainter(
            strokeWidth: borderWidth,
            gradient: borderGradient!,
            borderRadius: borderRadius!,
          ),
        );
      }
    }

    // Commbine the backdropFilter, frosted layer, and container into a stack
    current = Stack(
      alignment: Alignment.center,
      children: [_backdropFilterContainer, _frostedContainer, current],
    );

    // Clip the current container depending on the shape
    if (_isCircle) {
      assert(borderRadius == null);
      current = ClipOval(child: current, clipper: CircleClipper());
    } else {
      assert(borderRadius != null);
      current = ClipRRect(
        child: current,
        borderRadius: borderRadius ?? BorderRadius.zero,
      );
    }

    current = Container(
      height: height,
      width: _isCircle ? height : width,
      child: current,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      decoration: BoxDecoration(
        shape: shape,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
    );

    return current;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
    properties.add(DiagnosticsProperty<double>('borderWidth', borderWidth,
        defaultValue: kBorderWidth, ifNull: 'no border width'));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
        defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('isfrostedGlass', isFrostedGlass,
        defaultValue: kIsFrosted, ifNull: '<indeterminate>'));
    properties.add(PercentProperty('frostedOpacity', frostedOpacity,
        showName: true, ifNull: '<indeterminate>'));
    properties.add(EnumProperty<BoxShape>('shape', shape,
        defaultValue: BoxShape.rectangle, level: DiagnosticLevel.info));
    properties
        .add(DiagnosticsProperty<double>('blur', blur, defaultValue: kBlur));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        defaultValue: null, showName: false));
    properties.add(IterableProperty<BoxShadow>('boxShadow', boxShadow,
        defaultValue: null, style: DiagnosticsTreeStyle.whitespace));

    if (gradient != null) {
      properties.add(DiagnosticsProperty<Gradient>('bg', gradient));
    } else {
      properties.add(ColorProperty('bg', color));
    }

    if (borderGradient != null) {
      properties
          .add(DiagnosticsProperty<Gradient>('borderGradient', borderGradient));
    } else {
      properties.add(ColorProperty('borderColor', borderColor));
    }
  }
}

/// A widget to create the frosted layer.
class _FrostedWidget extends StatelessWidget {
  /// Creates a Forsted Layer Widget
  _FrostedWidget({
    Key? key,
    this.width,
    this.height,
    required this.frostedOpacity,
  }) : super(key: key);

  /// The opacity of the layer
  final double frostedOpacity;

  /// The height of the image container
  final double? height;

  /// The width of the image container
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: frostedOpacity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Image(
            image: ResizeImage(
              AssetImage(kNoiseImage, package: 'glass_kit'),
              height: height?.toInt(),
              width: width?.toInt(),
            ),
            excludeFromSemantics: true,
            fit: BoxFit.cover,
            color: kFrostBlendColor,
            colorBlendMode: kFrostBlendMode,
          );
        },
      ),
    );
  }
}
