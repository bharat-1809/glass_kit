import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'border_painter.dart';
import 'circle_clipper.dart';
import 'constants.dart';
import 'noise_effect.dart';

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
/// ## Pre-caching Shaders
///
/// For frosted glass effects, GlassContainer uses GPU shaders that need to be
/// loaded asynchronously. To eliminate the fade-in delay on first render, call
/// [warmUp] before using frosted glass:
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await GlassContainer.warmUp();
///   runApp(MyApp());
/// }
/// ```
///
/// **Note:** Frosted glass effects are not supported on Flutter Web due to
/// platform limitations with fragment shaders.
///
/// ## Troubleshooting
///
/// If you encounter any issues with frosted glass shaders, you can use
/// [LegacyGlassContainer] as a fallback (which uses an image-based noise
/// effect instead of shaders) and report the problem:
/// https://github.com/bharat-1809/glass_kit/issues/new?template=bug_report.md
///
class GlassContainer extends StatelessWidget {
  /// Creates a widget by combining common painting, sizing, and positioning widgets
  /// to implement Glass Morphism.
  ///
  /// * Both [color] and [gradient] cannot be `null`. Same goes for [borderColor] and
  ///   [borderGradient]. Preference is given to [gradient] during painting.
  /// * The [borderRadius] argument must be `null` if the [shape] is [BoxShape.circle]
  /// * By default [borderWidth] is `1.0`, [isFrosted] is set to `false` and [blur] value
  ///   is set to `12.0`.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// The [shape] argument must not be `null`.
  GlassContainer({
    Key? key,
    this.color,
    this.margin,
    this.padding,
    double? blur,
    double? width,
    this.gradient,
    double? height,
    this.alignment,
    this.boxShadow,
    this.transform,
    this.borderColor,
    required this.child,
    double? borderWidth,
    this.borderGradient,
    bool? isFrostedGlass,
    double? frostedOpacity,
    this.transformAlignment,
    BorderRadius? borderRadius,
    BoxConstraints? constraints,
    BoxShape shape = BoxShape.rectangle,
  })  : shape = shape,
        blur = blur ?? kBlur,
        borderWidth = borderWidth ?? kBorderWidth,
        isFrostedGlass = isFrostedGlass ?? kIsFrosted,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        assert(color != null || gradient != null,
            'Both color and gradient cannot be null\n'),
        assert(borderColor != null || borderGradient != null,
            'Both borderColor and borderGradient cannot be null\n'),
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        assert(constraints == null || constraints.debugAssertIsValid()),
        super(key: key);

  /// Creates a widget that extends [GlassContainer] to implement a clear glass
  /// effect.
  /// Its a default implementation of the effect with editable decorations
  ///
  /// * If `color` and `gradient` are null, default value is assigned to gradient.
  ///   Same goes for `borderColor` and `borderGradient`.
  /// * Default values are assigned to [borderWidth] and [blur] properties if not specified.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// See [Constants](https://pub.dev/documentation/glass_kit/latest/glass_kit/glass_kit-library.html#constants)
  GlassContainer.clearGlass({
    Key? key,
    double? width,
    double? height,
    Color? color,
    double? blur,
    Matrix4? transform,
    Gradient? gradient,
    Color? borderColor,
    double? borderWidth,
    required Widget child,
    Gradient? borderGradient,
    BorderRadius? borderRadius,
    BoxConstraints? constraints,
    List<BoxShadow>? boxShadow,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    AlignmentGeometry? transformAlignment,
    BoxShape shape = BoxShape.rectangle,
  })  : color = color,
        shape = shape,
        child = child,
        margin = margin,
        padding = padding,
        frostedOpacity = 0.0,
        blur = blur ?? kBlur,
        alignment = alignment,
        transform = transform,
        isFrostedGlass = false,
        boxShadow = boxShadow,
        borderColor = borderColor,
        transformAlignment = transformAlignment,
        borderWidth = borderWidth ?? kBorderWidth,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        gradient = gradient ?? (color == null ? kGradientFill : null),
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        assert(constraints == null || constraints.debugAssertIsValid()),
        super(key: key);

  /// Creates a widget that extends [GlassContainer] to implement a frosted glass
  /// effect.
  /// Its a default implementation of the effect with editable decorations
  ///
  /// * If `color` and `gradient` are null, default value is assigned to gradient.
  ///   Same goes for `borderColor` and `borderGradient`.
  /// * Default values are assigned to [borderWidth], [blur], and [frostedOpacity]
  ///   properties if not specified.
  /// * If the shape is [BoxShape.circle] then [height] is used as the diameter.
  ///
  /// See [Constants](https://pub.dev/documentation/glass_kit/latest/glass_kit/glass_kit-library.html#constants)
  GlassContainer.frostedGlass({
    Key? key,
    Color? color,
    double? blur,
    double? width,
    double? height,
    Matrix4? transform,
    Gradient? gradient,
    Color? borderColor,
    double? borderWidth,
    required Widget child,
    double? frostedOpacity,
    Gradient? borderGradient,
    BorderRadius? borderRadius,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    AlignmentGeometry? transformAlignment,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? boxShadow,
  })  : color = color,
        shape = shape,
        child = child,
        margin = margin,
        padding = padding,
        blur = blur ?? kBlur,
        isFrostedGlass = true,
        transform = transform,
        alignment = alignment,
        boxShadow = boxShadow,
        borderColor = borderColor,
        transformAlignment = transformAlignment,
        borderWidth = borderWidth ?? kBorderWidth,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        gradient = gradient ?? (color == null ? kGradientFill : null),
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        assert(constraints == null || constraints.debugAssertIsValid()),
        super(key: key);

  /// Preloads GPU shaders used by [GlassContainer] for frosted glass effects.
  ///
  /// Call this before using [GlassContainer] to eliminate the fade-in delay
  /// on first render of frosted glass effects.
  ///
  /// Returns `true` if shaders loaded successfully, `false` if loading failed
  ///
  /// ```dart
  /// await GlassContainer.warmUp();
  /// ```
  static Future<bool> warmUp() => loadNoiseShader();

  /// The [child] contained by the GlassContainer.
  final Widget child;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  final BoxConstraints? constraints;

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

  bool get _isCircle => shape == BoxShape.circle;
  bool get _colorOnlyBorder => borderGradient == null;

  /// Returns true if borderRadius is effectively zero (no rounding needed).
  bool get _isZeroBorderRadius =>
      borderRadius == null || borderRadius == BorderRadius.zero;

  /// Effective constraints: for circles, use height as both width and height (diameter).
  BoxConstraints? get _effectiveConstraints {
    if (constraints == null) return null;
    assert(constraints != null, 'constraints should not be null');

    if (_isCircle && constraints!.hasTightHeight) {
      // For circles, use height as diameter (both width and height)
      return constraints!.tighten(width: constraints!.maxHeight);
    }
    return constraints;
  }

  /// Returns a [Border] if using color-only border, otherwise null.
  Border? get _border {
    if (_colorOnlyBorder || kIsWeb) {
      assert(borderColor != null);
      return Border.all(color: borderColor!, width: borderWidth);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget current = child;

    // Inner container with gradient/color decoration and constraints
    // For circles, height is used as diameter (both width and height)
    current = Container(
      padding: padding,
      alignment: alignment,
      constraints: _effectiveConstraints,
      decoration: BoxDecoration(
        shape: shape,
        color: color,
        border: _border,
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: current,
    );

    // If the border is gradient border then paint the border according to the shape
    // Incase the app is compiled to run on web then CustomPaint wont work
    if (!_colorOnlyBorder && !kIsWeb) {
      assert(borderGradient != null);
      if (_isCircle) {
        assert(borderRadius == null);
        current = CustomPaint(
          painter: CircleBorderPainter(
            strokeWidth: borderWidth,
            gradient: borderGradient!,
          ),
          child: current,
        );
      } else {
        assert(borderRadius != null);
        current = CustomPaint(
          painter: RectBorderPainter(
            strokeWidth: borderWidth,
            gradient: borderGradient!,
            borderRadius: borderRadius!,
          ),
          child: current,
        );
      }
    }

    // Noise layer (if frosted glass, not on web)
    if (isFrostedGlass && frostedOpacity > 0 && !kIsWeb) {
      current = NoiseShaderWidget(
        opacity: frostedOpacity,
        child: current,
      );
    }

    // BackdropFilter for blur
    current = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: current,
    );

    // Clip based on shape
    if (_isCircle) {
      assert(borderRadius == null);
      current = ClipOval(clipper: CircleClipper(), child: current);
    } else if (_isZeroBorderRadius) {
      current = ClipRect(child: current);
    } else {
      assert(borderRadius != null);
      current = ClipRRect(
        borderRadius: borderRadius!,
        child: current,
      );
    }

    // Apply shadow decoration (paints behind, doesn't affect sizing)
    if (boxShadow != null) {
      current = DecoratedBox(
        decoration: BoxDecoration(
          shape: shape,
          boxShadow: boxShadow,
          borderRadius: borderRadius,
        ),
        child: current,
      );
    }

    // Apply margin
    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    // Apply transform
    if (transform != null) {
      current = Transform(
        transform: transform!,
        alignment: transformAlignment,
        child: current,
      );
    }

    return current;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'constraints', constraints,
        defaultValue: null));
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
