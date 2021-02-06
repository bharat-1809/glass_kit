/// The default values used by the [GlassContainer]

import 'package:flutter/widgets.dart' show Color, BorderRadius, BlendMode;

/// The default value of the Gaussian Blur filter
const double kBlur = 10.0;

/// The constant value of the [borderRadius] property
const BorderRadius kBorderRadius = BorderRadius.zero;

/// The default value of the [borderWidth]
const double kBorderWidth = 1.0;

/// The default value of the [isFrosted] flag
const bool kIsFrosted = false;

/// The default value of the [frostedOpacity] property
const double kFrostedOpacity = 0.10;

/// The default [elevation] value
const double kElevation = 1.0;

/// The default [shadowColor]: Black with 20% opacity
const Color kShadowColor = Color(0x33000000);

/// The path of the white-noise image used for frost effect
const String kNoiseImage = 'assets/noise.png';

/// Blend Color for frosted layer
const Color kFrostBlendColor = Color(0xffffffff);

/// Blend mode for frosted layer
const BlendMode kFrostBlendMode = BlendMode.difference;
