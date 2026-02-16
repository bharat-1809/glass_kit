import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

/// Cached shader program for reuse across all [NoiseShaderWidget] instances.
ui.FragmentProgram? _cachedNoiseProgram;

/// Whether the shader has already failed to load.
///
/// Used to avoid repeated load attempts
bool _shaderLoadFailed = false;

/// Loads and caches the noise shader program.
///
/// This is an internal API used by [GlassContainer.warmUp].
/// Returns `true` if successful, `false` if loading failed.
/// Safe to call multiple times - returns immediately if already cached.
@internal
Future<bool> loadNoiseShader() async {
  if (_cachedNoiseProgram != null) return true;
  if (_shaderLoadFailed) return false;

  try {
    _cachedNoiseProgram = await ui.FragmentProgram.fromAsset(kNoiseShaderPath);
    return true;
  } catch (_) {
    _shaderLoadFailed = true;
    return false;
  }
}

/// A [CustomPainter] that renders noise using a fragment shader.
///
/// This painter draws a noise texture that can be used for frosted glass effects.
/// It uses a fragment shader ([kNoiseShaderPath]) for efficient GPU-based rendering.
///
/// The noise pattern can be customized via:
/// - [scale]: Controls the size of noise blocks (default: [kNoiseShaderScale])
/// - [opacity]: Controls the visibility of the noise (default: [kFrostedOpacity])
/// - [blendMode]: Controls how noise composites with content (default: [kFrostBlendMode])
///
/// Example:
/// ```dart
/// CustomPaint(
///   painter: NoisePainter(
///     shader,
///     scale: 2.0,
///     opacity: 0.15,
///   ),
///   child: MyWidget(),
/// )
/// ```
class NoisePainter extends CustomPainter with Diagnosticable {
  /// Creates a [NoisePainter] with the given shader and configuration.
  ///
  /// The [shader] parameter is required and must be a valid fragment shader
  /// loaded from [kNoiseShaderPath].
  NoisePainter(
    this.shader, {
    this.scale = kNoiseShaderScale,
    this.opacity = kFrostedOpacity,
    this.blendMode = kFrostBlendMode,
  });

  /// The fragment shader used to generate noise.
  ///
  /// This shader should be loaded from [kNoiseShaderPath] using
  /// [ui.FragmentProgram.fromAsset].
  final ui.FragmentShader shader;

  /// Controls the scale of the noise pattern.
  ///
  /// Higher values create larger noise blocks.
  /// Lower values create finer, more subtle noise patterns.
  /// Defaults to [kNoiseShaderScale].
  final double scale;

  /// The opacity of the noise effect (0.0 to 1.0).
  ///
  /// Defaults to [kFrostedOpacity].
  final double opacity;

  /// The blend mode used when compositing the noise.
  ///
  /// Defaults to [kFrostBlendMode].
  final BlendMode blendMode;

  @override
  void paint(Canvas canvas, Size size) {
    // Set uniforms in declaration order matching the shader
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, scale);
    shader.setFloat(3, opacity);

    final paint = Paint()
      ..shader = shader
      ..blendMode = blendMode;

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant NoisePainter oldDelegate) =>
      oldDelegate.scale != scale ||
      oldDelegate.opacity != opacity ||
      oldDelegate.blendMode != blendMode;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DoubleProperty('scale', scale, defaultValue: kNoiseShaderScale));
    properties
        .add(DoubleProperty('opacity', opacity, defaultValue: kFrostedOpacity));
    properties.add(EnumProperty<BlendMode>('blendMode', blendMode,
        defaultValue: kFrostBlendMode));
  }
}

/// A widget that renders a noise effect using a fragment shader.
///
/// Handles async shader loading from [kNoiseShaderPath] and renders the noise
/// effect behind its child. Uses [AnimatedSwitcher] for a smooth fade-in
/// transition when the shader becomes available.
///
/// If the shader fails to load (e.g., on unsupported platforms), it gracefully
/// falls back to rendering just the child without the noise effect.
///
/// To eliminate the fade-in delay, call [GlassContainer.warmUp] before using
/// this widget. The shader will be preloaded and ready to use when the widget is built.
///
/// ## Configuration
///
/// - [scale]: Controls the noise pattern size (default: [kNoiseShaderScale])
/// - [opacity]: Controls noise visibility (default: [kFrostedOpacity])
/// - [blendMode]: Controls noise compositing (default: [kFrostBlendMode])
/// - [fadeDuration]: Duration of the fade-in animation (default: [kNoiseShaderFadeDuration])
///
class NoiseShaderWidget extends StatefulWidget {
  /// Creates a [NoiseShaderWidget].
  ///
  /// The [child] parameter is required and will be rendered on top of the
  /// noise effect.
  const NoiseShaderWidget({
    required this.child,
    this.opacity = kFrostedOpacity,
    this.scale = kNoiseShaderScale,
    this.blendMode = kFrostBlendMode,
    super.key,
  });

  /// The child widget to render on top of the noise effect.
  final Widget child;

  /// The opacity of the noise effect (0.0 to 1.0).
  ///
  /// Defaults to [kFrostedOpacity].
  final double opacity;

  /// Controls the scale of the noise pattern.
  ///
  /// Higher values create larger noise blocks.
  /// Lower values create finer, more subtle noise patterns.
  /// Defaults to [kNoiseShaderScale].
  final double scale;

  /// The blend mode used when compositing the noise.
  ///
  /// Defaults to [kFrostBlendMode].
  final BlendMode blendMode;

  @override
  State<NoiseShaderWidget> createState() => _NoiseShaderWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DoubleProperty('opacity', opacity, defaultValue: kFrostedOpacity));
    properties
        .add(DoubleProperty('scale', scale, defaultValue: kNoiseShaderScale));
    properties.add(EnumProperty<BlendMode>('blendMode', blendMode,
        defaultValue: kFrostBlendMode));
  }
}

class _NoiseShaderWidgetState extends State<NoiseShaderWidget> {
  ui.FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    _loadShader();
  }

  Future<void> _loadShader() async {
    final success = await loadNoiseShader();
    if (!success) return;

    final program = _cachedNoiseProgram;
    if (program == null) return;

    safeSetState(() => _shader = program.fragmentShader());
  }

  @override
  Widget build(BuildContext context) {
    final shader = _shader;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      // Use custom layoutBuilder to prevent AnimatedSwitcher's default Stack
      // from loosening tight constraints. This ensures parent constraints
      // (e.g., from Expanded) are properly propagated to children.
      layoutBuilder: (currentChild, previousChildren) {
        return currentChild ?? const SizedBox.shrink();
      },
      child: shader != null
          ? CustomPaint(
              key: const ValueKey('gk_noise'),
              painter: NoisePainter(
                shader,
                scale: widget.scale,
                opacity: widget.opacity,
                blendMode: widget.blendMode,
              ),
              child: widget.child,
            )
          : widget.child,
    );
  }

  void safeSetState(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(callback);
      }
    });
  }
}
